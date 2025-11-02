#!/bin/bash
# Deploy Vibe Games to WordPress
# Reads credentials from .env in root folder

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}=== Vibe Games Deployment ===${NC}"
echo ""

# Load credentials from .env
ENV_FILE="../.env"
if [ ! -f "$ENV_FILE" ]; then
    # Try cryptolabs-ai-platform/.env
    ENV_FILE="../cryptolabs-ai-platform/.env"
fi

if [ ! -f "$ENV_FILE" ]; then
    echo -e "${RED}Error: .env file not found!${NC}"
    echo "Looking for: $ENV_FILE"
    exit 1
fi

# Source the .env file
export $(grep -v '^#' "$ENV_FILE" | grep -E 'SFTP_PASSWORD|SFTP_USER|SFTP_HOST' | xargs)

# Fallback to hardcoded values if not in .env
SFTP_HOST="${SFTP_HOST:-cryptolabs.co.za}"
SFTP_PORT="${SFTP_PORT:-22}"
SFTP_USER="${SFTP_USER:-crypthbfgw}"
SFTP_REMOTE_PATH="${SFTP_REMOTE_PATH:-/public_html/wp-content/uploads/vibe-games}"

if [ -z "$SFTP_PASSWORD" ]; then
    echo -e "${RED}Error: SFTP_PASSWORD not found in .env${NC}"
    exit 1
fi

echo -e "${YELLOW}Configuration:${NC}"
echo "  Host: $SFTP_HOST"
echo "  User: $SFTP_USER"
echo "  Path: $SFTP_REMOTE_PATH"
echo ""

# Check if sshpass is installed
if ! command -v sshpass &> /dev/null; then
    echo -e "${RED}Error: sshpass not installed${NC}"
    echo "Install with: brew install sshpass"
    exit 1
fi

# Detect what changed (using git)
CHANGED_GAMES=""

if git diff --quiet HEAD~1 HEAD -- games/ 2>/dev/null; then
    echo -e "${YELLOW}No changes detected in games/ (using git)${NC}"
    echo "Deploy anyway? (y/N)"
    read -r FORCE_DEPLOY
    if [[ ! "$FORCE_DEPLOY" =~ ^[Yy]$ ]]; then
        echo "Deployment cancelled"
        exit 0
    fi
    # Deploy all games
    CHANGED_GAMES="geometry-dash noughts-and-x snakes space-invaders"
else
    # Detect which games changed
    for game in geometry-dash noughts-and-x snakes space-invaders; do
        if git diff --quiet HEAD~1 HEAD -- "games/$game/" 2>/dev/null; then
            :
        else
            CHANGED_GAMES="$CHANGED_GAMES $game"
        fi
    done
    
    # If no git history, deploy all
    if [ -z "$CHANGED_GAMES" ]; then
        CHANGED_GAMES="geometry-dash noughts-and-x snakes space-invaders"
    fi
fi

echo -e "${GREEN}Games to deploy:${NC} $CHANGED_GAMES"
echo ""

# Create SFTP batch file
BATCH_FILE="/tmp/sftp-vibe-games-$$.txt"

cat > "$BATCH_FILE" << BATCH
cd $SFTP_REMOTE_PATH
BATCH

# Add put commands for each changed game
for game in $CHANGED_GAMES; do
    # Map directory name to uploaded filename
    case $game in
        geometry-dash)
            REMOTE_NAME="geometry-dash.html"
            ;;
        noughts-and-x)
            REMOTE_NAME="noughts-and-x.html"
            ;;
        snakes)
            REMOTE_NAME="snakes.html"
            ;;
        space-invaders)
            REMOTE_NAME="space-invaders.html"
            ;;
    esac
    
    if [ -f "games/$game/index.html" ]; then
        echo "put games/$game/index.html $REMOTE_NAME" >> "$BATCH_FILE"
        echo -e "  ${YELLOW}→${NC} $game → $REMOTE_NAME"
    else
        echo -e "  ${RED}✗${NC} $game (file not found)"
    fi
done

echo "ls -lh" >> "$BATCH_FILE"
echo "bye" >> "$BATCH_FILE"

echo ""
echo -e "${YELLOW}Uploading to WordPress...${NC}"

# Execute SFTP upload
sshpass -p "$SFTP_PASSWORD" sftp -oBatchMode=no -oStrictHostKeyChecking=no -P "$SFTP_PORT" "$SFTP_USER@$SFTP_HOST" < "$BATCH_FILE"

# Cleanup
rm -f "$BATCH_FILE"

echo ""
echo -e "${GREEN}=== Deployment Complete! ===${NC}"
echo ""
echo "✓ Games uploaded to: https://www.cryptolabs.co.za/wp-content/uploads/vibe-games/"
echo "✓ View page at: https://www.cryptolabs.co.za/vibe-games/"
echo ""
echo -e "${YELLOW}Verify deployment:${NC}"
for game in $CHANGED_GAMES; do
    case $game in
        geometry-dash) name="geometry-dash.html" ;;
        noughts-and-x) name="noughts-and-x.html" ;;
        snakes) name="snakes.html" ;;
        space-invaders) name="space-invaders.html" ;;
    esac
    echo "  https://www.cryptolabs.co.za/wp-content/uploads/vibe-games/$name"
done
echo ""

