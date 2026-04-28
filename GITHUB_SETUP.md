# GitHub setup — `museionholdings.xyz` site

The local sandbox can't fully initialise git on the mounted Windows filesystem (the `.git/config.lock` files can't be cleaned up from this side), so this needs to run from your Windows machine. **3 minutes total.**

---

## Step 0 — clean up the half-init

There's a partially-created `.git/` folder in `_museionholdings-site/` from when I tried. Delete it from Windows side first:

```powershell
cd C:\Users\Jyux\Museion\_museionholdings-site
Remove-Item -Recurse -Force .git
```

(If `Remove-Item` complains about read-only files, run `attrib -R .git\* /S` first, then retry.)

---

## Step 1 — fresh git init + first commit

```powershell
cd C:\Users\Jyux\Museion\_museionholdings-site

git init -b main
git config user.email "kaizeai@yakkstudios.xyz"
git config user.name "Jay Watt"

git add .
git commit -m "Initial commit: museionholdings.xyz v0.2

- Homepage: hero, brand house grid (8 packs), scrolls preview, family wing, order, footer
- Scrolls subpath /scrolls/ with the Gentlemen's Playbook + 5 published scrolls
- Vercel static config with security + cache headers
- Naming hierarchy: Museion Holdings (legal) / House of Museion (ceremonial)
- noindex,nofollow soft-launch posture (flip when ready)"
```

---

## Step 2 — create the GitHub repo

**Recommended repo name:** `museionholdings.xyz`
**Recommended owner:** `yakkstudios` (your existing org — keeps it next to the museion repo) OR a new `museionholdings` org if you want corporate cleanliness.

Two ways to create it:

**Option A — web (easier):**
1. Go to <https://github.com/new>
2. **Owner:** yakkstudios (or new org)
3. **Repository name:** `museionholdings.xyz`
4. **Description:** "Museion Holdings — public site. House of Museion."
5. **Visibility:** Private (recommended while it's still `noindex,nofollow`)
6. **DO NOT** initialize with README, .gitignore, or license (you have them locally)
7. Click *Create repository*

**Option B — `gh` CLI (faster if you have it):**
```powershell
gh repo create yakkstudios/museionholdings.xyz --private --source . --description "Museion Holdings — public site. House of Museion."
```

---

## Step 3 — push

```powershell
git remote add origin https://github.com/yakkstudios/museionholdings.xyz.git
git push -u origin main
```

(If the remote already exists from a previous attempt: `git remote set-url origin <url>` then push.)

---

## Step 4 — wire it to Vercel

1. Open <https://vercel.com/new>
2. **Import Git Repository** → pick `yakkstudios/museionholdings.xyz`
3. **Framework preset:** Other
4. **Build command:** *(leave empty)*
5. **Output directory:** `.` *(project root)*
6. Click *Deploy*
7. Once deployed, **Project Settings → Domains** → add `museionholdings.xyz` (the domain you already bought) and `www.museionholdings.xyz` (recommended)

Vercel will read the `vercel.json` automatically and apply the security + cache headers.

---

## Step 5 — verify

After ~30 seconds:

- <https://museionholdings.xyz/> → homepage loads
- <https://museionholdings.xyz/scrolls/> → Gentlemen's Playbook loads
- <https://museionholdings.xyz/scrolls/scroll-001.html> → individual scroll loads
- Favicon shows in browser tab
- Open Graph card looks right when you paste the URL into a Slack / X / LinkedIn / WhatsApp draft

---

## Subsequent updates (the workflow from here on)

Edit files locally (the index.html, scrolls/, etc.) — when you save, run:

```powershell
cd C:\Users\Jyux\Museion\_museionholdings-site
git add -A
git commit -m "What you changed"
git push
```

Vercel rebuilds and redeploys automatically on every push to `main`. Usually live in under a minute.

---

## When the time comes — flip noindex → index

In `index.html` (line ~7) and `scrolls/index.html` (line ~7):

```html
<meta name="robots" content="noindex, nofollow" />
```

…becomes…

```html
<meta name="robots" content="index, follow" />
```

Commit, push, Vercel redeploys, the site becomes discoverable on Google.

---

## Naming hierarchy reminder (so the repo / commits / PRs respect it)

- **Museion Holdings** (Limited) — legal · corporate · investor-facing
- **House of Museion** — ceremonial · brand · narrative

Repo description, README, commit messages, PR titles → use whichever register fits the moment, but never reintroduce *MuseionAI* / *MuseionAI Holdings*. See `_BRAND_PACKS/00_MASTER_BRAND_HIERARCHY.md` §0 for the full rule.

**改善 · The work is to keep getting better.**
