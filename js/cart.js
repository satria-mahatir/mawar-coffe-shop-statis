// ============================================================
//  🛒 CART.JS — Modul Keranjang Belanja & Pemesanan WhatsApp
// ============================================================
//
//  Tanggung Jawab:
//  1. Mengelola state keranjang belanja (tambah, edit quantity, hapus)
//  2. Sinkronisasi UI keranjang dengan data terbaru
//  3. Mengatur toggle harga panas (Hot) vs dingin (Ice) pada menu card
//  4. Mengarahkan pesanan ke WhatsApp dengan format pesan yang rapi
//  5. Mengarahkan pesanan ke platform GrabFood & ShopeeFood
//
// ============================================================

(function (global) {
    'use strict';

    // State keranjang
    let cart = [];
    let cartOpen = false;
    let toastTimer = null;

    // Ambil WA_NUMBER dari window atau fallback
    const getWaNumber = () => {
        return global.WA_NUMBER || (typeof CONFIG !== 'undefined' && CONFIG.whatsappNumber) || '6282244019596';
    };

    // ── TOGGLE DRAWER KERANJANG ──
    function toggleCart() {
        cartOpen = !cartOpen;
        const drawer = document.getElementById('cartDrawer');
        const overlay = document.getElementById('cartOverlay');
        
        if (drawer) drawer.classList.toggle('open', cartOpen);
        if (overlay) overlay.classList.toggle('open', cartOpen);
        document.body.style.overflow = cartOpen ? 'hidden' : '';
    }

    // ── TAMBAH ITEM KE KERANJANG ──
    function addToCart(name, price, img) {
        // Cari apakah item dengan nama yang sama sudah ada di keranjang
        const existing = cart.find(item => item.name === name);
        if (existing) {
            existing.qty++;
        } else {
            cart.push({ name, price, qty: 1, img });
        }
        
        renderCart();
        showToast(name);
        animateFab();
        
        // Scroll otomatis ke tombol Fab keranjang jika sedang tertutup agar pembeli sadar
        if (!cartOpen) {
            const cartFab = document.getElementById('cartFab');
            if (cartFab) {
                cartFab.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
        }
    }

    // ── UPDATE QUANTITY ITEM ──
    function updateQty(name, delta) {
        const idx = cart.findIndex(item => item.name === name);
        if (idx === -1) return;
        
        cart[idx].qty += delta;
        if (cart[idx].qty <= 0) {
            cart.splice(idx, 1);
        }
        
        renderCart();
    }

    // ── HAPUS ITEM DARI KERANJANG ──
    function removeCartItem(name) {
        cart = cart.filter(item => item.name !== name);
        renderCart();
    }

    // ── FORMAT RUPIAH HELPER ──
    function formatRp(n) {
        return 'Rp ' + n.toLocaleString('id-ID');
    }

    // ── VISUAL: TOAST NOTIFICATION ──
    function showToast(name) {
        const toast = document.getElementById('cartToast');
        const toastName = document.getElementById('cartToastName');
        
        if (toast && toastName) {
            toastName.textContent = name;
            toast.classList.add('show');
            clearTimeout(toastTimer);
            toastTimer = setTimeout(() => {
                toast.classList.remove('show');
            }, 2500);
        }
    }

    // ── VISUAL: FAB BADGE POP ANIMATION ──
    function animateFab() {
        const badge = document.getElementById('cartBadge');
        if (badge) {
            badge.classList.remove('pop');
            void badge.offsetWidth; // Trigger reflow untuk restart CSS animation
            badge.classList.add('pop');
        }
    }

    // ── RENDER ELEMEN KERANJANG KE HTML ──
    function renderCart() {
        const totalItems = cart.reduce((sum, item) => sum + item.qty, 0);
        const totalPrice = cart.reduce((sum, item) => sum + (item.price * item.qty), 0);

        const badge = document.getElementById('cartBadge');
        const cartEmpty = document.getElementById('cartEmpty');
        const cartItemsList = document.getElementById('cartItemsList');
        const cartFooter = document.getElementById('cartFooter');
        const cartTotalNum = document.getElementById('cartTotalNum');
        const cartItemCountLabel = document.getElementById('cartItemCountLabel');
        const btnOrderWa = document.getElementById('btnOrderWa');

        if (badge) {
            badge.textContent = totalItems;
            badge.classList.toggle('show', totalItems > 0);
        }

        const isEmpty = cart.length === 0;
        if (cartEmpty) cartEmpty.style.display = isEmpty ? 'flex' : 'none';
        if (cartItemsList) cartItemsList.style.display = isEmpty ? 'none' : 'block';
        if (cartFooter) cartFooter.style.display = isEmpty ? 'none' : 'block';

        if (!isEmpty && cartItemsList) {
            cartItemsList.innerHTML = cart.map((item, idx) => `
                <div class="cart-item-row" data-index="${idx}">
                    <img loading="lazy" class="cart-item-img" src="${item.img}" alt="${item.name}" onerror="this.style.background='rgba(232,98,42,0.1)';this.src='assets/images/placeholder.svg'">
                    <div class="cart-item-info">
                        <div class="cart-item-name">${item.name}</div>
                        <div class="cart-item-price">${formatRp(item.price)}</div>
                        <div class="cart-item-subtotal">Subtotal: ${formatRp(item.price * item.qty)}</div>
                    </div>
                    <div class="cart-qty-wrap">
                        <div class="qty-controls">
                            <button class="qty-btn minus" data-action="dec">−</button>
                            <span class="qty-num">${item.qty}</span>
                            <button class="qty-btn" data-action="inc">+</button>
                        </div>
                        <button class="cart-delete-btn" data-action="del" title="Hapus">
                            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"><polyline points="3 6 5 6 21 6"/><path d="M19 6l-1 14a2 2 0 0 1-2 2H8a2 2 0 0 1-2-2L5 6"/><path d="M10 11v6M14 11v6"/><path d="M9 6V4a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2"/></svg>
                        </button>
                    </div>
                </div>
            `).join('');

            if (cartTotalNum) cartTotalNum.textContent = totalPrice.toLocaleString('id-ID');
            if (cartItemCountLabel) cartItemCountLabel.textContent = `${totalItems} item · ${cart.length} jenis`;
            if (btnOrderWa) btnOrderWa.disabled = (totalItems === 0);
        }
    }

    // ── EVENT LISTENER: INIT BUTTON BELI ──
    function initCartButtons() {
        document.querySelectorAll('.add-btn').forEach(btn => {
            if (btn.dataset.cartInit) return;
            btn.dataset.cartInit = '1';
            btn.addEventListener('click', function (e) {
                e.stopPropagation();
                const card = this.closest('.menu-card');
                if (!card) return;
                
                const name = card.querySelector('.menu-card-name')?.textContent?.trim() || 'Menu';
                const priceText = card.querySelector('.menu-card-price')?.textContent || '0';
                const price = parseInt(priceText.replace(/[^0-9]/g, '')) || 0;
                
                // Dapatkan gambar menu
                const imgEl = card.querySelector('.menu-img');
                const img = imgEl ? imgEl.src : '';
                
                addToCart(name, price, img);
            });
        });
    }

    // ── EVENT LISTENER: HOT / ICE TOGGLE LOGIC ──
    function initTempToggle() {
        document.querySelectorAll('.temp-toggle').forEach(toggle => {
            if (toggle.dataset.toggleInit) return;
            toggle.dataset.toggleInit = '1';
            
            const card = toggle.closest('.menu-card');
            const priceEl = card ? card.querySelector('.menu-card-price') : null;
            const hargaHot = parseInt(card?.dataset?.hargaHot || 0);
            const hargaIce = parseInt(card?.dataset?.hargaIce || 0);
            const hasIce = card?.dataset?.hasIce === '1';

            // Aktifkan pilihan jika didukung harga dingin
            if (hasIce && hargaIce > 0) {
                toggle.querySelectorAll('.temp-btn').forEach(btn => {
                    btn.addEventListener('click', function (e) {
                        e.stopPropagation();
                        toggle.querySelectorAll('.temp-btn').forEach(b => b.classList.remove('active'));
                        this.classList.add('active');
                        
                        if (priceEl) {
                            const isIce = this.dataset.temp === 'ice';
                            const price = isIce ? hargaIce : hargaHot;
                            priceEl.textContent = 'Rp ' + price.toLocaleString('id-ID');
                        }
                    });
                });
            } else {
                // Sembunyikan toggle jika tidak ada opsi ice
                toggle.style.display = 'none';
            }
        });
    }

    // ── SETUP ELEMENT HANDLERS ──
    document.addEventListener('DOMContentLoaded', () => {
        const cartFab = document.getElementById('cartFab');
        const cartCloseBtn = document.getElementById('cartCloseBtn');
        const cartOverlay = document.getElementById('cartOverlay');
        const cartItemsList = document.getElementById('cartItemsList');
        const btnOrderWa = document.getElementById('btnOrderWa');
        const btnGrab = document.getElementById('btnGrab');
        const btnShopee = document.getElementById('btnShopee');

        if (cartFab) cartFab.addEventListener('click', toggleCart);
        if (cartCloseBtn) cartCloseBtn.addEventListener('click', toggleCart);
        if (cartOverlay) cartOverlay.addEventListener('click', toggleCart);

        // Escape Key untuk tutup keranjang
        document.addEventListener('keydown', e => {
            if (e.key === 'Escape' && cartOpen) toggleCart();
        });

        // Delegate click event keranjang untuk kuantiti & hapus
        if (cartItemsList) {
            cartItemsList.addEventListener('click', function (e) {
                const btn = e.target.closest('button');
                if (!btn || !btn.dataset.action) return;
                
                const row = btn.closest('.cart-item-row');
                if (!row) return;
                
                const idx = parseInt(row.dataset.index, 10);
                if (isNaN(idx) || idx < 0 || idx >= cart.length) return;
                
                const itemName = cart[idx].name;
                switch (btn.dataset.action) {
                    case 'inc': updateQty(itemName, 1); break;
                    case 'dec': updateQty(itemName, -1); break;
                    case 'del': removeCartItem(itemName); break;
                }
            });
        }

        // Checkout pemesanan WhatsApp
        if (btnOrderWa) {
            btnOrderWa.addEventListener('click', function () {
                if (cart.length === 0) return;
                
                const nama = document.getElementById('reservasiNama')?.value.trim();
                const waktu = document.getElementById('reservasiWaktu')?.value;
                
                if (!nama || !waktu) {
                    alert('Silakan isi Nama dan Waktu Kedatangan terlebih dahulu!');
                    return;
                }

                const note = document.getElementById('cartNote')?.value.trim();
                const itemLines = cart.map(i => `• ${i.name} x${i.qty}`).join('\n');
                const daftarMenu = cart.map(i => `${i.name} (x${i.qty})`).join(', ');
                const waktuFormat = waktu.replace('T', ' ');

                const msg = [
                    '🌹 *Halo Warkop Mawar!*', '',
                    `Saya *${nama}*, mau reservasi tempat untuk tanggal *${waktuFormat}*.`, '',
                    'Pesanan saya:', itemLines, note ? `\nCatatan: ${note}` : '',
                    '', '_(Reservasi via Website Warkop Mawar)_'
                ].join('\n');

                const waNumber = getWaNumber();
                global.open(`https://wa.me/${waNumber}?text=${encodeURIComponent(msg)}`, '_blank');

                // Fire-and-forget: Catat ke database lokal php jika ada backend PHP terpasang
                const csrfToken = global.CSRF_TOKEN || 'static-site';
                global.fetch('proses_reservasi.php', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                    body: new URLSearchParams({
                        nama_pelanggan: nama,
                        waktu_reservasi: waktu,
                        detail_pesanan: daftarMenu + (note ? ' - Catatan: ' + note : ''),
                        total_harga: cart.reduce((sum, item) => sum + (item.price * item.qty), 0),
                        csrf_token: csrfToken
                    })
                }).catch(err => console.log('Info: Integrasi backend reservasi diabaikan (mode statis murni).'));

                // Reset keranjang setelah kirim WA
                cart = [];
                renderCart();
                
                const resNama = document.getElementById('reservasiNama');
                const resWaktu = document.getElementById('reservasiWaktu');
                const cartNt = document.getElementById('cartNote');
                
                if (resNama) resNama.value = '';
                if (resWaktu) resWaktu.value = '';
                if (cartNt) cartNt.value = '';
                
                toggleCart();
            });
        }

        // GrabFood checkout
        if (btnGrab) {
            btnGrab.addEventListener('click', () => {
                const grabUrl = (typeof CONFIG !== 'undefined' && CONFIG.grabFoodLink) 
                    ? CONFIG.grabFoodLink 
                    : 'https://food.grab.com/id/id/restaurant/warkop-mawar-badean-delivery/6-C3CYEXEEBA5XR6';
                global.location.href = grabUrl;
            });
        }

        // ShopeeFood checkout
        if (btnShopee) {
            btnShopee.addEventListener('click', () => {
                const shopeeUrl = (typeof CONFIG !== 'undefined' && CONFIG.shopeeFoodLink) 
                    ? CONFIG.shopeeFoodLink 
                    : 'https://shopee.co.id/universal-link/now-food/shop/22679728?deep_and_deferred=1&shareChannel=whatsapp';
                global.open(shopeeUrl, '_blank');
            });
        }

        // Inisialisasi awal
        initCartButtons();
        initTempToggle();
    });

    // Expose APIs secara eksplisit ke window global
    global.cart = cart;
    global.toggleCart = toggleCart;
    global.addToCart = addToCart;
    global.updateQty = updateQty;
    global.removeCartItem = removeCartItem;
    global.formatRp = formatRp;
    global.initCartButtons = initCartButtons;
    global.initTempToggle = initTempToggle;

})(window);
