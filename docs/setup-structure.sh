#!/bin/bash

# ═══════════════════════════════════════════════════════════════════════════════
# SETUP FOLDER STRUCTURE - Coffee Shop Template
# ═══════════════════════════════════════════════════════════════════════════════
# 
# Script ini membuat struktur folder yang ideal untuk template dijual.
# Jalankan dari root folder project: bash setup-structure.sh
#
# ═══════════════════════════════════════════════════════════════════════════════

set -e  # Exit jika ada error

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}"
echo "╔════════════════════════════════════════════════════════════════════╗"
echo "║                  FOLDER STRUCTURE SETUP                           ║"
echo "║           Coffee Shop Template - Organized & Ready to Sell        ║"
echo "╚════════════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# 1. CREATE MAIN FOLDERS
echo -e "${YELLOW}📁 Step 1: Creating main folders...${NC}"

mkdir -p docs
mkdir -p example
mkdir -p assets/css
mkdir -p assets/fonts
mkdir -p assets/images/hero
mkdir -p assets/images/menu/kopi
mkdir -p assets/images/menu/makanan
mkdir -p assets/images/menu/minuman
mkdir -p assets/images/gallery
mkdir -p assets/images/about
mkdir -p assets/images/icons
mkdir -p assets/images/favicons

echo -e "${GREEN}✓ Main folders created${NC}"

# 2. CREATE DOCUMENTATION FILES (if not exist)
echo -e "${YELLOW}📄 Step 2: Creating documentation files...${NC}"

# SETUP.md
cat > docs/SETUP.md << 'EOF'
# 🚀 Setup Lengkap - Coffee Shop Template

## Quick Start (5 Menit)

### 1. Buka index.html
```bash
# Mac/Linux:
open index.html

# Windows:
start index.html

# Atau pakai Live Server di VS Code
```

### 2. Edit config.js
```javascript
// js/config.js
const CONFIG = {
    storeName: "Nama Toko Anda",
    locationCity: "Kota Anda",
    locationProvince: "Provinsi Anda",
    whatsappNumber: "62812345678...",
    // ... ubah sesuai data toko Anda
};
```

### 3. Refresh Browser
- Tekan `Ctrl+R` atau `Cmd+R`
- Website updated otomatis ✅

## Struktur Folder

```
assets/
├── css/              ← Stylesheet
├── images/
│   ├── hero/        ← Banner & video
│   ├── menu/        ← Foto menu
│   ├── gallery/     ← Galeri cafe
│   ├── about/       ← Foto tentang
│   ├── icons/       ← Icon SVG
│   └── favicons/    ← Browser icon
└── fonts/           ← Custom fonts

js/
├── config.js        ← ⭐ EDIT INI SAJA
├── app.js           ← App logic
├── cart.js          ← Shopping cart
├── menu.js          ← Menu loading
└── utils.js         ← Utility functions

docs/                ← Dokumentasi lengkap
example/             ← Contoh implementasi
```

## File yang Boleh Diubah

✅ **BOLEH DIUBAH:**
- `js/config.js` - Konfigurasi toko
- `assets/images/*` - Foto & video
- `assets/css/style.css` - Custom CSS (advanced)

❌ **JANGAN DIUBAH:**
- `index.html`
- `js/app.js`, `js/cart.js`, dll
- Struktur folder

## Troubleshooting

### Website Tidak Berjalan
1. Cek browser console (F12)
2. Cek path file di HTML
3. Baca FAQ.md

### Gambar Tidak Muncul
1. Pastikan file ada di `assets/images/`
2. Cek nama file (case sensitive)
3. Clear browser cache (Ctrl+Shift+Delete)

### Styling Tidak Bekerja
1. Cek `assets/css/style.css`
2. Hard refresh (Ctrl+F5)
3. Check CSS syntax errors

---

Untuk bantuan lebih lanjut, baca file dokumentasi lainnya di folder `docs/`
EOF

# CUSTOMIZATION.md
cat > docs/CUSTOMIZATION.md << 'EOF'
# 🎨 Customization Guide

## 1. Mengubah Nama & Data Toko

**File:** `js/config.js`

```javascript
const CONFIG = {
    // Nama toko
    storeName: "Nama Toko Anda",
    tagline: "Tagline Anda",
    
    // Lokasi
    locationCity: "Kota",
    locationProvince: "Provinsi",
    establishedYear: 2024,
    
    // Kontak
    whatsappNumber: "628123456789",
    googleMapsLink: "https://maps.app.goo.gl/...",
    
    // Social Media
    instagramLink: "https://instagram.com/username",
    tiktokLink: "https://tiktok.com/@username",
    
    // ... lebih banyak field
};
```

## 2. Mengubah Warna & Styling

**File:** `assets/css/style.css`

```css
/* Warna utama (cari & replace) */
:root {
    --primary-color: #E8622A;    /* Warna orange */
    --secondary-color: #2a2a2a;  /* Warna abu-abu */
    --accent-color: #fff;        /* Warna putih */
}

/* Atau ubah langsung di style.css */
body {
    background-color: #1a1a1a;
    color: #f4eff6;
}
```

## 3. Mengubah Logo & Icon

**Lokasi:** `assets/images/icons/`

Ganti file:
- `logo.svg` - Logo toko
- `icon-*.svg` - Icon lainnya

## 4. Mengubah Foto

**Lokasi:** `assets/images/`

```
hero/              → Foto banner hero
menu/
  ├─ kopi/        → Foto menu kopi
  ├─ makanan/     → Foto menu makanan
  └─ minuman/     → Foto menu minuman
gallery/          → Galeri suasana cafe
about/            → Foto interior cafe
```

**Catatan:**
- Gunakan format WebP untuk performa lebih baik
- Maksimal 3-5 MB per file
- Ukuran rekomendasi sesuai placeholder

## 5. Mengubah Font

**File:** `assets/css/style.css`

```css
body {
    font-family: 'Nama Font Baru', sans-serif;
}

/* Import dari Google Fonts */
@import url('https://fonts.googleapis.com/css2?family=...');
```

## 6. Menambah Menu Item (Jika Supported)

Edit di HTML atau via JavaScript, sesuai implementasi.

---

Untuk lebih detail, lihat file dokumentasi lainnya.
EOF

# CONFIG.md
cat > docs/CONFIG.md << 'EOF'
# ⚙️ Penjelasan Config.js

## Semua Field & Penjelasannya

### IDENTITAS TOKO
```javascript
storeName: "Warkop Mawar"              // Nama toko utama
tagline: "Every cup tells a story"     // Tagline/motto
shortDescription: "Deskripsi singkat"  // Untuk hero section
footerTagline: "Tagline footer"        // Tagline untuk footer
```

### LOKASI & WAKTU
```javascript
locationCity: "Bondowoso"              // Kota
locationProvince: "Jawa Timur"         // Provinsi
establishedYear: 2024                  // Tahun berdiri

openingHours: {
    days: "Everyday",                  // Hari buka
    hours: "09:00 - 23:00"             // Jam operasional
}
```

### KONTAK & PEMESANAN
```javascript
whatsappNumber: "6282244019596"        // Format: 62xxxxx (tanpa +)
googleMapsLink: "https://..."          // Link Google Maps
grabFoodLink: "https://..."            // Link GrabFood
shopeeFoodLink: "https://..."          // Link ShopeeFood
```

### MEDIA SOSIAL
```javascript
instagramLink: "https://instagram.com/..."  // Link Instagram
tiktokLink: "https://tiktok.com/@..."      // Link TikTok
```

### PETA
```javascript
mapCoordinates: {
    lat: -7.9184921,                   // Latitude
    lng: 113.8175745                   // Longitude
}
mapZoom: 17                            // Zoom level (15-18 rekomendasi)
```

### STATISTIK
```javascript
totalMenuItems: "50+"                  // Jumlah menu
priceStartingFrom: "Rp5.000"           // Harga mulai dari
```

### SEO
```javascript
metaTitle: "Judul untuk tab browser"   // Max 60 karakter
metaDescription: "Deskripsi untuk Google"  // 120-160 karakter
metaKeywords: "kata kunci 1, kata kunci 2"
```

### KREDIT
```javascript
templateCreatorName: "Pembuat Template"
templateCreatorLink: "https://karyakarsa.com/..."
```

---

**Format Nomor WhatsApp:**
- ❌ Salah: +62 821 2345 6789 (dengan +, spasi)
- ✅ Benar: 6282123456789 (tanpa +, tanpa spasi)

**Format URL:**
- ❌ Salah: www.instagram.com/username (tanpa http/https)
- ✅ Benar: https://www.instagram.com/username

---

Edit sesuai data toko Anda, simpan, dan refresh browser!
EOF

# FAQ.md
cat > docs/FAQ.md << 'EOF'
# ❓ FAQ - Pertanyaan Umum

## Bagaimana cara mengganti logo?
Ganti file `assets/images/icons/logo.svg` dengan logo Anda.

## Bagaimana cara mengganti foto?
1. Siapkan foto baru (format WebP atau JPG)
2. Ganti file di folder yang sesuai:
   - `assets/images/hero/` - foto hero
   - `assets/images/menu/` - foto menu
   - `assets/images/gallery/` - galeri
   - `assets/images/about/` - foto tentang

## Apakah saya perlu PHP atau backend?
Tidak. Template ini 100% statis HTML/CSS/JS murni.

## Bagaimana deploy ke hosting?
Baca file `docs/DEPLOYMENT.md`

## Bisakah saya tambah halaman baru?
Ya, buat file HTML baru dan link ke dalamnya.

## Apakah ada payment gateway?
Tidak ada integrasi payment. Gunakan link WhatsApp/GrabFood untuk order.

## Bisakah disesuaikan dengan kebutuhan khusus?
Ya, file sumber tersedia. Edit sesuai kebutuhan Anda.

---

Jika ada pertanyaan lain, hubungi pembuat template.
EOF

# DEPLOYMENT.md
cat > docs/DEPLOYMENT.md << 'EOF'
# 🚀 Deploy ke Hosting

## Opsi 1: Netlify (Gratis & Mudah)

1. Buka https://netlify.com
2. Klik "Add new site"
3. Drag & drop folder project
4. Website langsung live! ✅

## Opsi 2: Vercel (Gratis & Cepat)

1. Buka https://vercel.com
2. Klik "Import Project"
3. Upload folder project
4. Deploy selesai!

## Opsi 3: GitHub Pages (Gratis)

1. Push folder ke GitHub
2. Di repo settings → Pages
3. Select main branch
4. Website live di username.github.io

## Opsi 4: Shared Hosting (Berbayar)

Gunakan FTP/SFTP:

1. Connect ke hosting via FTP (FileZilla, WinSCP, dll)
2. Upload semua file ke folder `public_html/`
3. Buka domain Anda di browser
4. Done! ✅

---

Rekomendasi: Netlify atau Vercel untuk kemudahan & performa.
EOF

# CHANGELOG.md
cat > docs/CHANGELOG.md << 'EOF'
# 📝 CHANGELOG

## Version 1.0.0 (2026-05-21)
- ✅ Initial release
- ✅ Dynamic config system
- ✅ Responsive design
- ✅ Video carousel hero
- ✅ Lightbox gallery
- ✅ Shopping cart
- ✅ Social media integration
- ✅ Map integration (Leaflet)
- ✅ SEO optimized

---

Keep checking for updates!
EOF

# MEDIA.md
cat > docs/MEDIA.md << 'EOF'
# 📸 Panduan Mengganti Media

## 1. Foto Hero Banner

**File:** `assets/images/hero/hero-banner.webp`

- Ukuran: 1920x1080px
- Format: WebP, JPG, atau PNG
- Size: maksimal 500KB

## 2. Video Hero

**File:** `assets/images/hero/hero-video-1.mp4` hingga `hero-video-6.mp4`

- Format: MP4 (H.264 codec)
- Resolusi: 1280x720px atau lebih
- Duration: 10-15 detik
- Size: 20-50MB per video

## 3. Foto Menu

**Lokasi:** `assets/images/menu/kopi/`, `makanan/`, `minuman/`

- Ukuran: 400x300px
- Format: WebP
- Size: 100-200KB per foto

## 4. Foto Galeri

**Lokasi:** `assets/images/gallery/`

- Ukuran: 600x400px
- Format: WebP, JPG
- Jumlah: 4+ foto

## 5. Foto About

**Lokasi:** `assets/images/about/`

- Ukuran: 800x600px
- Format: WebP, JPG
- Jenis: interior, owner, team

## 6. Icon & Logo

**Lokasi:** `assets/images/icons/`

- Format: SVG (preferred) atau PNG
- Size: 24x24px untuk small icons
- Logo: 200x200px recommended

---

Tips: Gunakan online tool seperti TinyPNG atau Squoosh untuk compress!
EOF

echo -e "${GREEN}✓ Documentation files created${NC}"

# 3. CREATE JS FILES (placeholder)
echo -e "${YELLOW}📜 Step 3: Creating JavaScript files structure...${NC}"

# Check if files exist before creating
if [ ! -f "js/app.js" ]; then
    cat > js/app.js << 'EOF'
// ═══════════════════════════════════════════════════════════════════════════════
// APP.JS - Main Application Logic
// ═══════════════════════════════════════════════════════════════════════════════

console.log('✅ App initialized');

// Your main app logic here
EOF
    echo -e "${GREEN}✓ js/app.js created${NC}"
else
    echo -e "${YELLOW}→ js/app.js already exists${NC}"
fi

if [ ! -f "js/utils.js" ]; then
    cat > js/utils.js << 'EOF'
// ═══════════════════════════════════════════════════════════════════════════════
// UTILS.JS - Utility Functions & Helpers
// ═══════════════════════════════════════════════════════════════════════════════

// Utility functions
function formatCurrency(amount) {
    return new Intl.NumberFormat('id-ID', {
        style: 'currency',
        currency: 'IDR',
        minimumFractionDigits: 0
    }).format(amount);
}

// Add more utilities as needed
EOF
    echo -e "${GREEN}✓ js/utils.js created${NC}"
else
    echo -e "${YELLOW}→ js/utils.js already exists${NC}"
fi

if [ ! -f "js/cart.js" ]; then
    cat > js/cart.js << 'EOF'
// ═══════════════════════════════════════════════════════════════════════════════
// CART.JS - Shopping Cart Logic
// ═══════════════════════════════════════════════════════════════════════════════

// Cart management logic
const Cart = {
    items: [],
    
    add(item) {
        this.items.push(item);
    },
    
    remove(itemId) {
        this.items = this.items.filter(i => i.id !== itemId);
    },
    
    clear() {
        this.items = [];
    }
};
EOF
    echo -e "${GREEN}✓ js/cart.js created${NC}"
else
    echo -e "${YELLOW}→ js/cart.js already exists${NC}"
fi

if [ ! -f "js/menu.js" ]; then
    cat > js/menu.js << 'EOF'
// ═══════════════════════════════════════════════════════════════════════════════
// MENU.JS - Menu Management
// ═══════════════════════════════════════════════════════════════════════════════

// Menu loading and management
console.log('✅ Menu module loaded');
EOF
    echo -e "${GREEN}✓ js/menu.js created${NC}"
else
    echo -e "${YELLOW}→ js/menu.js already exists${NC}"
fi

if [ ! -f "js/analytics.js" ]; then
    cat > js/analytics.js << 'EOF'
// ═══════════════════════════════════════════════════════════════════════════════
// ANALYTICS.JS - Analytics & Tracking (Optional)
// ═══════════════════════════════════════════════════════════════════════════════

// Add analytics tracking here (Google Analytics, Mixpanel, etc)
console.log('✅ Analytics module loaded');
EOF
    echo -e "${GREEN}✓ js/analytics.js created${NC}"
else
    echo -e "${YELLOW}→ js/analytics.js already exists${NC}"
fi

# 4. CREATE EXAMPLE FILES
echo -e "${YELLOW}📂 Step 4: Creating example files...${NC}"

cat > example/example-config.js << 'EOF'
// ═══════════════════════════════════════════════════════════════════════════════
// EXAMPLE CONFIG - Contoh Konfigurasi
// ═══════════════════════════════════════════════════════════════════════════════
// Copy & paste field ini ke js/config.js dan sesuaikan dengan data toko Anda

const CONFIG_EXAMPLE = {
    // IDENTITAS TOKO
    storeName: "Cafe Cantik",
    tagline: "Kopi Terbaik Se-Indonesia",
    shortDescription: "Kami menyajikan kopi specialty dengan kualitas terbaik",
    footerTagline: "Seduhan berkualitas untuk semua",
    
    // LOKASI & WAKTU
    locationCity: "Jakarta Selatan",
    locationProvince: "DKI Jakarta",
    establishedYear: 2020,
    openingHours: {
        days: "Senin - Minggu",
        hours: "08:00 - 22:00"
    },
    
    // KONTAK
    whatsappNumber: "6281234567890",
    googleMapsLink: "https://maps.app.goo.gl/xxxxx",
    grabFoodLink: "https://food.grab.com/xxxxx",
    shopeeFoodLink: "https://shopee.co.id/xxxxx",
    
    // SOCIAL MEDIA
    instagramLink: "https://www.instagram.com/cafecantik",
    tiktokLink: "https://www.tiktok.com/@cafecantik",
    
    // PETA
    mapCoordinates: {
        lat: -6.2749,
        lng: 106.8194
    },
    mapZoom: 17,
    
    // STATISTIK
    totalMenuItems: "45+",
    priceStartingFrom: "Rp8.000",
    
    // SEO
    metaTitle: "Cafe Cantik - Kopi Specialty Terbaik di Jakarta",
    metaDescription: "Nikmati kopi specialty berkualitas dengan suasana nyaman di Cafe Cantik",
    metaKeywords: "kopi specialty, cafe jakarta, kopi arabika, suasana nyaman",
    
    // KREDIT
    templateCreatorName: "CreativeWeb Studio",
    templateCreatorLink: "https://karyakarsa.com/creativeweb"
};
EOF

cat > example/example-styling.css << 'EOF'
/* ═══════════════════════════════════════════════════════════════════════════════ */
/* EXAMPLE STYLING - Contoh Custom CSS */
/* ═══════════════════════════════════════════════════════════════════════════════ */

/* Contoh 1: Ubah Warna Utama */
:root {
    --primary-color: #6F4E37;      /* Brown untuk coffee theme */
    --secondary-color: #D4A574;    /* Light brown */
    --accent-color: #ffffff;       /* White */
    --text-color: #333333;
}

/* Contoh 2: Ubah Font */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&family=Playfair+Display:wght@700&display=swap');

body {
    font-family: 'Poppins', sans-serif;
}

h1, h2, h3 {
    font-family: 'Playfair Display', serif;
}

/* Contoh 3: Custom Card Styling */
.menu-card {
    box-shadow: 0 4px 12px rgba(111, 78, 55, 0.15);
    border-radius: 12px;
    overflow: hidden;
    transition: all 0.3s ease;
}

.menu-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 12px 24px rgba(111, 78, 55, 0.25);
}

/* Contoh 4: Custom Button Styling */
.btn-primary {
    background-color: var(--primary-color);
    color: white;
    padding: 12px 24px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 16px;
    transition: all 0.3s ease;
}

.btn-primary:hover {
    background-color: var(--secondary-color);
    transform: scale(1.05);
}

/* Contoh 5: Custom Footer */
footer {
    background: linear-gradient(135deg, #6F4E37 0%, #4a3728 100%);
    color: #D4A574;
}

/* Contoh 6: Dark Mode (Optional) */
@media (prefers-color-scheme: dark) {
    body {
        background-color: #1a1a1a;
        color: #e0e0e0;
    }
    
    .menu-card {
        background-color: #2a2a2a;
        color: #e0e0e0;
    }
}
EOF

cat > example/README_EXAMPLES.md << 'EOF'
# 📚 Contoh Implementasi

Folder ini berisi contoh-contoh konfigurasi dan styling yang bisa Anda copy & paste.

## File di Folder Ini

### 1. example-config.js
Contoh konfigurasi lengkap dengan nilai-nilai sampel.

**Cara pakai:**
1. Buka file ini
2. Copy field yang Anda butuhkan
3. Paste ke `js/config.js`
4. Ganti value dengan data toko Anda

### 2. example-styling.css
Contoh custom CSS styling.

**Cara pakai:**
1. Buka file ini
2. Copy CSS yang Anda inginkan
3. Paste di akhir `assets/css/style.css`
4. Customize sesuai kebutuhan

---

**Tips:** Jangan langsung edit file template utama. Selalu test di folder `example/` dulu!
EOF

echo -e "${GREEN}✓ Example files created${NC}"

# 5. CREATE .gitignore IF NOT EXISTS
if [ ! -f ".gitignore" ]; then
    cat > .gitignore << 'EOF'
# Dependencies
node_modules/
package-lock.json

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Build
dist/
build/
.cache/

# Logs
*.log
npm-debug.log*

# Env
.env
.env.local

# Temp
temp/
tmp/
*.tmp
EOF
    echo -e "${GREEN}✓ .gitignore created${NC}"
else
    echo -e "${YELLOW}→ .gitignore already exists${NC}"
fi

# 6. SUMMARY
echo ""
echo -e "${CYAN}╔════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}✅ FOLDER STRUCTURE SETUP COMPLETE!${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════════════════╝${NC}"

echo ""
echo -e "${YELLOW}📁 Folder Structure:${NC}"
echo "  js/"
echo "    ├── config.js (⭐ PEMBELI EDIT INI)"
echo "    ├── app.js"
echo "    ├── utils.js"
echo "    ├── cart.js"
echo "    ├── menu.js"
echo "    └── analytics.js"
echo ""
echo "  assets/"
echo "    ├── css/"
echo "    ├── images/"
echo "    │   ├── hero/"
echo "    │   ├── menu/ (kopi, makanan, minuman)"
echo "    │   ├── gallery/"
echo "    │   ├── about/"
echo "    │   ├── icons/"
echo "    │   └── favicons/"
echo "    └── fonts/"
echo ""
echo "  docs/"
echo "    ├── SETUP.md"
echo "    ├── CUSTOMIZATION.md"
echo "    ├── CONFIG.md"
echo "    ├── FAQ.md"
echo "    ├── DEPLOYMENT.md"
echo "    ├── CHANGELOG.md"
echo "    └── MEDIA.md"
echo ""
echo "  example/"
echo "    ├── example-config.js"
echo "    ├── example-styling.css"
echo "    └── README_EXAMPLES.md"
echo ""

echo -e "${YELLOW}✅ Next Steps:${NC}"
echo "  1. Review struktur folder yang sudah dibuat"
echo "  2. Pindahkan file HTML utama ke root (jika belum)"
echo "  3. Update link di HTML ke path yang benar"
echo "  4. Test di browser (buka index.html)"
echo "  5. Upload ke GitHub atau hosting"
echo ""

echo -e "${GREEN}🎉 Ready to sell your template!${NC}"
echo ""
