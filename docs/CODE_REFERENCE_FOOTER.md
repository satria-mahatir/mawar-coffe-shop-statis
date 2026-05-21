# 📋 COPY-PASTE CODE - Footer Dynamic Implementation

**Untuk reference - kode yang sudah di-update di file-file Anda**

---

## 📄 File 1: HTML Footer (index.html - line 773-777)

```html
<div class="footer-bottom">
    <p class="footer-copy t-footer">&copy; <span id="footerYear">2026</span> <span id="footerStoreName">Warkop Mawar</span>. <a href="#" id="footerCreatorLink" target="_blank" rel="noopener" style="color: inherit; text-decoration: none; border-bottom: 1px dotted rgba(244,239,230,0.4); transition: opacity 0.2s;">Template by <span id="footerCreatorName">Tama</span> ↗</a></p>
    <p class="footer-copy" style="color:rgba(244,239,230,0.1)"><span id="footerLocation">Bondowoso · Jawa Timur</span></p>
</div>
```

### HTML Element Breakdown:
- `#footerYear` ← Akan di-inject: `new Date().getFullYear()`
- `#footerStoreName` ← Akan di-inject: `CONFIG.storeName`
- `#footerCreatorLink` ← Akan di-inject href: `CONFIG.templateCreatorLink`
- `#footerCreatorName` ← Akan di-inject: `CONFIG.templateCreatorName`
- `#footerLocation` ← Akan di-inject: `CONFIG.locationCity + ' · ' + CONFIG.locationProvince`

---

## 💻 File 2: JavaScript Code (assets/js/main.js - dalam fungsi applyConfig())

```javascript
// Footer copyright + kredit template (dynamic injection)
const footerYear = document.getElementById('footerYear');
if (footerYear) footerYear.textContent = new Date().getFullYear();

const footerStoreName = document.getElementById('footerStoreName');
if (footerStoreName) footerStoreName.textContent = CONFIG.storeName;

const footerCreatorLink = document.getElementById('footerCreatorLink');
if (footerCreatorLink) footerCreatorLink.href = CONFIG.templateCreatorLink;

const footerCreatorName = document.getElementById('footerCreatorName');
if (footerCreatorName) footerCreatorName.textContent = CONFIG.templateCreatorName;

const footerLocation = document.getElementById('footerLocation');
if (footerLocation) footerLocation.textContent = CONFIG.locationCity + ' · ' + CONFIG.locationProvince;
```

### Penjelasan:
1. **`footerYear`** - Ambil tahun terkini otomatis, tidak perlu update manual
2. **`footerStoreName`** - Ambil dari `CONFIG.storeName`
3. **`footerCreatorLink`** - Set href (atribut link) dari `CONFIG.templateCreatorLink`
4. **`footerCreatorName`** - Ambil nama pembuat dari `CONFIG.templateCreatorName`
5. **`footerLocation`** - Gabung city dan province dari CONFIG

---

## ⚙️ File 3: CONFIG Requirements (js/config.js)

Pastikan ini ada di `js/config.js`:

```javascript
const CONFIG = {
    // ... field lainnya ...
    
    // LOKASI
    locationCity: "Bondowoso",              // Kota toko
    locationProvince: "Jawa Timur",         // Provinsi toko
    
    // KREDIT PEMBUAT TEMPLATE
    templateCreatorName: "Satria Nanda Tama",           // Nama pembuat
    templateCreatorLink: "https://karyakarsa.com/satriatama",  // Link portfolio
    
    // ... field lainnya ...
};

Object.freeze(CONFIG);
```

---

## 🎨 Styling Explanation

Link kredit menggunakan styling inline:

```css
style="
  color: inherit;                              /* Warna text sama seperti text footer */
  text-decoration: none;                       /* Tidak ada underline */
  border-bottom: 1px dotted rgba(244,239,230,0.4);  /* Subtle dotted border */
  transition: opacity 0.2s;                    /* Smooth hover transition */
"
```

**Hasil visual:**
- ✅ Tidak mencolok (subtle)
- ✅ Link masih terlihat (dotted border)
- ✅ Smooth hover effect

---

## 📊 Alur Eksekusi

```
1. Browser load → index.html
2. Parse HTML → Temukan ID (footerYear, footerStoreName, dll)
3. Load → js/config.js (CONFIG object siap)
4. Load → assets/js/main.js
5. Jalankan → applyConfig() function
6. Loop → Setiap const yang punya ID, inject valuenya
7. Result → Footer fully populated dari CONFIG ✅
```

---

## ✅ Testing

```javascript
// Buka DevTools Console (F12 → Console)
// Copy paste ini untuk test:

// Test 1: Cek footerYear
console.log(document.getElementById('footerYear').textContent);
// Output: 2026 (atau tahun terkini)

// Test 2: Cek footerStoreName
console.log(document.getElementById('footerStoreName').textContent);
// Output: Warkop Mawar (atau CONFIG.storeName)

// Test 3: Cek footerCreatorLink href
console.log(document.getElementById('footerCreatorLink').href);
// Output: https://karyakarsa.com/satriatama (atau CONFIG.templateCreatorLink)

// Test 4: Cek CONFIG object
console.log(CONFIG);
// Output: Seluruh CONFIG object
```

---

## 🔄 Jika Pembeli Ingin Custom

**Pembeli hanya perlu edit `js/config.js`:**

```javascript
// Template creator default:
templateCreatorName: "Satria Nanda Tama",
templateCreatorLink: "https://karyakarsa.com/satriatama",

// Pembeli bisa ubah jadi:
templateCreatorName: "Nama Agensi Pembeli",
templateCreatorLink: "https://portfolio-pembeli.com",
```

**Atau set kosong jika tidak mau kredit:**
```javascript
templateCreatorName: "Built with ❤️",  // Ganti message
templateCreatorLink: "#",               // Link jadi no-op
```

---

## 📝 Perbedaan Sebelum & Sesudah

| Aspek | SEBELUM | SESUDAH |
|-------|--------|--------|
| Year | Hardcoded 2026 | `new Date().getFullYear()` ✅ |
| Nama Toko | Hardcoded "Warkop Mawar" | `CONFIG.storeName` ✅ |
| Pembuat | Hardcoded "Tama" | `CONFIG.templateCreatorName` ✅ |
| Link Pembuat | Hardcoded di HTML | `CONFIG.templateCreatorLink` ✅ |
| Lokasi | Hardcoded di HTML | `CONFIG.locationCity + Province` ✅ |
| Edit | Perlu edit HTML | Cukup edit `config.js` ✅ |
| Scalable | Tidak | Ya ✅ |

---

## 🎯 Key Points

✅ **Dynamic Injection:**
- Year tidak perlu update manual setiap tahun
- Semua nilai berasal dari CONFIG

✅ **Pembeli-Friendly:**
- Edit hanya di satu file (`config.js`)
- Tidak perlu tahu tentang HTML/CSS/JS

✅ **Profesional:**
- Credit tetap ada tapi subtle
- User experience tetap baik

✅ **Maintainable:**
- Mudah untuk modifikasi nanti
- Clear structure dan documentation

---

**Status:** ✅ Production Ready  
**Perubahan File:** 2 (index.html + assets/js/main.js)  
**Dokumentasi:** FOOTER_DYNAMIC_GUIDE.md
