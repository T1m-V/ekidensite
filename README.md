# Rotterdam Ekiden Site

Static Astro + TypeScript website for Rotterdam Ekiden, structured for clean maintenance and GitHub Pages deployment.

## Local development

```bash
npm install
npm run dev
```

## Build and preview

```bash
npm run check
npm run build
npm run preview
```

## Deploy on GitHub Pages

1. Push this repository to GitHub.
2. Use `main` or `master` as your default branch (both are supported by the deploy workflow).
3. In GitHub, go to `Settings > Pages` and set source to **GitHub Actions**.
4. Push to `main`; workflow `.github/workflows/deploy.yml` builds and deploys automatically.

## Repository structure

- `src/layouts`: shared page shell and metadata
- `src/components`: shared navigation and footer
- `src/pages`: route pages (`/`, `/info`, `/faq`, etc.)
- `src/fragments/pages`: migrated HTML content per route
- `src/styles/global.css`: global styles
- `legacy/rotterdamekiden.original.html`: original source snapshot

## Notes

- The site base path is configured automatically in CI for repository-based GitHub Pages URLs.
- If you later move to a custom domain, add a `CNAME` file in `public/` and set DNS accordingly.
