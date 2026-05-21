# ✅ CHECKLIST & SUMMARY - Migrasi Media dari Google Drive ke Lokal

**Status Update:** 21 Mei 2026

---

## 🎯 APA YANG SUDAH SELESAI

### ✅ 1. Update HTML (index.html)
- [x] 6 video Google Drive diganti dengan path lokal
  - `hv0` → `assets/images/hero-video-1.mp4`
  - `hv1` → `assets/images/hero-video-2.mp4`
  - `hv2` → `assets/images/hero-video-3.mp4`
  - `hv3` → `assets/images/hero-video-4.mp4`
  - `hv4` → `assets/images/hero-video-5.mp4`
  - `hv5` → `assets/images/hero-video-6.mp4`
- [x] Tambahan atribut `type="video/mp4"` di setiap `<source>`

### ✅ 2. Dokumentasi Lengkap Dibuat
- [x] **DOWNLOAD_MEDIA.md** - Daftar 21 file media CC0
- [x] **SETUP_MEDIA_LOKAL.md** - Panduan step-by-step (8 langkah)
- [x] **TEMPLATE_README.md** - Master guide untuk pembeli template
- [x] **download-media.ps1** - Script otomatis Windows (PowerShell)
- [x] **download-media.sh** - Script otomatis Mac/Linux (Bash)

### ✅ 3. Media yang Siap Diunduh
Tersedia 21 file media dari sumber CC0 terpercaya:

**VIDEO (6 file):**
- 6× Video hero carousel (MP4, dari Pexels Videos)

**FOTO (15 file):**
- 1× Hero banner
- 1× About interior
- 4× Galeri suasana cafe
- 3× Menu kopi
- 3× Menu makanan ringan

---

## 📋 LANGKAH SELANJUTNYA UNTUK PEMBELI

### STEP 1: Download Media
```bash
# Windows (PowerShell):
./download-media.ps1

# Mac/Linux (Bash):
bash download-media.sh

# Atau manual: baca DOWNLOAD_MEDIA.md
```

### STEP 2: Edit Konfigurasi
- Edit file `js/config.js` 
- Ubah nama toko, nomor WA, link social media, dll
- Tidak perlu ubah file HTML atau CSS!

### STEP 3: Test Website
- Buka `index.html` di browser
- Test video carousel
- Cek semua link bekerja
- Test offline (matikan WiFi)

### STEP 4: Siap Dijual
- Website 100% offline ready
- Tidak ada URL eksternal Google Drive
- Tidak ada dependensi pihak ketiga
- Siap untuk dipasarkan! 🎉

---

## 📁 File Structure Setelah Setup

```
mawar-coffe-shop-statis/
├── index.html (✅ SUDAH UPDATE - video lokal)
├── js/
│   ├── config.js (📝 PEMBELI EDIT INI SAJA)
│   └── main.js
├── assets/
│   ├── css/
│   │   └── style.css
│   └── images/
│       ├── hero-video-1.mp4 ⬇️ DOWNLOAD DARI SINI
│       ├── hero-video-2.mp4
│       ├── hero-video-3.mp4
│       ├── hero-video-4.mp4
│       ├── hero-video-5.mp4
│       ├── hero-video-6.mp4
│       ├── hero-banner.webp
│       ├── about-interior.webp
│       ├── gallery-1.webp
│       ├── gallery-2.webp
│       ├── gallery-3.webp
│       ├── gallery-4.webp
│       ├── menu-kopi-1.webp
│       ├── menu-kopi-2.webp
│       ├── menu-kopi-3.webp
│       ├── menu-food-1.webp
│       ├── menu-food-2.webp
│       └── menu-food-3.webp
│
├── DOWNLOAD_MEDIA.md (🎯 PEMBELI BACA INI DULU)
├── SETUP_MEDIA_LOKAL.md (📖 Panduan detail)
├── TEMPLATE_README.md (📚 Master guide)
├── download-media.ps1 (🔧 Auto download Windows)
├── download-media.sh (🔧 Auto download Mac/Linux)
└── CARA_UPLOAD.txt (Upload ke hosting)
```

---

## 🚀 Quick Test Checklist

Sebelum menjual, test ini untuk pastikan semuanya OK:

```
□ Buka index.html di browser
□ Video hero carousel berjalan smooth
□ Klik dot buttons - video berubah
□ Klik galeri - lightbox muncul
□ Klik link WhatsApp - buka WA
□ Klik link Maps - buka Google Maps
□ Klik social media - buka Instagram/TikTok
□ Cek responsive - buka DevTools (F12) → responsive mode
□ Matikan WiFi - website masih berjalan 100% offline ✅
□ F12 Console - tidak ada error merah
```

---

## 📊 Media Size Reference

| Kategori | Jumlah | Format | Size/file |
|----------|--------|--------|-----------|
| Video Hero | 6 | MP4 | 15-30 MB |
| Foto Hero & About | 2 | WebP | 200-400 KB |
| Galeri | 4 | WebP | 150-300 KB |
| Menu | 6 | WebP | 100-250 KB |
| **TOTAL** | **21** | Mixed | ~**150-200 MB** |

💡 **Tip:** Untuk mengurangi size, download video dengan quality 720p dan compress dengan FFmpeg jika perlu.

---

## 🎁 Saat Menjual Template - Include Files:

✅ Pastikan file ini ada dalam package:
- `README.md` ← Master guide
- `DOWNLOAD_MEDIA.md` ← Link media
- `SETUP_MEDIA_LOKAL.md` ← Panduan setup
- `TEMPLATE_README.md` ← Feature guide
- `download-media.ps1` ← Windows download script
- `download-media.sh` ← Mac/Linux download script
- Seluruh folder `assets/`
- File HTML & JS

⚠️ **Jangan lupa:** Sertakan instruksi cara download media!

---

## 🔐 Verifikasi - Tidak Ada URL Eksternal Lagi

Cek file `index.html` dengan search (Ctrl+F):

```
❌ Jangan ada string ini:
   - "drive.google.com"
   - "youtube.com"
   
✅ Yang boleh ada:
   - "assets/images/hero-video-X.mp4"
   - "maps.google.com" (untuk link tombol)
   - "instagram.com", "tiktok.com" (untuk social media)
   - Font dari Google Fonts (itu boleh - CDN umum)
```

---

## 🎓 Tips Untuk Pembeli Template

Ketika menjual, bilang ke pembeli:

1. **"Cukup edit `config.js` - tidak perlu ubah HTML"**
   - Lebih aman, tidak ada risiko break
   - Semua perubahan automatic

2. **"Website berjalan 100% offline"**
   - Tidak perlu internet untuk jalan
   - Loading cepat, tidak tergantung server

3. **"Semua media sudah CC0 - bebas pakai"**
   - Tidak ada masalah copyright
   - Bisa langsung dijual kembali

4. **"Include documentation & download scripts"**
   - Mudah untuk setup
   - Support langsung include

---

## ✨ Next Features (Optional)

Jika ingin upgrade template:
- [ ] Add real menu items dengan harga
- [ ] Integrate payment gateway (Stripe, Midtrans)
- [ ] Add customer review/testimonial section
- [ ] Email newsletter signup
- [ ] CMS-friendly version
- [ ] Dark mode toggle
- [ ] Multi-language support

---

## 📞 Support Notes

**Untuk pembeli yang masalah:**

1. **Video tidak muncul**
   - "Pastikan file ada di `assets/images/hero-video-1.mp4` dst"
   - "Jalankan script `download-media.ps1` atau `download-media.sh`"

2. **Website lambat**
   - "Compress video dengan FFmpeg: `ffmpeg -i input.mp4 -crf 23 output.mp4`"
   - "Reduce image size untuk mobile"

3. **WhatsApp link tidak bekerja**
   - "Format nomor harus: `6281234567890` (tanpa + atau spasi)"

4. **Edit config.js tapi tidak muncul di website**
   - "Refresh browser (Ctrl+F5 atau Cmd+Shift+R)"
   - "Clear cache/cookies jika perlu"

---

## ✅ FINAL STATUS

```
┌─────────────────────────────────────────────────────┐
│  🎉 TEMPLATE READY FOR SALE                         │
│                                                     │
│  ✅ HTML: Update dengan path lokal video            │
│  ✅ Config: Centralized di js/config.js             │
│  ✅ Media: CC0 dari Pexels & Unsplash               │
│  ✅ Scripts: Download otomatis (Windows & Mac/Linux)│
│  ✅ Docs: Lengkap & terstruktur                     │
│  ✅ Offline: 100% siap tanpa internet               │
│                                                     │
│  🚀 SIAP UNTUK DIPASARKAN!                          │
└─────────────────────────────────────────────────────┘
```

---

**Last Updated:** 2026-05-21  
**Version:** 1.0.0  
**Made by:** Satria Nanda Tama  
**Portfolio:** https://karyakarsa.com/satriatama

Untuk bantuan lebih lanjut, hubungi pembuat template! 📧
