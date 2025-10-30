---

## 🗺️ Archive of Now — Jekyll Site Roadmap

### ✅ Phase 1: Foundation (Completed)

1. **SEO Partial Integration** — canonical, meta, OpenGraph, Twitter tags
2. **Front Matter Template Standardization** — enforced schema + linting rule
3. **Semantic Header Hierarchy** — `<h1>` for title on essays, `<h2>` for site identity
4. **Trailing Slash + Permalink Convention** — consistent for collections and posts
5. **Footer Enhancement** — added About link and subtle styling
6. **Build Configuration** — verbose logging, quiet suppression toggle
7. **Collection Index Behavior** — recursive listing for nested directories

---

### 🧩 Phase 2: Refinement (In Progress)

1. **Page Type Layout Split**

   * Separate layout for list/index pages (`list.html`)
   * Distinct layout for essays (`essay.html`)
2. **Linting Setup**

   * Add YAML/Markdown linter with custom rule for front matter order
3. **Site Typography and Spacing Pass**

   * Harmonize font weights, spacing, and color hierarchy
4. **Footer Link Navigation**

   * Extend footer nav (About, RSS, Archive, Contact)

---

### 🚀 Phase 3: Automation & CI/CD (Planned)

1. **GitHub Actions Integration**

   * Automated build + deploy for commits to `main` (completed)
   * Optional Jekyll build validation (abandoned)
2. **Metadata Automation**

   * Auto-inject `last_modified_at` from commit timestamp (completed)
   * Auto-generate SEO `url` in front matter (abandoned)
3. **RSS + Sitemap Generation**

   * Native, no-plugin versions (using Liquid templates)

---

### 🧠 Phase 4: UX & Publishing Tools (Future)

1. **Index Page Filtering**

   * Filter essays by tag, series, or keyword
2. **Series Navigation**

   * Auto-link previous/next in same series
3. **Theme Variants**

   * Light/Dark theme toggle via CSS vars
4. **Editorial Tooling**

   * Local preview command with drafts and lint auto-fix
