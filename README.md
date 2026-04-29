# museionholdings.xyz — site source

The public-facing site for **Museion Holdings** (legal name) / **House of Museion** (ceremonial name). Static HTML, no framework, deploys to Vercel as a static project.

---

## Layout

```
_museionholdings-site/
├── index.html              ← homepage (House · Brand House · Family Wing · Investors · Contact · Order)
├── vercel.json             ← static-deploy config + headers
├── README.md               ← this file
├── favicon.ico             ← root-level assets (Vercel serves these from /)
├── favicon-16x16.png
├── favicon-32x32.png
├── apple-touch-icon.png
├── museion-logo.png        ← parent mark
├── museion-og.png          ← Open Graph image (1200×630)
├── public/                 ← duplicate of root assets (defensive)
└── img/brand-house/        ← 8 brand pack mark thumbnails (used by the homepage grid)
```

> **Scrolls were here in v0.2–v0.5 and have been removed in v0.6.** The Gentlemen's Playbook scrolls now live exclusively on `museion.yakkstudios.xyz` (the private Core 4 / Gentlemen access surface). The new public domain `museionholdings.xyz` is the legal-entity, investor-facing surface and does not host gated content. See "3-tier scroll archive" below.

---

## URL plan

| Route | Page | Notes |
|---|---|---|
| `/` | Homepage | Hero · House · Brand House grid · Family Wing · Investors · Contact · Order · Footer |
| `/favicon.ico` etc. | Site assets | Cached aggressively |
| `/img/brand-house/*` | Brand pack mark thumbnails | Embedded in the homepage Brand House grid |

**Future routes (forthcoming):**
| `/brand/01-museion/` … `/brand/08-alis-of-aberdeen/` | Dedicated pack pages | v0.7 — turn the Brand House cards into clickable readouts |
| `/master-plan/` | Public master plan readout | v0.7 — slimmed master plan, replaces mailto-only "Request the master plan" CTA |
| `/press/` | Press kit + downloadable assets | v0.8 |

---

## 3-tier scroll archive (canonical structure)

Per founder direction, scrolls split across **three tiers** with three audiences:

| Tier | Audience | Where it lives |
|---|---|---|
| **1 · Public Scrolls** | Anyone on the open web — sanitised, marketing-grade variants of select philosophy notes | `museionholdings.xyz/scrolls/` (forthcoming) — distinct from Gentlemen Scrolls; written separately or sanitised from existing scrolls |
| **2 · Gentlemen Scrolls** | Gentlemen of Muse cohort + Core 4 — the "Playbook" tier, philosophy + selected operational scrolls | `museion.yakkstudios.xyz` (the existing private site) — **not** mirrored on `museionholdings.xyz` because the access perk is the point of Gentleman seat |
| **3 · Internal Dev Scrolls** | Jay + Core 4 only — implementation, KAIZE forensics, founder strategy | Local archive only, never web-hosted |

The archive's existing `YST ARCHIVE CLAUDE_NEW/01_PUBLIC_SCROLLS/` folder name is misleading — those 5 scrolls are actually **Tier 2 (Gentlemen)**. See `MASTER_INDEX.md` for the full mapping.

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
