# Upload Vibe Games to WordPress

## 🚀 **Quick Upload via SFTP**

### Option 1: Interactive Script

```bash
cd /Users/hanneszietsman/CrypotAI/VibeGames

# Run this command (will ask for password)
sftp crypthbfgw@cryptolabs.co.za << 'EOF'
cd /public_html/wp-content/uploads
mkdir vibe-games
cd vibe-games
put games/geometry-dash/index.html geometry-dash.html
put games/noughts-and-x/index.html noughts-and-x.html
put games/snakes/index.html snakes.html
put games/space-invaders/index.html space-invaders.html
ls -la
bye
EOF
```

### Option 2: Manual SFTP

```bash
cd /Users/hanneszietsman/CrypotAI/VibeGames

# Connect to SFTP
sftp crypthbfgw@cryptolabs.co.za
# Enter password when prompted

# Once connected, run these commands:
cd /public_html/wp-content/uploads
mkdir vibe-games
cd vibe-games
put games/geometry-dash/index.html geometry-dash.html
put games/noughts-and-x/index.html noughts-and-x.html
put games/snakes/index.html snakes.html
put games/space-invaders/index.html space-invaders.html
ls -la
bye
```

---

## ✅ **Verify Upload**

After upload, test each game URL:

```
https://www.cryptolabs.co.za/wp-content/uploads/vibe-games/geometry-dash.html
https://www.cryptolabs.co.za/wp-content/uploads/vibe-games/noughts-and-x.html
https://www.cryptolabs.co.za/wp-content/uploads/vibe-games/snakes.html
https://www.cryptolabs.co.za/wp-content/uploads/vibe-games/space-invaders.html
```

Each should show the game!

---

## 📝 **Update WordPress Page**

### Step 1: Copy Template

```bash
# The template is ready at:
cat wordpress/page-template.html | pbcopy
# (Now it's in your clipboard)
```

### Step 2: Edit WordPress Page

1. **Go to**: https://www.cryptolabs.co.za/wp-admin/pages.php
2. **Find**: "Vibe Games" page
3. **Click**: Edit
4. **Switch to**: Text/HTML editor (not Visual)
5. **Paste**: Template from clipboard
6. **Update/Publish**

---

## 🎮 **Expected Result**

Visit: https://www.cryptolabs.co.za/vibe-games/

**Should show:**
- ✅ Hero section with LZ's story (age 12, no coding experience)
- ✅ 4 playable games embedded
- ✅ GitHub link section
- ✅ Call-to-action for AI Chat

**All games playable inline - no popups, no new tabs!**

