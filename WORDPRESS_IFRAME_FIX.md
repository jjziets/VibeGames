# WordPress Iframe Fix - Use Custom HTML Block

## ✅ **The Solution**

WordPress's block editor doesn't like iframes in regular blocks. You need to use **Custom HTML blocks**.

---

## 📋 **Step-by-Step Instructions**

### 1. Edit the Vibe Games Page
https://www.cryptolabs.co.za/wp-admin/post.php?post=460&action=edit

### 2. Clear Existing Content
- Delete any broken blocks
- Start fresh

### 3. Add Custom HTML Block for Hero
1. **Click the + button** (add block)
2. **Search for**: "Custom HTML"
3. **Click**: Custom HTML block
4. **Paste this**:

```html
<div style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 60px 20px; text-align: center; border-radius: 12px; margin-bottom: 60px;">
    <h1 style="font-size: 2.5em; color: white; margin-bottom: 20px;">🎮 Vibe Games by LZ (Age 12)</h1>
    <p style="font-size: 1.2em; max-width: 700px; margin: 0 auto;">
        Four games built through AI conversation. Zero coding experience. Just ideas and iteration.
    </p>
    <p style="margin-top: 20px; font-size: 1.1em;">
        <strong>45 minutes</strong> total build time | <strong>20-30 prompts</strong> per game | <strong>0 lines</strong> hand-coded
    </p>
</div>
```

### 4. Add Custom HTML Block for Each Game

**Click + button**, add **Custom HTML** block, paste this:

#### Geometry Dash:
```html
<div style="background: white; border-radius: 12px; padding: 30px; margin-bottom: 40px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <h2 style="color: #667eea; margin-top: 0;">🟦 Geometry Dash</h2>
    <p style="font-style: italic; color: #666;">"Make a game where you jump over obstacles" – LZ's first game</p>
    <iframe src="/wp-content/uploads/vibe-games/geometry-dash.html" width="100%" height="600" style="border: none; border-radius: 8px; background: #000; display: block; margin: 20px 0;"></iframe>
    <p style="text-align: center; color: #888;">38KB | Space/Click to jump</p>
</div>
```

#### Noughts and X:
```html
<div style="background: white; border-radius: 12px; padding: 30px; margin-bottom: 40px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <h2 style="color: #667eea; margin-top: 0;">⭕ Noughts and X</h2>
    <p style="font-style: italic; color: #666;">"I want to play noughts and crosses against the computer"</p>
    <iframe src="/wp-content/uploads/vibe-games/noughts-and-x.html" width="100%" height="600" style="border: none; border-radius: 8px; background: #000; display: block; margin: 20px 0; max-width: 600px; margin-left: auto; margin-right: auto;"></iframe>
    <p style="text-align: center; color: #888;">14KB | Click to play | AI opponent</p>
</div>
```

#### Snakes:
```html
<div style="background: white; border-radius: 12px; padding: 30px; margin-bottom: 40px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <h2 style="color: #667eea; margin-top: 0;">🐍 Snakes</h2>
    <p style="font-style: italic; color: #666;">"Make a snake game like the old Nokia phones"</p>
    <iframe src="/wp-content/uploads/vibe-games/snakes.html" width="100%" height="600" style="border: none; border-radius: 8px; background: #000; display: block; margin: 20px 0;"></iframe>
    <p style="text-align: center; color: #888;">24KB | Arrow keys | LZ's favorite!</p>
</div>
```

#### Space Invaders:
```html
<div style="background: white; border-radius: 12px; padding: 30px; margin-bottom: 40px; box-shadow: 0 4px 12px rgba(0,0,0,0.1);">
    <h2 style="color: #667eea; margin-top: 0;">👾 Space Invaders</h2>
    <p style="font-style: italic; color: #666;">"Can we do Space Invaders with aliens that shoot back?"</p>
    <iframe src="/wp-content/uploads/vibe-games/space-invaders.html" width="100%" height="700" style="border: none; border-radius: 8px; background: #000; display: block; margin: 20px 0;"></iframe>
    <p style="text-align: center; color: #888;">29KB | Arrows + Space</p>
</div>
```

### 5. Add Custom HTML Block for GitHub Section

```html
<div style="max-width: 900px; margin: 60px auto; padding: 40px; background: #1a1a1a; border-radius: 12px; text-align: center; color: white;">
    <h2 style="color: white; margin-bottom: 20px;">📂 View Source on GitHub</h2>
    <p style="color: #ccc; margin-bottom: 30px;">
        See the code, read about the process, fork and remix the games.
    </p>
    <a href="https://github.com/jjziets/VibeGames" target="_blank" style="display: inline-block; padding: 15px 30px; background: white; color: #000; text-decoration: none; border-radius: 8px; font-weight: bold; margin: 10px;">
        View on GitHub →
    </a>
    <a href="/ai-chat/" style="display: inline-block; padding: 15px 30px; background: #667eea; color: white; text-decoration: none; border-radius: 8px; font-weight: bold; margin: 10px;">
        Build Your Own →
    </a>
</div>
```

### 6. Update Page

Click **"Update"** button

---

## ⚡ **Quick Alternative: Classic Editor**

If you prefer, enable the **Classic Editor** plugin:

1. **Install**: Plugins → Add New → Search "Classic Editor"
2. **Activate** it
3. **Edit page** - you'll see the old WYSIWYG editor
4. **Switch to "Text" tab**
5. **Paste the entire HTML** (from SIMPLE_WORDPRESS_PAGE.html)
6. **Update**

---

## 🎯 **Expected Result**

After adding the Custom HTML blocks, the page will show:
- ✅ Purple gradient hero
- ✅ 4 playable games (no clicking needed - embedded)
- ✅ GitHub buttons
- ✅ Professional layout

---

**Use Custom HTML blocks for each section!** 🎮

