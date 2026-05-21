# 🎉 Mawar Coffee Shop - Static Website Template

Selamat datang! Ini adalah template website coffee shop statis yang **100% siap dijual** dan dapat digunakan oleh orang lain tanpa ketergantungan pada akses eksternal.

---

## 📦 Apa Yang Disertakan

✅ **HTML, CSS, JavaScript murni** (tanpa framework)  
✅ **Responsive design** (mobile-friendly)  
✅ **Video carousel hero** dengan smooth transitions  
✅ **Galeri interaktif** dengan lightbox  
✅ **Maps integration** (Leaflet)  
✅ **Social media links**  
✅ **Offline ready** (semua media lokal)  
✅ **SEO optimized**  
✅ **File konfigurasi terpusat** (`js/config.js`)  

---

## 🚀 Quick Start (Untuk Pembeli Template)

### 1️⃣ Setup Media (PENTING)

Template ini membutuhkan file media (video & foto) yang harus didownload terlebih dahulu.

**Jalankan salah satu command:**

**Windows (PowerShell):**
```bash
./download-media.ps1
```

**Mac/Linux (Bash):**
```bash
bash download-media.sh
```

**Manual:**
- Baca file `DOWNLOAD_MEDIA.md` untuk link download
- Simpan ke folder `assets/images/`

### 2️⃣ Edit Konfigurasi

Edit **HANYA** file `js/config.js` - semua setting toko ada di sini:

```javascript
const CONFIG = {
    // Informasi Toko
    storeName: "Nama Toko Anda",
    tagline: "Tagline toko",
    locationCity: "Kota",
    whatsappNumber: "628123456789",
    // ... dan banyak lagi
};
```

**🎯 PENTING:** Jangan ubah file HTML atau CSS - cukup edit `config.js` saja!

### 3️⃣ Buka di Browser

Double-click `index.html` atau gunakan Live Server (VS Code Extension).

### 4️⃣ Test Responsif

Buka DevTools (F12) → Toggle device toolbar untuk test di berbagai ukuran.

---

## 📋 File Structure

```
mawar-coffe-shop-statis/
│
├── index.html                    # File HTML utama
├── js/
│   ├── config.js                # 📝 EDIT INI SAJA
│   └── main.js                  # Logic (jangan ubah)
├── assets/
│   ├── css/
│   │   └── style.css            # Styling (jangan ubah)
│   └── images/
│       ├── hero-video-1.mp4      # 6 video hero
│       ├── hero-video-2.mp4
│       ├── ...
│       ├── hero-banner.webp      # Foto-foto placeholder
│       ├── gallery-1.webp
│       ├── menu-kopi-1.webp
│       └── ... (lebih banyak)
│
├── README.md                     # Ini
├── DOWNLOAD_MEDIA.md             # Panduan download media
├── SETUP_MEDIA_LOKAL.md          # Setup lengkap
├── download-media.ps1            # Script download (Windows)
├── download-media.sh             # Script download (Mac/Linux)
└── CARA_UPLOAD.txt               # Instruksi upload
```

---

## 🎨 Konfigurasi Toko

Buka `js/config.js` dan edit nilai-nilai berikut:

### 🏪 Identitas Toko
```javascript
storeName: "Warkop Mawar",           // Nama toko
tagline: "Every cup tells a story",  // Tagline
shortDescription: "...",             // Deskripsi
```

### 📍 Lokasi
```javascript
locationCity: "Bondowoso",
locationProvince: "Jawa Timur",
establishedYear: 2024,
```

### 📞 Kontak
```javascript
whatsappNumber: "6282244019596",     // Format: 62xxx
googleMapsLink: "https://maps.app.goo.gl/...",
grabFoodLink: "https://food.grab.com/...",
shopeeFoodLink: "https://shopee.co.id/...",
```

### 💬 Media Sosial
```javascript
instagramLink: "https://www.instagram.com/namatoko",
tiktokLink: "https://www.tiktok.com/@namatoko",
```

### 🕐 Jam Operasional
```javascript
openingHours: {
    days: "Everyday",
    hours: "09:00 – 00:00"
},
```

### 📊 Statistik
```javascript
priceStartingFrom: "Rp5.000",
totalMenuItems: "50+",
```

---

## 🎥 Mengganti Video Hero

Template ini dilengkapi **6 video hero carousel**. Untuk mengganti:

1. **Download video baru** (minimal 720p, format MP4)
2. **Simpan ke** `assets/images/hero-video-X.mp4` (ganti X dengan 1-6)
3. **Opsional:** Update deskripsi video di `js/config.js`

---

## 📸 Mengganti Foto

Semua foto placeholder tersimpan di `assets/images/`:

- `hero-banner.webp` → Banner hero statis (backup mobile)
- `about-interior.webp` → Foto interior untuk section About
- `gallery-*.webp` → Galeri suasana cafe
- `menu-kopi-*.webp` → Foto menu kopi
- `menu-food-*.webp` → Foto menu makanan ringan

**Untuk mengganti:**
1. Delete foto lama
2. Tambahkan foto baru dengan **nama yang sama**
3. Gunakan format JPG, WebP, atau PNG

---

## 🛠️ Troubleshooting

### ❌ Video tidak muncul
- Cek folder `assets/images/` - file video harus ada
- Pastikan nama file PERSIS: `hero-video-1.mp4`, `hero-video-2.mp4`, dst
- Buka Console (F12) untuk lihat error

### ❌ Website lambat
- Compress video: gunakan FFmpeg atau online tools
- Resize foto ke ukuran yang sesuai
- Gunakan format WebP daripada JPG

### ❌ WhatsApp link tidak bekerja
- Pastikan format nomor: `6281234567890` (tanpa + atau spasi)
- Cek di `js/config.js` - field `whatsappNumber`

### ❌ Maps tidak muncul
- Pastikan Internet Connection aktif
- Cek `googleMapsLink` - harus valid URL dari Google Maps

---

## 📱 Fitur-Fitur

### 🎬 Video Carousel Hero
- Autoplay dengan smooth transitions
- Manual control dengan dot buttons
- Responsif di semua ukuran

### 🖼️ Galeri Interaktif
- Lightbox (click untuk expand)
- Lazy loading (faster loading)

### 🗺️ Maps Integration
- Leaflet JS untuk peta interaktif
- Tampil lokasi toko dengan marker

### 📱 Mobile Optimized
- Fully responsive (mobile-first)
- Touch-friendly buttons & navigation

### ♿ Accessibility
- Semantic HTML
- ARIA labels
- Keyboard navigation support

### 🔍 SEO Optimized
- Meta tags (title, description, keywords)
- Structured data
- Sitemap ready

---

## 💾 Backup & Version Control

Jika menggunakan Git:

```bash
# Initialize Git
git init
git add .
git commit -m "Initial: Mawar Coffee Shop Template"

# Jika ada file media besar, gunakan Git LFS
git lfs install
git lfs track "*.mp4"
git add .gitattributes
git add assets/images/
git commit -m "Add media files"
```

---

## 📤 Siap Upload ke Hosting

Website ini siap di-upload ke hosting apapun (WordPress hosting, cPanel, Netlify, Vercel, etc).

**Important:** Pastikan `assets/images/` berisi semua file media!

---

## 🎓 Tips Penjualan Template

1. **Sertakan semua file dokumentasi:**
   - README.md (panduan umum)
   - SETUP_MEDIA_LOKAL.md (setup media)
   - DOWNLOAD_MEDIA.md (daftar media)

2. **Buat demo video:**
   - Show cara edit `config.js`
   - Show hasil perubahan realtime

3. **Tawarkan customization:**
   - Tambah halaman produk
   - Integrate POS system
   - Email newsletter signup

4. **Support buyers:**
   - Email support
   - Video tutorial
   - FAQ page

---

## 📝 License & Credit

**Template Maker:** Satria Nanda Tama  
**Portfolio:** https://karyakarsa.com/satriatama  

**Media (CC0 - Gratis):**
- Video dari Pexels Videos (https://www.pexels.com/videos/)
- Foto dari Unsplash & Pexels

Diizinkan untuk dijual kembali sebagai template! ✅

---

## 📞 Support & Questions

Hubungi pembuat template jika ada pertanyaan teknis:
- Email: [Contact info]
- Instagram: [@creator]
- KaryaKarsa: https://karyakarsa.com/satriatama

---

## ✅ Checklist Before Selling

- [ ] Semua video ada di `assets/images/`
- [ ] Edit `config.js` dengan data toko
- [ ] Test website offline (matikan WiFi)
- [ ] Test responsive (mobile, tablet, desktop)
- [ ] Cek semua link (WhatsApp, Maps, Socmed)
- [ ] Test video carousel
- [ ] Test galeri lightbox
- [ ] No console errors (F12)
- [ ] Website fast loading
- [ ] All images visible

---

**Last Updated:** 2026-05-21  
**Version:** 1.0.0  
**Status:** ✅ PRODUCTION READY

🎉 **Siap dijual sebagai template!**
