# 📁 Struktur Folder Ideal - Template Coffee Shop Statis

**Struktur yang rapi, terorganisir, dan pembeli-friendly**

---

## 🎯 Tree Structure (Lengkap)

```
mawar-coffee-shop-template/                    ← Folder utama (project root)
│
├── 📄 index.html                              ← HTML utama (single page)
├── 📄 README.md                               ← Intro & quick start
├── 📄 LICENSE.md                              ← Lisensi penggunaan
│
├── 📂 js/                                      ← JavaScript (core logic)
│   ├── config.js                              ← HANYA FILE INI YANG DIUBAH PEMBELI
│   ├── app.js                                 ← Main app initialization
│   ├── utils.js                               ← Utility functions (helpers)
│   ├── cart.js                                ← Shopping cart logic
│   ├── menu.js                                ← Menu management
│   └── analytics.js                           ← Analytics & tracking (opsional)
│
├── 📂 assets/                                 ← Semua assets website
│   │
│   ├── 📂 css/                                ← Stylesheet
│   │   ├── style.css                          ← Main CSS
│   │   ├── responsive.css                     ← Responsive rules
│   │   └── theme.css                          ← Theme & colors (opsional)
│   │
│   ├── 📂 images/                             ← Semua gambar & media
│   │   │
│   │   ├── 📂 hero/                           ← Hero banner images
│   │   │   ├── hero-banner.webp
│   │   │   ├── hero-video-1.mp4
│   │   │   ├── hero-video-2.mp4
│   │   │   ├── hero-video-3.mp4
│   │   │   ├── hero-video-4.mp4
│   │   │   ├── hero-video-5.mp4
│   │   │   └── hero-video-6.mp4
│   │   │
│   │   ├── 📂 menu/                           ← Menu item photos
│   │   │   ├── kopi/
│   │   │   │   ├── kopi-1.webp
│   │   │   │   ├── kopi-2.webp
│   │   │   │   └── kopi-3.webp
│   │   │   ├── makanan/
│   │   │   │   ├── makanan-1.webp
│   │   │   │   ├── makanan-2.webp
│   │   │   │   └── makanan-3.webp
│   │   │   └── minuman/
│   │   │       ├── minuman-1.webp
│   │   │       ├── minuman-2.webp
│   │   │       └── minuman-3.webp
│   │   │
│   │   ├── 📂 gallery/                        ← Galeri suasana cafe
│   │   │   ├── gallery-1.webp
│   │   │   ├── gallery-2.webp
│   │   │   ├── gallery-3.webp
│   │   │   └── gallery-4.webp
│   │   │
│   │   ├── 📂 about/                          ← Foto About/Interior
│   │   │   ├── about-interior.webp
│   │   │   ├── about-owner.webp
│   │   │   └── about-team.webp
│   │   │
│   │   ├── 📂 icons/                          ← Icon SVG/PNG
│   │   │   ├── logo.svg
│   │   │   ├── icon-coffee.svg
│   │   │   ├── icon-location.svg
│   │   │   ├── icon-phone.svg
│   │   │   └── social-*.svg
│   │   │
│   │   ├── 📂 favicons/                       ← Browser icons
│   │   │   ├── favicon.ico
│   │   │   ├── favicon-16x16.png
│   │   │   ├── favicon-32x32.png
│   │   │   ├── apple-touch-icon.png
│   │   │   ├── android-chrome-192x192.png
│   │   │   └── android-chrome-512x512.png
│   │   │
│   │   └── 📂 placeholder/                    ← Placeholder saat dev
│   │       └── (kosong atau dummy files)
│   │
│   └── 📂 fonts/                              ← Custom fonts (opsional)
│       ├── norwester.woff2
│       └── dm-sans.woff2
│
├── 📂 docs/                                   ← Dokumentasi lengkap
│   ├── README.md                              ← Panduan mulai cepat
│   ├── SETUP.md                               ← Setup lengkap
│   ├── CUSTOMIZATION.md                       ← Cara customize
│   ├── DEPLOYMENT.md                          ← Deploy ke hosting
│   ├── FAQ.md                                 ← Pertanyaan umum
│   ├── CHANGELOG.md                           ← Riwayat update
│   ├── MEDIA.md                               ← Panduan mengganti media
│   └── CONFIG.md                              ← Penjelasan config.js
│
├── 📂 example/                                ← Contoh implementasi (opsional)
│   ├── example-config.js                      ← Contoh konfigurasi
│   ├── example-custom-menu.html               ← Contoh menu custom
│   └── example-styling.css                    ← Contoh styling tambahan
│
├── 📄 .gitignore                              ← File git ignore
├── 📄 package.json                            ← Project metadata (opsional)
└── 📄 VERSION.md                              ← Version tracking
```

---

## 📊 File Organization Overview

```
Jumlah File & Folder:
├── Root HTML: 1 file (index.html)
├── JavaScript: 6 files (config, app, utils, cart, menu, analytics)
├── CSS: 3 files (style, responsive, theme)
├── Images: 
│   ├── Hero: 7 files (1 banner + 6 video)
│   ├── Menu: 9 files (3 kategori × 3 items)
│   ├── Gallery: 4 files
│   ├── About: 3 files
│   ├── Icons: 6 files
│   ├── Favicons: 6 files
│   └── Total Images: ~35 files
├── Documentation: 9 files
├── Example: 3 files
└── Config: .gitignore, package.json, VERSION.md

TOTAL: ~65-75 files (termasuk semua assets)
```

---

## ✅ File Organization Rules

### 🎯 Images Organization
| Folder | Isi | Format | Catatan |
|--------|-----|--------|---------|
| `hero/` | Banner & video hero | WebP, MP4 | 6 video + 1 banner |
| `menu/` | Foto menu items | WebP | Pisah per kategori (kopi, makanan, minuman) |
| `gallery/` | Galeri suasana cafe | WebP | 4+ foto |
| `about/` | Foto about section | WebP | Interior, owner, team |
| `icons/` | Icon SVG | SVG, PNG | Logo, social, UI icons |
| `favicons/` | Browser icons | ICO, PNG | Berbagai ukuran |

### 🎯 JavaScript Organization
| File | Fungsi | Size | Catatan |
|------|--------|------|---------|
| `config.js` | Konfigurasi toko | Kecil | ⭐ PEMBELI EDIT INI SAJA |
| `app.js` | Inisialisasi app | Medium | Core app logic |
| `utils.js` | Fungsi helper | Kecil | Reusable utilities |
| `cart.js` | Shopping cart | Medium | Cart management |
| `menu.js` | Menu management | Kecil | Menu loading & display |
| `analytics.js` | Analytics | Kecil | Optional, tracking |

### 🎯 CSS Organization
| File | Fungsi | Catatan |
|------|--------|---------|
| `style.css` | Main styling | Semua gaya utama |
| `responsive.css` | Media queries | Responsive design |
| `theme.css` | Theme vars | Color schemes, fonts |

### 🎯 Dokumentasi
| File | Isi |
|------|-----|
| `README.md` | Intro, quick start, feature list |
| `SETUP.md` | Setup lengkap, troubleshooting |
| `CUSTOMIZATION.md` | Cara customize (nama toko, warna, dll) |
| `DEPLOYMENT.md` | Deploy ke hosting (Netlify, Vercel, cPanel, dll) |
| `FAQ.md` | Pertanyaan & jawaban umum |
| `CHANGELOG.md` | Riwayat update versi |
| `MEDIA.md` | Panduan mengganti media |
| `CONFIG.md` | Penjelasan detail setiap field config.js |

---

## 📋 Saat Pembeli Download

Struktur yang pembeli terima:
```
mawar-coffee-shop-template/
├── index.html          ← BUKA INI DI BROWSER
├── README.md           ← BACA INI DULU
├── js/
│   └── config.js       ← EDIT HANYA INI
├── assets/
│   ├── css/
│   ├── images/
│   └── fonts/
└── docs/
    ├── SETUP.md
    ├── CUSTOMIZATION.md
    └── ... (panduan lengkap)
```

**Pembeli langsung paham:**
- Buka `README.md` di root
- Edit `js/config.js` sesuai toko mereka
- Buka `index.html` di browser
- Selesai! ✅

---

## 🔧 Folder Hierarchy Logic

```
Root Level:
  └─ Untuk orang yang baru buka template
    ├─ index.html (langsung bisa dibuka)
    └─ README.md (penjelasan singkat)

js/ (Root Level):
  └─ Semua JavaScript disini
    ├─ config.js (⭐ yang harus diubah)
    └─ app.js, utils.js, cart.js, menu.js, analytics.js

assets/:
  ├─ css/ (semua stylesheet)
  ├─ images/ (terorganisir per kategori)
  └─ fonts/ (custom fonts jika ada)

docs/:
  └─ Panduan lengkap
    ├─ Setup & quickstart
    ├─ Customization
    ├─ Deployment
    └─ FAQ

example/:
  └─ Contoh implementasi
    ├─ Contoh config
    ├─ Contoh HTML custom
    └─ Contoh CSS custom
```

---

## 💡 Design Principles

✅ **Single Responsibility:**
- Setiap file punya 1 tanggung jawab
- `config.js` = konfigurasi saja
- `cart.js` = shopping cart logic saja

✅ **Self-Documenting:**
- Nama folder jelas (hero, menu, gallery)
- Nama file deskriptif (kopi-1.webp, not img-001.webp)
- Struktur intuitif tanpa perlu baca docs panjang

✅ **Pembeli-Friendly:**
- Jelas mana yang harus diubah (`config.js`)
- Jelas mana yang jangan diubah (app.js, style.css)
- Dokumentasi terpisah di folder `docs/`

✅ **Scalable:**
- Mudah tambah halaman baru
- Mudah tambah menu item
- Mudah customize CSS

---

## 📚 File Count Summary

| Kategori | Count | Notes |
|----------|-------|-------|
| HTML | 1 | index.html |
| JavaScript | 6 | config, app, utils, cart, menu, analytics |
| CSS | 3 | style, responsive, theme |
| Images | ~35 | Dalam berbagai subfolder |
| Docs | 9 | Panduan lengkap |
| Example | 3 | Contoh implementasi |
| Config | 3 | .gitignore, package.json, VERSION |
| **TOTAL** | **~60** | Clean & organized |

---

## 🎯 Next Steps

1. **Implement structure** (gunakan script di file lain)
2. **Move files** ke lokasi yang sesuai
3. **Update HTML imports** agar mengacu ke path yang benar
4. **Create documentation** di folder `docs/`
5. **Test** - pastikan semua file terload dengan benar
6. **Package** dan ready to sell! 🎉

---

**Status:** ✅ Structure Design Complete  
**Type:** Template Folder Architecture  
**Best For:** Static website template sales  
**Version:** 1.0.0
