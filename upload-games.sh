#!/bin/bash
# Upload Vibe Games to WordPress

# Get SFTP password from .api-keys or ask
if [ -f "../cryptolabs-ai-platform/.api-keys" ]; then
    SFTP_PASS=$(grep "SFTP.*:" ../cryptolabs-ai-platform/.api-keys | cut -d: -f2- | xargs)
fi

if [ -z "$SFTP_PASS" ]; then
    read -s -p "SFTP Password for crypthbfgw@cryptolabs.co.za: " SFTP_PASS
    echo ""
fi

# Create SFTP batch commands
cat > /tmp/sftp-games-batch.txt << 'BATCH'
cd /public_html/wp-content/uploads
mkdir vibe-games
cd vibe-games
put games/geometry-dash/index.html geometry-dash.html
put games/noughts-and-x/index.html noughts-and-x.html
put games/snakes/index.html snakes.html
put games/space-invaders/index.html space-invaders.html
ls -la
bye
BATCH

# Upload via SFTP
sshpass -p "$SFTP_PASS" sftp -oBatchMode=no -oStrictHostKeyChecking=no -P 22 crypthbfgw@cryptolabs.co.za < /tmp/sftp-games-batch.txt

rm -f /tmp/sftp-games-batch.txt

echo ""
echo "✅ Games uploaded to WordPress!"
echo ""
echo "Next: Update page at https://www.cryptolabs.co.za/wp-admin/"
