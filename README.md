# ☕ Mawar Coffee Shop - Premium Static HTML/CSS/JS Website Template

Selamat datang di **Mawar Coffee Shop Template**! Ini adalah template website *single-page* statis premium yang dirancang khusus untuk bisnis kafe, restoran, atau warkop. Template ini dibuat dengan mengutamakan **kemudahan kustomisasi (zero-code configuration)**, performa tinggi, responsivitas luar biasa, serta estetika modern yang premium.

---

## 🌟 Mengapa Template Ini Sangat Premium?

*   **Pristine & Clean Structure:** Struktur file sangat rapi dan bersih. Tidak ada file sampah di folder utama. Pembeli Anda akan langsung memahami struktur project dalam 5 detik pertama.
*   **Zero-Code Configuration (`js/config.js`):** Pembeli tidak perlu menyentuh kode HTML/CSS yang rumit. Cukup edit satu file konfigurasi terpusat untuk mengubah nama toko, kontak, jam operasional, link media sosial, hingga link GrabFood/ShopeeFood!
*   **Modular Script Architecture:** Logika JavaScript dipisahkan berdasarkan fungsinya:
    *   `js/config.js` - Seluruh data konfigurasi toko.
    *   `js/cart.js` - Manajemen keranjang belanja, kalkulasi otomatis, integrasi pemesanan WhatsApp, dan toggle harga Hot/Ice.
    *   `js/app.js` - UI/UX interactivity (custom premium cursor, Leaflet map, gallery lightbox, Google Translate cleaner, screen-saver, dll).
*   **Organized Premium Assets:** Semua gambar dan video diklasifikasikan secara rapi ke dalam subfolder spesifik (`hero`, `about`, `gallery`, `menu`, `icons`, `favicons`).
*   **Premium Fallback System:** Dilengkapi dengan fallback SVG premium (`assets/images/placeholder.svg`) yang elegan jika gambar produk menu gagal dimuat.
*   **100% Offline-Ready & Native WebM:** Menggunakan video WebM lokal berkinerja tinggi untuk hero banner, menggantikan format MP4 lama demi pemuatan yang jauh lebih cepat dan lancar.

---

## 📁 Struktur Folder Project

Berikut adalah peta struktur folder yang sangat rapi dan mudah dipahami:

```text
mawar-statis/
├── index.html                    # Halaman utama website (Struktur HTML5 & SEO)
├── README.md                     # Panduan dokumentasi utama ini (Bahasa Indonesia)
│
├── js/                           # 🧠 Folder Modular JavaScript
│   ├── config.js                 # 📝 Cukup edit file ini untuk kustomisasi toko!
│   ├── cart.js                   # 🛒 Sistem keranjang & Checkout WhatsApp (Don't touch)
│   └── app.js                    # 🎨 Interaktivitas UI/UX & Efek visual (Don't touch)
│
├── assets/                       # 🎨 Folder Aset Pendukung
│   ├── css/
│   │   └── style.css            # Desain gaya visual, animasi, & layout responsive
│   ├── fonts/                    # Font lokal untuk kecepatan rendering
│   └── images/                   # 📸 Klasifikasi Aset Gambar & Video
│       ├── hero/                 # Video & Gambar background Hero Header (WebM format)
│       ├── about/                # Gambar untuk bagian profil & sejarah kafe
│       ├── gallery/              # Gambar suasana kafe (expandable via Lightbox)
│       ├── menu/                 # Gambar makanan & minuman
│       ├── icons/                # Ikon pendukung UI
│       ├── favicons/             # Kumpulan favicon untuk browser & perangkat mobile
│       └── placeholder.svg       # Elegan SVG fallback untuk menu tanpa foto
│
└── docs/                         # 📚 Folder Dokumentasi & Script Developer
    ├── download-media.ps1        # Script otomatis download media (Windows)
    ├── download-media.sh         # Script otomatis download media (Mac/Linux)
    └── ...                       # Panduan upload & referensi pengembangan lainnya
```

---

## 🚀 Panduan Memulai untuk Pembeli

Hanya butuh **3 langkah mudah** untuk meluncurkan website Anda sendiri:

### 1️⃣ Download Media (Lokal Setup)
Untuk menjaga ukuran template tetap ringan, aset media (video & foto asli) dapat didownload secara otomatis:
*   **Windows (PowerShell):** Buka folder `docs/`, klik kanan `download-media.ps1` dan pilih *Run with PowerShell*, atau jalankan di terminal:
    ```powershell
    powershell -ExecutionPolicy Bypass -File docs/download-media.ps1
    ```
*   **Mac/Linux (Bash):** Jalankan di terminal:
    ```bash
    bash docs/download-media.sh
    ```
*   *Catatan: Semua aset otomatis masuk ke subfolder yang tepat di `assets/images/`.*

### 2️⃣ Kustomisasi Toko (Tanpa Koding!)
Buka file `js/config.js` menggunakan text editor (seperti VS Code atau Notepad), lalu sesuaikan nilainya:
```javascript
const CONFIG = {
    // 🏪 Identitas Utama Toko
    storeName: "Warkop Mawar",
    tagline: "Every cup tells a story",
    
    // 📍 Kontak & Alamat
    whatsappNumber: "6282244019596", // Gunakan format 62xxx (tanpa + atau spasi)
    googleMapsLink: "https://maps.app.goo.gl/...",
    
    // 🛒 Tombol Platform Ojek Online
    grabFoodLink: "https://food.grab.com/...",
    shopeeFoodLink: "https://shopee.co.id/...",
    
    // 🕐 Jam Operasional
    openingHours: {
        days: "Setiap Hari",
        hours: "09:00 – 00:00"
    }
};
```
*Simpan file, dan seluruh data di website Anda otomatis terupdate secara instan!*

### 3️⃣ Buka & Jalankan
Double-click file `index.html` untuk membukanya secara langsung di browser Anda, atau gunakan extension **Live Server** di VS Code untuk pengalaman pengembangan real-time terbaik.

---

## 💎 Fitur Premium yang Disertakan

1.  **WhatsApp Checkout System:** Pelanggan bisa memilih menu, menambahkannya ke keranjang belanja, memilih variasi **Hot / Ice** (harga otomatis menyesuaikan!), dan menekan checkout. Website akan otomatis memformat pesan WhatsApp berisi detail pesanan, total harga, dan nomor meja untuk langsung dikirim ke nomor WhatsApp pemilik toko.
2.  **Custom Interactive Map (Leaflet JS):** Menggunakan Leaflet JS gratis berkualitas tinggi tanpa perlu membayar biaya API Google Maps. Peta interaktif akan langsung menandai titik koordinat kedai Anda dengan pin yang cantik.
3.  **Google Translate Cleaner:** Menyertakan fitur terjemahan otomatis yang bersih. Seluruh banner pop-up Google Translate yang mengganggu di bagian atas layar telah disembunyikan secara otomatis demi keindahan estetika website.
4.  **Ambient Screensaver / Sleep Mode:** Jika pengguna tidak melakukan aktivitas di website selama beberapa menit, screensaver sinematik yang tenang akan muncul secara otomatis, membuat tampilan layar kafe Anda terlihat sangat estetik saat dipajang di tablet kasir.
5.  **Aesthetic Micro-Animations & Custom Cursor:** Efek transisi halus saat halaman dimuat, hover effect yang responsif, scroll animation, dan kursor kustom yang modern yang langsung memikat perhatian pengunjung.

---

## 🛠️ Panduan Kustomisasi Lanjutan (Developer)

*   **Mengganti Video Hero:** Masukkan video baru berformat `.webm` ke dalam folder `assets/images/hero/` dengan nama `hero-video-1.webm` sampai `hero-video-6.webm`.
*   **Mengubah Gaya Warna:** Buka `assets/css/style.css` dan edit variabel warna CSS di root element (`:root`) untuk mengganti warna tema (misalnya mengubah warna mawar cokelat menjadi hijau matcha atau merah menyala).
*   **Menambah/Mengurangi Menu:** Anda dapat mengedit daftar produk langsung di dalam elemen HTML `index.html` pada bagian `<section id="menu">`. Pastikan atribut `onclick="addToCart(...)"` sesuai dengan nama produk dan harga dasarnya.

---

## 📋 Checklist Kesiapan Peluncuran Kedai Toko (Untuk Pembeli)

Setelah Anda selesai melakukan kustomisasi, ikuti checklist di bawah ini untuk memastikan toko digital Anda siap meluncur secara sempurna di browser pelanggan:

- [ ] **Aset Media Lengkap:** Seluruh file video `.webm` dan foto pendukung telah terunduh dengan lengkap di bawah subfolder `assets/images/` (gunakan script otomatis di folder `docs/`).
- [ ] **Data Konfigurasi Toko:** File `js/config.js` telah diubah dengan nama kedai, alamat asli, serta deskripsi unik bisnis Anda sendiri.
- [ ] **Nomor WhatsApp Checkout:** Nomor WhatsApp di `js/config.js` sudah aktif, menggunakan format internasional (misal: `6282244019596` tanpa spasi atau tanda `+`), dan sukses menerima detail pesanan saat tombol *Checkout* ditekan.
- [ ] **Peta Lokasi Kedai:** Koordinat lintang (`lat`) dan bujur (`lng`) serta tautan tombol Google Maps di `js/config.js` telah disesuaikan dengan posisi kedai fisik Anda.
- [ ] **Tombol Kuliner Online:** Tautan tautan toko GrabFood / ShopeeFood Anda di konfigurasi telah terisi secara benar dan tombol melayangnya berfungsi dengan baik (jika Anda terdaftar).
- [ ] **Tampilan & Responsivitas:** Website dimuat dengan lancar, bebas dari error di konsol browser (F12), dan tampilannya presisi secara estetik di layar handphone, tablet, maupun komputer.

---
*Dibuat dengan 🤎 untuk membantu pengusaha kopi go-digital secara elegan.*
