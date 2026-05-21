// ============================================================
//  EDIT FILE INI SAJA — tidak perlu ubah file lain
// ============================================================
//
//  📝 PANDUAN SINGKAT:
//  1. Ubah nilai di antara tanda kutip ("...") atau angka
//  2. Jangan hapus tanda koma (,) di akhir setiap baris
//  3. Jangan hapus tanda kurung kurawal { } atau [ ]
//  4. Simpan file (Ctrl+S), lalu refresh browser — selesai!
//
//  💡 TIPS:
//  • Nomor WhatsApp: gunakan format internasional tanpa "+" (misal: 628xxx)
//  • Link GrabFood/ShopeeFood: salin dari aplikasi atau browser saat buka toko Anda
//  • Koordinat peta: buka Google Maps → klik titik lokasi → salin angka lat,lng dari URL
//  • Tahun berdiri: dipakai di header, footer, dan section About
//  • metaTitle: judul yang muncul di tab browser dan hasil pencarian Google
//
// ============================================================

const CONFIG = {

    // ----------------------------------------------------------
    // 🏪 IDENTITAS TOKO
    // ----------------------------------------------------------

    /** Nama toko utama — tampil di header, loader, footer, dan tab browser */
    storeName: "Warkop Mawar",

    /** Tagline pendek — tampil di loader saat halaman memuat */
    tagline: "Every cup tells a story",

    /** Deskripsi singkat toko — tampil di section Hero (bawah judul utama) */
    shortDescription: "Nongkrong industrial-cozy di Bondowoso. Kopi mantap, suasana adem oren-abu, bikin betah dari senja sampe malam.",

    /** Tagline footer — tampil di bawah nama toko di area footer */
    footerTagline: "Seduhan jujur untuk semua. Tempat santai terbaik di Bondowoso.",

    // ----------------------------------------------------------
    // 📍 LOKASI & OPERASIONAL
    // ----------------------------------------------------------

    /** Kota/lokasi toko — tampil di header, topbar, loader, dan About */
    locationCity: "Bondowoso",

    /** Provinsi/detail lokasi — tampil di topbar dan footer */
    locationProvince: "Jawa Timur",

    /** Tahun berdiri toko — tampil di header (Est. XXXX) dan section About */
    establishedYear: 2024,

    /** Jam operasional toko */
    openingHours: {
        /** Hari buka — contoh: "Everyday", "Senin – Sabtu", "Setiap Hari" */
        days: "Everyday",

        /** Jam buka dan tutup — contoh: "09:00 – 00:00", "08:00 – 22:00" */
        hours: "09:00 – 00:00"
    },

    // ----------------------------------------------------------
    // 📞 KONTAK & PEMESANAN
    // ----------------------------------------------------------

    /**
     * Nomor WhatsApp untuk terima pesanan
     * Format: kode negara + nomor tanpa tanda "+" atau spasi
     * Contoh Indonesia: "6281234567890"
     */
    whatsappNumber: "6282244019596",

    // ----------------------------------------------------------
    // 🗺️ PETA (LEAFLET MAP)
    // ----------------------------------------------------------

    /**
     * Koordinat lokasi toko untuk peta interaktif
     * Cara cari: buka Google Maps → klik titik lokasi → lihat angka di URL
     * Contoh URL: maps.google.com/?q=-7.9184921,113.8175745
     */
    mapCoordinates: {
        lat: -7.9184921,   // Latitude  (angka sebelum koma di URL)
        lng: 113.8175745   // Longitude (angka setelah koma di URL)
    },

    /** Zoom level peta (angka lebih besar = lebih dekat). Rekomendasi: 15–18 */
    mapZoom: 17,

    // ----------------------------------------------------------
    // 🔗 LINK PLATFORM & MEDIA SOSIAL
    // ----------------------------------------------------------

    /** Link Google Maps toko — tampil di topbar dan tombol "Buka Google Maps" */
    googleMapsLink: "https://maps.app.goo.gl/DyufcHiVK3apKeKk7",

    /** Link toko di GrabFood — tampil di tombol floating dan footer */
    grabFoodLink: "https://food.grab.com/id/id/restaurant/warkop-mawar-badean-delivery/6-C3CYEXEEBA5XR6",

    /** Link toko di ShopeeFood — tampil di tombol floating dan footer */
    shopeeFoodLink: "https://shopee.co.id/universal-link/now-food/shop/22679728?deep_and_deferred=1&shareChannel=whatsapp",

    /**
     * Link Instagram toko
     * Format: "https://www.instagram.com/usernamekamu"
     * Isi dengan "" (kosong) jika tidak punya Instagram
     */
    instagramLink: "https://www.instagram.com/warkopmawar",

    /**
     * Link TikTok toko
     * Format: "https://www.tiktok.com/@usernamekamu"
     * Isi dengan "" (kosong) jika tidak punya TikTok
     */
    tiktokLink: "https://www.tiktok.com/@warkopmawar",

    // ----------------------------------------------------------
    // 📊 STATISTIK TAMPILAN (Stats Band)
    // ----------------------------------------------------------

    /**
     * Total item menu — tampil di baris statistik bawah Hero
     * Contoh: "50+", "30+", "100+"
     */
    totalMenuItems: "50+",

    /**
     * Harga mulai dari — tampil di baris statistik bawah Hero
     * Contoh: "Rp5.000", "Rp8.000"
     */
    priceStartingFrom: "Rp5.000",

    // ----------------------------------------------------------
    // 🔍 SEO — Tampilan di Google & Tab Browser
    // ----------------------------------------------------------

    /**
     * Judul halaman — tampil di tab browser dan hasil pencarian Google
     * Rekomendasi panjang: maksimal 60 karakter
     */
    metaTitle: "Warkop Mawar - Tempat Nongkrong & Ngopi Asik di Bondowoso",

    /**
     * Deskripsi singkat untuk Google — tampil di bawah judul di hasil pencarian
     * Rekomendasi panjang: 120–160 karakter
     */
    metaDescription: "Kunjungi Warkop Mawar! Nikmati berbagai pilihan kopi, minuman, dan makanan lezat dengan harga bersahabat. Tempat nongkrong paling asik di Bondowoso.",

    /**
     * Kata kunci SEO — pisahkan dengan tanda koma
     * Contoh: "nama toko, nama kota, jenis usaha, produk unggulan"
     */
    metaKeywords: "warkop mawar, warkop bondowoso, tempat ngopi asik, kopi murah, nongkrong, cafe bondowoso",

    // ----------------------------------------------------------
    // 👤 KREDIT PEMILIK TOKO
    // ----------------------------------------------------------

    /**
     * Nama pemilik atau brand toko
     * Tampil di footer: "© TAHUN NamaToko. Dibuat oleh NamaPemilik."
     */
    ownerName: "Tama",

    // ----------------------------------------------------------
    // 🛠️ KREDIT PEMBUAT TEMPLATE (JANGAN DIHAPUS)
    // ----------------------------------------------------------

    /**
     * Nama pembuat/developer template ini
     * Tampil sebagai kredit kecil di footer
     */
    templateCreatorName: "Satria Nanda Tama",

    /**
     * Link portofolio atau KaryaKarsa pembuat template
     * Tampil sebagai tautan dari nama kredit di footer
     */
    templateCreatorLink: "https://karyakarsa.com/satriatama",

};

// Beku objek CONFIG agar tidak bisa diubah dari luar secara tidak sengaja
Object.freeze(CONFIG);
