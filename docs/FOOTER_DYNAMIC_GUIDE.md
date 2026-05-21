# 📝 Footer Dynamic - Dokumentasi Perubahan

**Status:** ✅ Selesai  
**Tanggal:** 21 Mei 2026  
**Update:** Copyright year, nama toko, dan kredit pembuat template sekarang otomatis dari CONFIG

---

## 📋 Yang Berubah

### ✅ SEBELUM (Hardcoded)
```html
<p class="footer-copy t-footer">&copy; 2026 <span>Warkop Mawar</span>. Dibuat oleh Tama.</p>
<p class="footer-copy" style="color:rgba(244,239,230,0.1)">Bondowoso · Jawa Timur</p>
```

**Masalah:**
- ❌ Year hardcoded "2026" - harus diupdate manual setiap tahun
- ❌ Nama toko hardcoded "Warkop Mawar"
- ❌ Nama pembuat hardcoded "Tama"
- ❌ Kredensial pembeli tertanam di HTML

---

### ✅ SESUDAH (Dynamic dari CONFIG)
```html
<p class="footer-copy t-footer">&copy; <span id="footerYear">2026</span> <span id="footerStoreName">Warkop Mawar</span>. <a href="#" id="footerCreatorLink" target="_blank" rel="noopener" style="color: inherit; text-decoration: none; border-bottom: 1px dotted rgba(244,239,230,0.4); transition: opacity 0.2s;">Template by <span id="footerCreatorName">Tama</span> ↗</a></p>
<p class="footer-copy" style="color:rgba(244,239,230,0.1)"><span id="footerLocation">Bondowoso · Jawa Timur</span></p>
```

**Keuntungan:**
- ✅ Year otomatis dari `new Date().getFullYear()`
- ✅ Nama toko dari `CONFIG.storeName`
- ✅ Nama pembuat dari `CONFIG.templateCreatorName`
- ✅ Link pembuat dari `CONFIG.templateCreatorLink`
- ✅ Lokasi dari `CONFIG.locationCity` + `CONFIG.locationProvince`
- ✅ Tampilan kredit subtle dengan styling yang tidak mengganggu

---

## 🔧 JavaScript Code Update

File: **`assets/js/main.js`**

**Fungsi:** `applyConfig()` → Footer section (line ~80)

```javascript
// ✅ KODE BARU (lebih clean & structured)
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

---

## 📊 Struktur Element & Binding

| HTML ID | Nilai dari CONFIG | Tujuan |
|---------|------------------|--------|
| `#footerYear` | `new Date().getFullYear()` | Copyright year otomatis |
| `#footerStoreName` | `CONFIG.storeName` | Nama toko di copyright |
| `#footerCreatorLink` | `CONFIG.templateCreatorLink` | URL link ke portfolio creator |
| `#footerCreatorName` | `CONFIG.templateCreatorName` | Nama pembuat template |
| `#footerLocation` | `CONFIG.locationCity + ' · ' + CONFIG.locationProvince` | Lokasi toko |

---

## 🎨 CSS Styling Kredit (Subtle)

```css
/* Style untuk link credit di footer */
style="
  color: inherit;                    /* Sama dengan warna text footer */
  text-decoration: none;             /* Tidak ada underline full */
  border-bottom: 1px dotted rgba(244,239,230,0.4);  /* Dotted border subtle */
  transition: opacity 0.2s;          /* Smooth hover effect */
"

/* Hover effect (otomatis) - silakan tambah di CSS jika mau */
a:hover {
  opacity: 0.8;  /* Sedikit fade saat hover */
}
```

---

## 🔄 Alur Kerja

```
1. Browser load index.html
   ↓
2. Load js/config.js (CONFIG object created)
   ↓
3. Load assets/js/main.js
   ↓
4. Jalankan applyConfig() function
   ↓
5. Inject nilai ke element dengan ID yang sesuai:
   - footerYear ← new Date().getFullYear()
   - footerStoreName ← CONFIG.storeName
   - footerCreatorLink ← CONFIG.templateCreatorLink
   - footerCreatorName ← CONFIG.templateCreatorName
   - footerLocation ← CONFIG.locationCity + CONFIG.locationProvince
   ↓
6. Footer updated dengan nilai dynamic ✅
```

---

## ✅ CONFIG Fields yang Diperlukan

Pastikan file `js/config.js` memiliki field berikut:

```javascript
const CONFIG = {
    storeName: "Warkop Mawar",                    // ← Nama toko
    locationCity: "Bondowoso",                   // ← Kota
    locationProvince: "Jawa Timur",              // ← Provinsi
    templateCreatorName: "Satria Nanda Tama",    // ← Nama pembuat template
    templateCreatorLink: "https://karyakarsa.com/satriatama",  // ← Link portfolio
    // ... field lainnya
};
```

---

## 🧪 Test Checklist

- [ ] Buka `index.html` di browser
- [ ] Cek footer - year sudah otomatis (harusnya tahun 2026 atau sesuai tahun berjalan)
- [ ] Cek nama toko muncul dengan benar di footer
- [ ] Hover link "Template by [nama] ↗" - seharusnya berubah opacity
- [ ] Klik link kredit - seharusnya buka halaman `templateCreatorLink`
- [ ] Edit `CONFIG.storeName` di `js/config.js` - refresh dan cek footer berubah
- [ ] Edit `CONFIG.templateCreatorName` - refresh dan cek berubah
- [ ] Inspect Element (F12) - pastikan HTML hanya punya placeholder value

---

## 📄 Contoh Output

**Browser menampilkan:**
```
© 2026 Warkop Mawar. Template by Satria Nanda Tama ↗
Bondowoso · Jawa Timur
```

**Jika CONFIG dirubah ke:**
```javascript
storeName: "Cafe Baru",
locationCity: "Jakarta",
locationProvince: "DKI Jakarta",
templateCreatorName: "Si Pembuat",
templateCreatorLink: "https://example.com/portfolio"
```

**Maka tampilan berubah menjadi:**
```
© 2026 Cafe Baru. Template by Si Pembuat ↗
Jakarta · DKI Jakarta
```

---

## 🎁 Untuk Pembeli Template

**Instruksi untuk pembeli:**

1. **Edit nama toko:**
   ```javascript
   // di js/config.js
   storeName: "Nama Toko Anda",  // ← Ubah ini
   ```

2. **Edit lokasi:**
   ```javascript
   locationCity: "Kota Anda",
   locationProvince: "Provinsi Anda",
   ```

3. **Edit credit pembuat template (OPSIONAL - boleh dibiarkan):**
   ```javascript
   // Jika ingin custom template creator:
   templateCreatorName: "Nama Anda / Agensi Anda",
   templateCreatorLink: "https://portfolio-anda.com",
   ```

4. **Simpan file & refresh browser** - selesai! ✅

---

## 🔒 Security & Best Practice

✅ **Dynamic Injection yang Aman:**
- Menggunakan `.textContent` (bukan `.innerHTML`) untuk plain text
- `.href` untuk link (tidak ada risk XSS)
- CONFIG object di-freeze dengan `Object.freeze(CONFIG)`

✅ **Accessibility:**
- Link memiliki `target="_blank"` dan `rel="noopener"` untuk security
- Semantic HTML dengan `<a>` tag yang proper
- Aria-label jika diperlukan

✅ **Performance:**
- Tidak ada additional script load
- Binding terjadi sekali saat page load
- Zero runtime overhead

---

## 🐛 Troubleshooting

### ❌ Footer tidak berubah setelah edit CONFIG
**Solusi:**
1. Refresh browser dengan `Ctrl+F5` (hard refresh)
2. Clear cache browser (DevTools → Storage → Clear)
3. Pastikan `CONFIG` object sudah di-load sebelum `main.js`

### ❌ Link kredit template tidak berfungsi
**Solusi:**
1. Cek `templateCreatorLink` di `config.js` - harus URL yang valid
2. Pastikan link dimulai dengan `https://` atau `http://`
3. Test di browser baru (incognito mode)

### ❌ Year tidak update otomatis tiap tahun
**Kemungkinan:**
- Tidak mungkin terjadi - kode `new Date().getFullYear()` selalu mendapat tahun terkini
- Jika masih menampilkan 2026, cek pengaturan jam sistem komputer/server

---

## 📚 Related Files

- **HTML:** [index.html](index.html#L774) - Footer section
- **JavaScript:** [assets/js/main.js](assets/js/main.js#L80) - applyConfig() function
- **CONFIG:** [js/config.js](js/config.js#L154) - Template creator config

---

## ✨ Fitur Bonus

### Hover Effect (Optional)

Jika ingin menambah hover effect pada link kredit, tambahkan ke `assets/css/style.css`:

```css
/* Footer creator link hover effect */
a#footerCreatorLink {
    cursor: pointer;
}

a#footerCreatorLink:hover {
    opacity: 0.7;
    border-bottom-color: rgba(244,239,230,0.7);
}
```

---

## 📌 Summary

**Sebelum:**
- Hardcoded values
- Harus edit HTML untuk ganti tahun/nama
- Tidak scalable

**Sesudah:**
- ✅ Dynamic dari CONFIG
- ✅ Edit hanya di `config.js`
- ✅ Auto-update setiap tahun (year)
- ✅ Scalable & maintainable
- ✅ Siap dijual ke pembeli

---

**Status:** ✅ READY FOR PRODUCTION  
**Last Updated:** 2026-05-21  
**Version:** 1.0.0
