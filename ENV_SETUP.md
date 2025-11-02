# Environment Setup for Game Deployment

## 📋 **Option 1: Use Existing .env (Recommended)**

The deploy script will automatically find and use the .env from:
- `../cryptolabs-ai-platform/.env`

**This .env already has your SFTP credentials:**
```bash
SFTP_PASSWORD=UMnQ4oHMqLrl15HW7I3t
SFTP_USER=crypthbfgw
SFTP_HOST=cryptolabs.co.za
```

✅ **No setup needed!** The script works out of the box.

---

## 🚀 **How to Use**

### Deploy All Games:
```bash
cd /Users/hanneszietsman/CrypotAI/VibeGames
./deploy-games.sh
```

**What it does:**
1. Reads SFTP credentials from .env
2. Detects which games changed (using git)
3. Uploads only changed games
4. Shows verification URLs

### Deploy After Making Changes:
```bash
# 1. Edit a game
vim games/snakes/index.html

# 2. Commit the change
git add games/snakes/
git commit -m "fix: adjust snake speed"

# 3. Deploy
./deploy-games.sh

# Only snakes.html will be uploaded!
```

### Force Deploy All Games:
```bash
./deploy-games.sh
# When prompted "Deploy anyway? (y/N)", type: y
```

---

## 🔍 **What the Script Detects**

### Changed Files (Smart Deploy):
```
If you modify: games/geometry-dash/index.html
Script uploads: geometry-dash.html only

If you modify: games/snakes/index.html
Script uploads: snakes.html only

If you modify: multiple games
Script uploads: all changed games
```

### No Changes (Safe):
```
Script detects: No git changes
Script asks: "Deploy anyway? (y/N)"
You choose: y = deploy all, n = cancel
```

---

## ⚙️ **Configuration Details**

The script uses these values (from .env or defaults):

| Variable | Default | Purpose |
|----------|---------|---------|
| `SFTP_HOST` | cryptolabs.co.za | WordPress server |
| `SFTP_PORT` | 22 | SFTP port |
| `SFTP_USER` | crypthbfgw | SFTP username |
| `SFTP_PASSWORD` | (from .env) | SFTP password |
| `SFTP_REMOTE_PATH` | /public_html/wp-content/uploads/vibe-games | Upload directory |

---

## 📦 **Dependencies**

**Required:**
- `sshpass` - Install with: `brew install sshpass`
- `git` - For change detection
- `.env` file with `SFTP_PASSWORD`

**Check if installed:**
```bash
which sshpass  # Should show path
which git      # Should show path
```

---

## 🧪 **Test the Script**

```bash
cd /Users/hanneszietsman/CrypotAI/VibeGames

# Dry run (see what would be deployed)
git status games/

# Deploy
./deploy-games.sh
```

**Expected output:**
```
=== Vibe Games Deployment ===

Configuration:
  Host: cryptolabs.co.za
  User: crypthbfgw
  Path: /public_html/wp-content/uploads/vibe-games

Games to deploy: geometry-dash noughts-and-x

  → geometry-dash → geometry-dash.html
  → noughts-and-x → noughts-and-x.html

Uploading to WordPress...
[SFTP output]

=== Deployment Complete! ===

✓ Games uploaded
✓ View page at: https://www.cryptolabs.co.za/vibe-games/
```

---

## ✅ **Workflow**

```
Edit game → Commit → Run deploy-games.sh → Uploaded!
```

**Fast iteration loop for game updates!** 🎮

