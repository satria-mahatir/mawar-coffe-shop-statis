# ═══════════════════════════════════════════════════════════════════════════════
# SETUP FOLDER STRUCTURE - Coffee Shop Template (Windows PowerShell)
# ═══════════════════════════════════════════════════════════════════════════════
#
# Script ini membuat struktur folder yang ideal untuk template dijual.
# Jalankan dari root folder project: .\setup-structure.ps1
#
# Jika error "File tidak bisa dijalankan", jalankan dulu:
#   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#
# ═══════════════════════════════════════════════════════════════════════════════

Write-Host "`n" -ForegroundColor Cyan
Write-Host "╔════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                  FOLDER STRUCTURE SETUP                           ║" -ForegroundColor Cyan
Write-Host "║           Coffee Shop Template - Organized & Ready to Sell        ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# 1. CREATE MAIN FOLDERS
Write-Host "📁 Step 1: Creating main folders..." -ForegroundColor Yellow

$folders = @(
    "docs",
    "example",
    "assets\css",
    "assets\fonts",
    "assets\images\hero",
    "assets\images\menu\kopi",
    "assets\images\menu\makanan",
    "assets\images\menu\minuman",
    "assets\images\gallery",
    "assets\images\about",
    "assets\images\icons",
    "assets\images\favicons"
)

foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder -Force | Out-Null
        Write-Host "  ✓ $folder" -ForegroundColor Green
    }
    else {
        Write-Host "  → $folder (sudah ada)" -ForegroundColor Gray
    }
}

Write-Host "✓ Main folders created" -ForegroundColor Green

# 2. CREATE DOCUMENTATION FILES
Write-Host "`n📄 Step 2: Creating documentation files..." -ForegroundColor Yellow

# SETUP.md
@"
# 🚀 Setup Lengkap - Coffee Shop Template

## Quick Start (5 Menit)

### 1. Buka index.html
Cukup double-click `index.html` atau drag ke browser.

### 2. Edit config.js
Buka file `js/config.js` dan ubah:
- Nama toko
- Nomor WhatsApp
- Link media sosial
- Lokasi

### 3. Refresh Browser
Tekan `Ctrl+R` atau `Cmd+R` - website updated otomatis ✅

## Struktur Folder

Lihat file `../FOLDER_STRUCTURE_DESIGN.md` untuk penjelasan lengkap.

## File yang Boleh Diubah

✅ BOLEH:
- `js/config.js` - Konfigurasi toko
- `assets/images/*` - Foto & video
- `assets/css/style.css` - Custom CSS (advanced users)

❌ JANGAN:
- `index.html` - Ubah struktur
- `js/app.js`, dll - Ubah logic
- Struktur folder

## Troubleshooting

Baca file dokumentasi lainnya di folder ini untuk bantuan lebih lanjut.
"@ | Set-Content -Path "docs\SETUP.md" -Encoding UTF8
Write-Host "  ✓ docs/SETUP.md" -ForegroundColor Green

# CUSTOMIZATION.md
@"
# 🎨 Customization Guide

## 1. Mengubah Nama & Data Toko

Edit `js/config.js`:

\`\`\`javascript
const CONFIG = {
    storeName: "Nama Toko Anda",
    locationCity: "Kota",
    whatsappNumber: "628123456789",
    // ... ubah semua field sesuai data toko
};
\`\`\`

## 2. Mengubah Warna & Styling

Edit `assets/css/style.css` dan cari:

\`\`\`css
--primary-color: #E8622A;
--secondary-color: #2a2a2a;
\`\`\`

Ganti dengan warna favorit Anda.

## 3. Mengubah Foto

Ganti file di folder:
- `assets/images/hero/` - Hero banner
- `assets/images/menu/` - Foto menu
- `assets/images/gallery/` - Galeri
- `assets/images/about/` - Foto interior

Gunakan format WebP atau JPG, maksimal 500KB per file.

---

Untuk detail lebih lanjut, lihat file dokumentasi lainnya.
"@ | Set-Content -Path "docs\CUSTOMIZATION.md" -Encoding UTF8
Write-Host "  ✓ docs/CUSTOMIZATION.md" -ForegroundColor Green

# CONFIG.md
@"
# ⚙️ Penjelasan Config.js

Buka file `js/config.js` untuk melihat semua field yang bisa dikustomisasi.

## Field Utama

### Informasi Toko
- storeName: Nama toko
- tagline: Tagline/motto
- locationCity: Kota
- locationProvince: Provinsi
- establishedYear: Tahun berdiri

### Kontak
- whatsappNumber: Nomor WA (format: 62xxx tanpa +)
- googleMapsLink: Link Google Maps
- grabFoodLink: Link GrabFood
- shopeeFoodLink: Link ShopeeFood

### Social Media
- instagramLink: Link Instagram
- tiktokLink: Link TikTok

### Statistik
- totalMenuItems: Jumlah menu
- priceStartingFrom: Harga minimal

---

Edit sesuai data toko Anda, simpan, refresh browser!
"@ | Set-Content -Path "docs\CONFIG.md" -Encoding UTF8
Write-Host "  ✓ docs/CONFIG.md" -ForegroundColor Green

# FAQ.md
@"
# ❓ FAQ - Pertanyaan Umum

## Bisakah saya mengganti foto?
Ya, ganti file di `assets/images/` dengan foto Anda.

## Apakah perlu coding?
Tidak. Edit hanya file `js/config.js` tanpa perlu programming.

## Bagaimana cara deploy?
Baca file `docs/DEPLOYMENT.md`.

## Apakah bisa pakai payment gateway?
Template ini tidak include payment. Gunakan WhatsApp/GrabFood untuk order.

---

Pertanyaan lain? Lihat dokumentasi lengkap atau hubungi pembuat template.
"@ | Set-Content -Path "docs\FAQ.md" -Encoding UTF8
Write-Host "  ✓ docs/FAQ.md" -ForegroundColor Green

# DEPLOYMENT.md
@"
# 🚀 Deploy ke Hosting

## Opsi 1: Netlify (Gratis & Mudah)
1. Buka netlify.com
2. Drag & drop folder project
3. Website live!

## Opsi 2: Vercel
1. Buka vercel.com
2. Upload project
3. Done!

## Opsi 3: GitHub Pages
1. Push ke GitHub
2. Enable Pages di settings
3. Website live di username.github.io

## Opsi 4: Shared Hosting
Upload via FTP ke folder public_html/

---

Rekomendasi: Netlify untuk kemudahan & performa terbaik.
"@ | Set-Content -Path "docs\DEPLOYMENT.md" -Encoding UTF8
Write-Host "  ✓ docs/DEPLOYMENT.md" -ForegroundColor Green

# CHANGELOG.md
@"
# 📝 CHANGELOG

## Version 1.0.0 (2026-05-21)
- ✅ Initial release
- ✅ Dynamic config system
- ✅ Responsive design
- ✅ Video carousel hero
- ✅ SEO optimized

---

Keep checking for updates!
"@ | Set-Content -Path "docs\CHANGELOG.md" -Encoding UTF8
Write-Host "  ✓ docs/CHANGELOG.md" -ForegroundColor Green

# MEDIA.md
@"
# 📸 Panduan Mengganti Media

## Foto Hero
- File: `assets/images/hero/hero-banner.webp`
- Ukuran: 1920x1080px
- Format: WebP, JPG, atau PNG

## Video Hero
- File: `assets/images/hero/hero-video-X.mp4` (X = 1-6)
- Format: MP4
- Resolusi: 1280x720px
- Size: 20-50MB per video

## Foto Menu
- Lokasi: `assets/images/menu/kopi/`, `makanan/`, `minuman/`
- Ukuran: 400x300px
- Format: WebP

## Foto Galeri
- Lokasi: `assets/images/gallery/`
- Ukuran: 600x400px
- Jumlah: 4+ foto

---

Tips: Compress foto dengan TinyPNG atau Squoosh untuk performa lebih baik!
"@ | Set-Content -Path "docs\MEDIA.md" -Encoding UTF8
Write-Host "  ✓ docs/MEDIA.md" -ForegroundColor Green

Write-Host "✓ Documentation files created" -ForegroundColor Green

# 3. CREATE JS FILES
Write-Host "`n📜 Step 3: Creating JavaScript files..." -ForegroundColor Yellow

if (-not (Test-Path "js\app.js")) {
    @"
// ═══════════════════════════════════════════════════════════════════════════════
// APP.JS - Main Application Logic
// ═══════════════════════════════════════════════════════════════════════════════

console.log('✅ App initialized');

// Your main app logic here
"@ | Set-Content -Path "js\app.js" -Encoding UTF8
    Write-Host "  ✓ js/app.js" -ForegroundColor Green
}

if (-not (Test-Path "js\utils.js")) {
    @"
// ═══════════════════════════════════════════════════════════════════════════════
// UTILS.JS - Utility Functions & Helpers
// ═══════════════════════════════════════════════════════════════════════════════

function formatCurrency(amount) {
    return new Intl.NumberFormat('id-ID', {
        style: 'currency',
        currency: 'IDR'
    }).format(amount);
}

// Add more utilities here
"@ | Set-Content -Path "js\utils.js" -Encoding UTF8
    Write-Host "  ✓ js/utils.js" -ForegroundColor Green
}

if (-not (Test-Path "js\cart.js")) {
    @"
// ═══════════════════════════════════════════════════════════════════════════════
// CART.JS - Shopping Cart Logic
// ═══════════════════════════════════════════════════════════════════════════════

const Cart = {
    items: [],
    add(item) { this.items.push(item); },
    remove(itemId) { this.items = this.items.filter(i => i.id !== itemId); },
    clear() { this.items = []; }
};
"@ | Set-Content -Path "js\cart.js" -Encoding UTF8
    Write-Host "  ✓ js/cart.js" -ForegroundColor Green
}

if (-not (Test-Path "js\menu.js")) {
    @"
// ═══════════════════════════════════════════════════════════════════════════════
// MENU.JS - Menu Management
// ═══════════════════════════════════════════════════════════════════════════════

console.log('✅ Menu module loaded');

// Menu management logic here
"@ | Set-Content -Path "js\menu.js" -Encoding UTF8
    Write-Host "  ✓ js/menu.js" -ForegroundColor Green
}

if (-not (Test-Path "js\analytics.js")) {
    @"
// ═══════════════════════════════════════════════════════════════════════════════
// ANALYTICS.JS - Analytics & Tracking (Optional)
// ═══════════════════════════════════════════════════════════════════════════════

console.log('✅ Analytics module loaded');

// Add analytics tracking here
"@ | Set-Content -Path "js\analytics.js" -Encoding UTF8
    Write-Host "  ✓ js/analytics.js" -ForegroundColor Green
}

# 4. CREATE EXAMPLE FILES
Write-Host "`n📂 Step 4: Creating example files..." -ForegroundColor Yellow

@"
// ═══════════════════════════════════════════════════════════════════════════════
// EXAMPLE CONFIG - Contoh Konfigurasi
// ═══════════════════════════════════════════════════════════════════════════════

const CONFIG_EXAMPLE = {
    storeName: "Cafe Cantik",
    tagline: "Kopi Terbaik Se-Indonesia",
    locationCity: "Jakarta Selatan",
    locationProvince: "DKI Jakarta",
    establishedYear: 2020,
    whatsappNumber: "6281234567890",
    instagramLink: "https://www.instagram.com/cafecantik",
    tiktokLink: "https://www.tiktok.com/@cafecantik",
    // ... field lainnya
};
"@ | Set-Content -Path "example\example-config.js" -Encoding UTF8
Write-Host "  ✓ example/example-config.js" -ForegroundColor Green

@"
/* ═══════════════════════════════════════════════════════════════════════════════ */
/* EXAMPLE STYLING - Contoh Custom CSS */
/* ═══════════════════════════════════════════════════════════════════════════════ */

/* Contoh: Ubah Warna Utama */
:root {
    --primary-color: #6F4E37;      /* Brown coffee theme */
    --secondary-color: #D4A574;    /* Light brown */
}

/* Contoh: Custom Card Styling */
.menu-card {
    box-shadow: 0 4px 12px rgba(111, 78, 55, 0.15);
    border-radius: 12px;
    transition: all 0.3s ease;
}

.menu-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 12px 24px rgba(111, 78, 55, 0.25);
}
"@ | Set-Content -Path "example\example-styling.css" -Encoding UTF8
Write-Host "  ✓ example/example-styling.css" -ForegroundColor Green

@"
# 📚 Contoh Implementasi

Copy & paste contoh dari file-file ini ke project Anda.

## example-config.js
Contoh field konfigurasi lengkap.

## example-styling.css
Contoh custom CSS styling.

---

Tips: Test di folder contoh dulu sebelum apply ke file utama!
"@ | Set-Content -Path "example\README_EXAMPLES.md" -Encoding UTF8
Write-Host "  ✓ example/README_EXAMPLES.md" -ForegroundColor Green

# 5. CREATE .gitignore
if (-not (Test-Path ".gitignore")) {
    @"
# Dependencies
node_modules/
package-lock.json

# IDE
.vscode/
.idea/
*.swp

# OS
.DS_Store
Thumbs.db

# Build
dist/
build/

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
"@ | Set-Content -Path ".gitignore" -Encoding UTF8
    Write-Host "`n✓ .gitignore created" -ForegroundColor Green
}

# 6. SUMMARY
Write-Host "`n" -ForegroundColor Cyan
Write-Host "╔════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "✅ FOLDER STRUCTURE SETUP COMPLETE!" -ForegroundColor Green
Write-Host "╚════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan

Write-Host "`n📁 Folder Structure Created:" -ForegroundColor Yellow
Write-Host @"
  ✓ js/ (6 files)
    - config.js (⭐ PEMBELI EDIT INI)
    - app.js, utils.js, cart.js, menu.js, analytics.js
  
  ✓ assets/ (terorganisir)
    - css/
    - images/ (hero, menu, gallery, about, icons, favicons)
    - fonts/
  
  ✓ docs/ (7 files panduan lengkap)
    - SETUP.md, CUSTOMIZATION.md, CONFIG.md
    - FAQ.md, DEPLOYMENT.md, CHANGELOG.md, MEDIA.md
  
  ✓ example/ (contoh implementasi)
    - example-config.js, example-styling.css, README_EXAMPLES.md
  
  ✓ .gitignore (untuk git)
"@

Write-Host "`n✅ Next Steps:" -ForegroundColor Yellow
Write-Host @"
  1. ✓ Struktur folder sudah dibuat
  2. → Periksa apakah semua folder ada
  3. → Pindahkan file HTML utama ke root (jika belum)
  4. → Update link di HTML ke path yang benar
  5. → Test di browser (buka index.html)
  6. → Upload ke GitHub atau hosting
"@

Write-Host "`n🎉 Ready to sell your template!" -ForegroundColor Green
Write-Host ""
