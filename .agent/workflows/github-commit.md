---
description: How to commit your code to GitHub for the first time
---

# GitHub Setup Guide for Newbies

Follow these steps to upload your **Muslim Counter App** to GitHub.

## Phase 1: Initialize Git (On your Computer)

1. **Open the Terminal** in your editor (the panel at the bottom).
2. Type this command to start Git in your project:
   ```powershell
   git init
   ```
3. Stage all your files (prepare them for committing):
   ```powershell
   git add .
   ```
4. Create your first "Save Point" (Commit):
   ```powershell
   git commit -m "Initial commit: Muslim Counter App optimized"
   ```

## Phase 2: Connect to GitHub (In the Cloud)

1. Open [GitHub](https://github.com) in your browser.
2. Click the **+** icon in the top right and select **New repository**.
3. Give it a name like `muslim_counter_app` and click **Create repository**.
4. GitHub will show you a page with instructions. Look for the section **"…or push an existing repository from the command line"**.
5. Copy the 3 lines of code they provide. They will look something like this:
   ```powershell
   git remote add origin https://github.com/YOUR_USERNAME/muslim_counter_app.git
   git branch -M main
   git push -u origin main
   ```
6. Paste those lines into your terminal and hit **Enter**.

## Tips for Success
- **VS Code Source Control**: You can also use the "Source Control" icon (the branch icon on the left sidebar) to do this visually without typing commands!
- **Private vs Public**: Choose "Public" if you want others to see your code, or "Private" if you want it kept for yourself.
