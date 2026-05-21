# 📖 PANDUAN LANGKAH DEMI LANGKAH - Migrasi dari Google Drive ke Media Lokal

## 🎯 Tujuan
Mengganti semua video dari Google Drive dengan file lokal di folder `assets/images/` sehingga website bisa berjalan **100% offline** tanpa ketergantungan URL eksternal.

---

## 📋 CHECKLIST

- [ ] Step 1: Download semua media (video & foto)
- [ ] Step 2: Update URL video di index.html
- [ ] Step 3: (Opsional) Update URL foto di HTML
- [ ] Step 4: Test website di browser
- [ ] Step 5: Siap dijual sebagai template

---

## 🚀 STEP 1: Download Semua Media

### Opsi A: Otomatis (RECOMMENDED)

**Windows (PowerShell):**
```bash
# Buka PowerShell di folder project, lalu:
./download-media.ps1
```

**Mac/Linux (Bash):**
```bash
# Buka Terminal di folder project, lalu:
bash download-media.sh
chmod +x download-media.sh && ./download-media.sh
```

### Opsi B: Manual Download

1. Buka file `DOWNLOAD_MEDIA.md`
2. Klik link sumber (Pexels / Unsplash) untuk setiap media
3. Klik tombol Download
4. Simpan ke folder `assets/images/` dengan nama yang sesuai
   - Contoh: `hero-video-1.mp4`, `gallery-1.webp`, dst

### Opsi C: Generator Video Placeholder (Jika Video Tidak Tersedia)

Jika Anda ingin membuat video placeholder lokal (misalnya dari file foto):

```bash
# Dengan FFmpeg (jika terinstal):
ffmpeg -loop 1 -i assets/images/hero-banner.webp -c:v libx264 -t 10 -pix_fmt yuv420p -vf scale=1920:1080 assets/images/hero-video-placeholder.mp4
```

---

## 🎥 STEP 2: Update URL Video di index.html

### Cari & Ganti (Recommended)

1. Buka `index.html` di VS Code
2. Tekan `Ctrl+H` (atau `Cmd+H` di Mac) untuk buka Find & Replace
3. Ganti satu per satu:

| Cari (Google Drive URL) | Ganti Dengan | Keterangan |
|-------------------------|-------------|-----------|
| `https://drive.google.com/uc?export=download&id=1AyxPtRbWh5dCYmsAMeB1Zesqn3JEKgbJ` | `assets/images/hero-video-1.mp4` | Video hero 1 |
| `https://drive.google.com/uc?export=download&id=14HlI7-iXNSqtgZrjpPy_0KDmvFSxaXl9` | `assets/images/hero-video-2.mp4` | Video hero 2 |
| `https://drive.google.com/uc?export=download&id=1vgxBSmzW2l3RAy0YPGCjIlX61vG5PF-O` | `assets/images/hero-video-3.mp4` | Video hero 3 |
| `https://drive.google.com/uc?export=download&id=1B9ao0ae9tnAQzei4eDz56l0gctztzeCB` | `assets/images/hero-video-4.mp4` | Video hero 4 |
| `https://drive.google.com/uc?export=download&id=1G8fkXlUt7DhpjNBK8-7mQckZ4oBnLLy5` | `assets/images/hero-video-5.mp4` | Video hero 5 |
| `https://drive.google.com/uc?export=download&id=1DTciW04Nq3zPoYEqXKzyv7Ih_L4_NMVr` | `assets/images/hero-video-6.mp4` | Video hero 6 |

### Contoh Perubahan:

**SEBELUM:**
```html
<video autoplay loop muted playsinline class="hero-video active" id="hv0">
    <source src="https://drive.google.com/uc?export=download&id=1AyxPtRbWh5dCYmsAMeB1Zesqn3JEKgbJ">
</video>

<video loop muted playsinline class="hero-video" id="hv1">
    <source src="https://drive.google.com/uc?export=download&id=14HlI7-iXNSqtgZrjpPy_0KDmvFSxaXl9">
</video>
```

**SESUDAH:**
```html
<video autoplay loop muted playsinline class="hero-video active" id="hv0">
    <source src="assets/images/hero-video-1.mp4" type="video/mp4">
</video>

<video loop muted playsinline class="hero-video" id="hv1">
    <source src="assets/images/hero-video-2.mp4" type="video/mp4">
</video>
```

### Perhatian:
- ✅ Tambahkan atribut `type="video/mp4"` di setiap `<source>`
- ✅ Ganti URL dengan path lokal `assets/images/hero-video-X.mp4`
- ⚠️ Pastikan nama file PERSIS sama dengan file yang di-download

---

## 📸 STEP 3: (Opsional) Update URL Foto di HTML

Jika HTML Anda menggunakan URL eksternal untuk foto (misalnya Unsplash/Pexels), ganti dengan path lokal:

**SEBELUM:**
```html
<img src="https://images.unsplash.com/photo-xxxxx" alt="Gallery">
```

**SESUDAH:**
```html
<img src="assets/images/gallery-1.webp" alt="Gallery" loading="lazy">
```

Struktur foto di `assets/images/`:
```
gallery-1.webp         (foto galeri 1)
gallery-2.webp         (foto galeri 2)
gallery-3.webp         (foto galeri 3)
gallery-4.webp         (foto galeri 4)
hero-banner.webp       (hero banner statis, untuk backup mobile)
about-interior.webp    (foto interior untuk section About)
menu-kopi-1.webp       (foto menu kopi 1)
menu-kopi-2.webp       (foto menu kopi 2)
menu-kopi-3.webp       (foto menu kopi 3)
menu-food-1.webp       (foto menu makanan ringan 1)
menu-food-2.webp       (foto menu makanan ringan 2)
menu-food-3.webp       (foto menu makanan ringan 3)
```

---

## 🧪 STEP 4: Test Website di Browser

1. **Simpan semua perubahan** (Ctrl+S)
2. **Buka `index.html` di browser**
   - Double-click `index.html`, atau
   - Klik kanan → Open with → Chrome/Firefox, atau
   - Gunakan Live Server (ekstension VS Code)
3. **Cek hal-hal berikut:**
   - ✅ Video hero carousel berjalan smooth
   - ✅ Tidak ada error di Console (F12 → Console tab)
   - ✅ Semua gambar muncul dengan benar
   - ✅ Website berjalan **OFFLINE** (test dengan matikan WiFi)

---

## ✅ STEP 5: Siap Dijual Sebagai Template

Setelah semua test berhasil:

```
✅ Semua media ada di folder assets/images/ (lokal)
✅ Tidak ada URL Google Drive di index.html
✅ Tidak ada URL eksternal untuk video & foto utama
✅ Website berjalan 100% offline
✅ SIAP DIJUAL! 🎉
```

---

## 🔍 Troubleshooting

### ❌ Video tidak muncul / error di console

**Kemungkinan penyebab:**
1. File video tidak ada di `assets/images/`
   - **Solusi:** Cek nama file - harus PERSIS seperti di HTML
   
2. Path salah (typo atau case sensitive)
   - **Solusi:** Pastikan path `assets/images/hero-video-1.mp4` (lowercase)
   
3. Format video tidak didukung
   - **Solusi:** Gunakan format MP4 (H.264 codec)

4. File terlalu besar
   - **Solusi:** Compress video: `ffmpeg -i input.mp4 -crf 23 output.mp4`

### ❌ Foto tidak muncul

**Kemungkinan penyebab:**
1. Nama file salah atau file tidak ada
2. Format tidak didukung (gunakan WebP, JPG, atau PNG)
3. Path salah

**Solusi:**
- Cek folder `assets/images/` punya semua file yang diperlukan
- Buka DevTools (F12) → Console → lihat error message

### ❌ Website lambat / lag

**Solusi optimasi:**
1. Compress video & foto (gunakan FFmpeg atau TinyPNG)
2. Ubah ke format WebP (lebih kecil dari JPG)
3. Lazy-load foto: `<img loading="lazy" ...>`

---

## 📊 File Size Reference (Estimasi)

| Tipe | Ukuran | Format |
|------|---------|--------|
| Video Hero (1080p, 10 detik) | 15-30 MB | MP4 |
| Foto Hero/Galeri | 200-500 KB | WebP |
| Foto Menu | 100-300 KB | WebP |

**Total estimasi:** ~150-200 MB untuk semua media

---

## 🎓 Tips Untuk Template Yang Dijual

1. **Sertakan file ini (SETUP_MEDIA_LOKAL.md) di template**
   - Agar pembeli tahu cara mengganti media

2. **Buat folder `assets/images/placeholder/`**
   - Berisi contoh foto/video yang sudah benar

3. **Dokumentasi di README:**
   ```markdown
   ## Mengganti Media
   
   Semua media (video & foto) harus di-download ke folder `assets/images/`
   Baca file `SETUP_MEDIA_LOKAL.md` untuk panduan lengkap.
   ```

4. **Video bersangkutan masuk ke git LFS** (jika menggunakan Git)
   ```bash
   git lfs install
   git lfs track "*.mp4"
   ```

---

## 📞 Butuh Bantuan?

- Cek Console browser (F12) untuk error message
- Gunakan File Explorer untuk verifikasi nama file
- Google "how to convert video to mp4" jika format salah

---

**Status:** ✅ SIAP UNTUK DIJUAL
**Last Updated:** 2026-05-21
