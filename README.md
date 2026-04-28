# museionholdings.xyz — site source

The public-facing site for **Museion Holdings** (legal name) / **House of Museion** (ceremonial name). Static HTML, no framework, deploys to Vercel as a static project.

---

## Layout

```
_museionholdings-site/
├── index.html              ← homepage (the brand house, the family wing, the order)
├── vercel.json             ← static-deploy config + headers
├── README.md               ← this file
├── favicon.ico             ← root-level assets (Vercel serves these from /)
├── favicon-16x16.png
├── favicon-32x32.png
├── apple-touch-icon.png
├── museion-logo.png        ← parent mark
├── museion-og.png          ← Open Graph image (1200×630)
├── public/                 ← duplicate of root assets (defensive, OK to delete if not needed)
└── scrolls/                ← The Gentlemen's Playbook (moved over from museion.yakkstudios.xyz)
    ├── index.html          ← scrolls index page
    ├── scroll-001.html     ← The Personal Aether Protocol
    ├── scroll-002.html     ← Sovereign AI Defense
    ├── scroll-004.html     ← Aether: The Loyal Intelligence
    ├── scroll-013.html     ← Memory as Moat
    └── scroll-016.html     ← The Non-Greedy Covenant
```

---

## URL plan

| Route | Page | Notes |
|---|---|---|
| `/` | Homepage | Hero · House · Brand House grid · Scrolls preview · Family Wing · Order · Footer |
| `/scrolls/` | The Gentlemen's Playbook | Same five scrolls, full index |
| `/scrolls/scroll-XXX.html` | Individual scroll | Direct-link compatible with previous URLs on `museion.yakkstudios.xyz` |
| `/favicon.ico` etc. | Site assets | Cached aggressively |

---

## Deployment to Vercel

1. **Connect Vercel project** to this directory (or to a git repo containing it).
2. **Framework preset:** "Other" (no framework — it's just static HTML).
3. **Build command:** leave empty.
4. **Output directory:** `.` (project root).
5. **Domain:** `museionholdings.xyz` (already purchased and in Jay's Vercel account).
6. **Push or upload** — Vercel will serve the static files directly. The `vercel.json` adds security + caching headers.

After first deploy, verify:
- `https://museionholdings.xyz/` loads the homepage
- `https://museionholdings.xyz/scrolls/` loads the playbook index
- All five scroll deep-links work (`/scrolls/scroll-001.html` etc.)
- Favicons load
- Open Graph preview shows when shared (tweet / WhatsApp / Slack)

---

## Robots / privacy posture

Both pages currently carry `<meta name="robots" content="noindex, nofollow" />`. **This is the safe default while the site soft-launches.** When Jay is ready to make the site discoverable (after the initial round of investor / press shares), flip both to `index, follow` in:

- `index.html` line ~7
- `scrolls/index.html` line ~7

Then re-deploy.

---

## Naming hierarchy (canonical — see `MASTER_INDEX.md` and Pack 00 §0)

- **Museion Holdings** (Limited) — legal · corporate · investor-facing
- **House of Museion** — ceremonial · brand · narrative

Footer everywhere reads:

> Museion · House of Museion
> A Museion Holdings company · April 2026
> For the Gentlemen of Muse

---

## Relationship to `museion.yakkstudios.xyz`

The old site at `museion.yakkstudios.xyz` continues as Jay's **Core 4 share space** — a private staging surface for sharing with Shaun and Trevor. It is not customer-facing and stays as-is. The public Museion Holdings surface lives on `museionholdings.xyz`.

If we later want to migrate the old site's traffic, we add 301 redirects:

```
museion.yakkstudios.xyz/scroll-001.html  →  museionholdings.xyz/scrolls/scroll-001.html
```

— but for now, both stay live and serve different audiences.

---

## What's next (v0.3 onward)

- **v0.3** — swap the placeholder mini-marks in the Brand House grid for real logos (web-sized PNGs from `_BRAND_PACKS/` — saved to `/img/brand-house/`)
- **v0.4** — build dedicated pack pages at `/brand/01-museion.html` etc. so the Brand House cards link somewhere instead of `#`
- **v0.5** — flip `noindex` → `index` when ready for public launch; submit OG card to Twitter / LinkedIn validators
- **v1.0** — once $MUSE TGE is on the calendar, add a `/token/` page with the public utility / supply / vesting summary

---

**改善 · The work is to keep getting better.**
