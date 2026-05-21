// ============================================================
//  ✨ APP.JS — UI Animations, Interactions & Template Engine
// ============================================================
//
//  Tanggung Jawab:
//  1. Membaca & menyuntikkan data `CONFIG` ke DOM secara dinamis (applyConfig)
//  2. Mengatur kursor premium kustom (Custom Cursor Follower)
//  3. Menangani Galeri Lightbox (Klik gambar -> zoom popup)
//  4. Fitur hemat daya / layar siaga otomatis (Eco Screensaver)
//  5. Mengatur perpindahan video hero secara otomatis (Video Carousel Hero)
//  6. Mengaktifkan mobile navigation (Hamburger Menu)
//  7. Peta interaktif OpenStreetMap menggunakan Leaflet JS
//  8. Animasi scroll halus (Scroll Reveal Observer)
//  9. Fitur Mode Gelap (Dark Mode) & Pengatur Bahasa (Google Translate Cookie)
//
// ============================================================

(function (global) {
    'use strict';

    // ── 1. APPLY CONFIGURATION FROM CONFIG.JS ──
    function applyConfig() {
        if (typeof CONFIG === 'undefined') return;

        // -- SEO: Judul Tab & Meta Tags --
        if (CONFIG.metaTitle) document.title = CONFIG.metaTitle;
        
        const metaDesc = document.querySelector('meta[name="description"]');
        if (metaDesc && CONFIG.metaDescription) {
            metaDesc.setAttribute('content', CONFIG.metaDescription);
        }
        
        const metaKw = document.querySelector('meta[name="keywords"]');
        if (metaKw && CONFIG.metaKeywords) {
            metaKw.setAttribute('content', CONFIG.metaKeywords);
        }
        
        const metaAuthor = document.querySelector('meta[name="author"]');
        if (metaAuthor) {
            metaAuthor.setAttribute('content', CONFIG.templateCreatorName || '');
        }

        // -- Loader Halaman --
        const brandTitle = document.querySelector('.brand-title');
        if (brandTitle) brandTitle.textContent = CONFIG.storeName;

        const brandSub = document.querySelector('.brand-sub');
        if (brandSub) brandSub.textContent = 'Est. — ' + CONFIG.locationCity;

        const loaderTagline = document.querySelector('.tagline');
        if (loaderTagline) loaderTagline.textContent = '"' + CONFIG.tagline + '"';

        // -- Eco Screensaver Brand --
        document.querySelectorAll('.t-eco-brand').forEach(el => {
            el.textContent = CONFIG.storeName;
        });

        // -- Topbar Lokasi --
        const topbarLink = document.querySelector('.t-topbar');
        if (topbarLink) {
            topbarLink.href = CONFIG.googleMapsLink;
            topbarLink.innerHTML = `<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/><circle cx="12" cy="10" r="3"/></svg> ${CONFIG.locationCity}, ${CONFIG.locationProvince} — Buka di Maps`;
        }

        // -- Header & Footer Brand --
        document.querySelectorAll('.t-logo, .t-logo-footer').forEach(el => {
            el.textContent = CONFIG.storeName;
        });

        const logoTag = document.querySelector('.logo-tag');
        if (logoTag) {
            logoTag.textContent = `${CONFIG.locationCity} · Est. ${CONFIG.establishedYear}`;
        }

        // -- Hero Section --
        document.querySelectorAll('.t-hero-eyebrow, .teks-judul-beranda').forEach(el => {
            el.textContent = `${CONFIG.storeName} — ${CONFIG.locationCity}`;
        });
        
        const heroTitle = document.querySelector('.t-hero-title');
        if (heroTitle) {
            heroTitle.innerHTML = `Selamat Datang di<br><em>${CONFIG.storeName}</em>`;
        }
        
        document.querySelectorAll('.t-hero-desc').forEach(el => {
            el.textContent = CONFIG.shortDescription;
        });

        // -- Stats Band --
        const statNums = document.querySelectorAll('.stat-num');
        if (statNums[0]) statNums[0].textContent = CONFIG.totalMenuItems;
        if (statNums[1]) statNums[1].textContent = CONFIG.priceStartingFrom;

        // -- About Section --
        const aboutTitle = document.querySelector('.t-about-title');
        if (aboutTitle) {
            aboutTitle.innerHTML = `Tentang<br><em>${CONFIG.storeName}</em>`;
        }
        
        const estYear = document.querySelector('.about-est-year');
        if (estYear) estYear.textContent = CONFIG.establishedYear;
        
        const estTextNodes = document.querySelectorAll('.about-est-text');
        if (estTextNodes[1]) estTextNodes[1].textContent = '· ' + CONFIG.locationCity;
        
        const pullquoteAttr = document.querySelector('.pullquote-attr');
        if (pullquoteAttr) {
            pullquoteAttr.textContent = `${CONFIG.storeName}, ${CONFIG.locationCity}`;
        }
        
        const staticText = document.querySelector('.static-text');
        if (staticText) {
            staticText.textContent = `${CONFIG.storeName} —`;
        }

        // -- Lokasi Section --
        const lokasiHoursRow = document.querySelector('.lokasi-hours-row');
        if (lokasiHoursRow) {
            lokasiHoursRow.innerHTML = `<span class="t-lokasi-day1">${CONFIG.openingHours.days}</span><span>${CONFIG.openingHours.hours}</span>`;
        }
        
        const btnMaps = document.querySelector('.btn-maps');
        if (btnMaps) btnMaps.href = CONFIG.googleMapsLink;

        // -- Footer Social Links & Info --
        const footerTaglineEl = document.querySelector('.footer-tagline');
        if (footerTaglineEl) footerTaglineEl.textContent = CONFIG.footerTagline;

        const tiktokLinkEl = document.querySelector('.social-link[aria-label="TikTok"]');
        if (tiktokLinkEl) {
            tiktokLinkEl.href = CONFIG.tiktokLink || '#';
            if (!CONFIG.tiktokLink) tiktokLinkEl.style.display = 'none';
        }

        const igLinkEl = document.querySelector('.social-link[aria-label="Instagram"]');
        if (igLinkEl) {
            igLinkEl.href = CONFIG.instagramLink || '#';
            if (!CONFIG.instagramLink) igLinkEl.style.display = 'none';
        }

        const grabLinkEl = document.querySelector('.social-link[aria-label="GrabFood"]');
        if (grabLinkEl) {
            grabLinkEl.href = CONFIG.grabFoodLink || '#';
            if (!CONFIG.grabFoodLink) grabLinkEl.style.display = 'none';
        }

        const shopeeLinkEl = document.querySelector('.social-link[aria-label="ShopeeFood"]');
        if (shopeeLinkEl) {
            shopeeLinkEl.href = CONFIG.shopeeFoodLink || '#';
            if (!CONFIG.shopeeFoodLink) shopeeLinkEl.style.display = 'none';
        }

        // Footer copyright + kredit template
        const footerYear = document.getElementById('footerYear');
        if (footerYear) footerYear.textContent = new Date().getFullYear();

        const footerStoreName = document.getElementById('footerStoreName');
        if (footerStoreName) footerStoreName.textContent = CONFIG.storeName;

        const footerCreatorLink = document.getElementById('footerCreatorLink');
        if (footerCreatorLink) footerCreatorLink.href = CONFIG.templateCreatorLink;

        const footerCreatorName = document.getElementById('footerCreatorName');
        if (footerCreatorName) footerCreatorName.textContent = CONFIG.templateCreatorName;

        const footerLocation = document.getElementById('footerLocation');
        if (footerLocation) {
            footerLocation.textContent = `${CONFIG.locationCity} · ${CONFIG.locationProvince}`;
        }

        // Sinkronisasi WA_NUMBER global
        if (typeof CONFIG.whatsappNumber !== 'undefined') {
            global.WA_NUMBER = CONFIG.whatsappNumber;
        }
    }

    // ── 2. PREMIUM MOUSE CURSOR EFFECT ──
    function initPremiumCursor() {
        const cursor = document.getElementById('cursor');
        const ring = document.getElementById('cursor-ring');
        if (!cursor || !ring) return;

        let mx = -100, my = -100, rx = -100, ry = -100;
        
        document.addEventListener('mousemove', e => {
            mx = e.clientX;
            my = e.clientY;
        });
        
        function animateCursor() {
            cursor.style.left = mx + 'px';
            cursor.style.top = my + 'px';
            rx += (mx - rx) * 0.14;
            ry += (my - ry) * 0.14;
            ring.style.left = rx + 'px';
            ring.style.top = ry + 'px';
            requestAnimationFrame(animateCursor);
        }
        
        animateCursor();

        // Hover expansions
        document.querySelectorAll('a, button, .sp-img, .gm-item, .add-btn, .temp-btn').forEach(el => {
            el.addEventListener('mouseenter', () => {
                cursor.style.width = '20px';
                cursor.style.height = '20px';
                ring.style.width = '56px';
                ring.style.height = '56px';
                ring.style.opacity = '0.35';
            });
            el.addEventListener('mouseleave', () => {
                cursor.style.width = '12px';
                cursor.style.height = '12px';
                ring.style.width = '36px';
                ring.style.height = '36px';
                ring.style.opacity = '0.6';
            });
        });
    }

    // ── 3. INTERACTIVE LIGHTBOX GALLERY ──
    function openLightbox(src, caption) {
        const lb = document.getElementById('lightbox');
        const lbImg = document.getElementById('lb-img');
        const lbCaption = document.getElementById('lb-caption');

        if (lb && lbImg) {
            lbImg.src = src;
            if (lbCaption) lbCaption.textContent = caption || '';
            lb.classList.add('open');
            document.body.style.overflow = 'hidden';
        }
    }

    function closeLightbox() {
        const lb = document.getElementById('lightbox');
        const lbImg = document.getElementById('lb-img');
        
        if (lb) lb.classList.remove('open');
        document.body.style.overflow = '';
        setTimeout(() => {
            if (lbImg) lbImg.src = '';
        }, 450);
    }

    function handleLightboxClick(e) {
        if (e.target === document.getElementById('lightbox')) {
            closeLightbox();
        }
    }

    // Escape key to close lightbox
    document.addEventListener('keydown', e => {
        if (e.key === 'Escape') closeLightbox();
    });

    // ── 4. ECO SCREENSAVER (Idle Energy Saver) ──
    let idleTimer = null;
    let ecoVisible = false;
    let clockInterval = null;
    const IDLE_TIMEOUT = 3 * 60 * 1000; // 3 Menit idle

    function updateEcoClock() {
        const ecoClockEl = document.getElementById('ecoClockDisplay');
        if (ecoVisible && ecoClockEl) {
            const now = new Date();
            ecoClockEl.textContent = String(now.getHours()).padStart(2, '0') + ':' + String(now.getMinutes()).padStart(2, '0');
        }
    }

    function startClockUpdates() {
        if (clockInterval) return;
        clockInterval = setInterval(updateEcoClock, 1000);
        updateEcoClock();
    }

    function stopClockUpdates() {
        if (clockInterval) {
            clearInterval(clockInterval);
            clockInterval = null;
        }
    }

    function showEcoScreen() {
        if (ecoVisible) return;
        ecoVisible = true;
        
        const ecoScreen = document.getElementById('eco-screen');
        if (ecoScreen) {
            ecoScreen.classList.add('visible');
            document.body.style.overflow = 'hidden';
            startClockUpdates();
        }
    }

    function dismissEcoScreen() {
        if (!ecoVisible) return;
        ecoVisible = false;
        
        const ecoScreen = document.getElementById('eco-screen');
        if (ecoScreen) {
            ecoScreen.classList.remove('visible');
            document.body.style.overflow = '';
            stopClockUpdates();
            resetIdleTimer();
        }
    }

    function resetIdleTimer() {
        clearTimeout(idleTimer);
        if (!ecoVisible) {
            idleTimer = setTimeout(showEcoScreen, IDLE_TIMEOUT);
        }
    }

    // ── 5. HERO VIDEO CAROUSEL AUTOMATIC CYCLER ──
    function initHeroVideoSwitcher() {
        const heroVideos = document.querySelectorAll('.hero-video');
        const vdots = document.querySelectorAll('.vdot');
        if (heroVideos.length === 0) return;

        let currentVideo = 0;
        let videoInterval;

        function switchVideo(idx) {
            if (heroVideos[currentVideo] && vdots[currentVideo]) {
                heroVideos[currentVideo].classList.remove('active');
                vdots[currentVideo].classList.remove('active');
                heroVideos[currentVideo].pause();
            }
            
            currentVideo = idx;
            
            if (heroVideos[currentVideo] && vdots[currentVideo]) {
                heroVideos[currentVideo].classList.add('active');
                vdots[currentVideo].classList.add('active');
                heroVideos[currentVideo].play();
            }
        }

        function nextVideo() {
            switchVideo((currentVideo + 1) % heroVideos.length);
        }

        vdots.forEach(dot => {
            dot.addEventListener('click', () => {
                clearInterval(videoInterval);
                switchVideo(parseInt(dot.dataset.idx, 10));
                videoInterval = setInterval(nextVideo, 8000);
            });
        });

        videoInterval = setInterval(nextVideo, 8000);
    }

    // ── 6. MOBILE NAV TRIGGER ──
    function initMobileNav() {
        const hamburger = document.getElementById('hamburger');
        const mobileNav = document.getElementById('mobileNav');
        if (!hamburger || !mobileNav) return;

        hamburger.addEventListener('click', () => {
            hamburger.classList.toggle('open');
            mobileNav.classList.toggle('open');
            document.body.style.overflow = mobileNav.classList.contains('open') ? 'hidden' : '';
        });
    }

    function closeMobileNav() {
        const hamburger = document.getElementById('hamburger');
        const mobileNav = document.getElementById('mobileNav');
        
        if (hamburger) hamburger.classList.remove('open');
        if (mobileNav) mobileNav.classList.remove('open');
        document.body.style.overflow = '';
    }

    // ── 7. SCROLL REVEAL TRIGGERS ──
    function initScrollRevealObserver() {
        global.observer = new IntersectionObserver(entries => {
            entries.forEach(e => {
                if (e.isIntersecting) {
                    e.target.classList.add('active');
                    global.observer.unobserve(e.target);
                }
            });
        }, { threshold: 0.1, rootMargin: "0px 0px -40px 0px" });

        global.initScrollReveal = function () {
            const reveals = document.querySelectorAll('.reveal:not(.active)');
            reveals.forEach(el => global.observer.observe(el));
        };

        global.initScrollReveal();
    }

    // ── 8. DARK / LIGHT THEME TOGGLER ──
    function setTheme(dark) {
        document.body.classList.toggle('dark', dark);
        const icon = dark ? '☀️' : '🌙';
        
        const themeBtn = document.getElementById('themeBtn');
        const themeBtnM = document.getElementById('themeBtnM');
        
        if (themeBtn) themeBtn.textContent = icon;
        if (themeBtnM) themeBtnM.textContent = icon;
    }

    // ── 9. LANGUAGE TRANSLATION (COOKIE METHOD & TRANSLATE CLEANER) ──
    function cleanGoogleTranslateUI() {
        const selectors = [
            '.goog-te-gadget', '.goog-te-banner-frame', '.goog-te-balloon-frame',
            '.skiptranslate', '.goog-te-menu-frame', '.goog-te-menu2',
            '.goog-te-gadget-icon', '.goog-te-spinner', '.goog-te-spinner-pos',
            '#goog-gt-tt', 'iframe[class*="goog"]', 'div[class*="goog-te"]',
            'img[class*="goog"]', '*[class*="goog-te-"]'
        ];
        
        selectors.forEach(sel => {
            document.querySelectorAll(sel).forEach(el => el.remove());
        });
        
        // Disable Google loading spinner CSS
        const style = document.createElement('style');
        style.textContent = `
            .goog-te-spinner, .goog-te-spinner-pos, .goog-te-spinner-animation {
                display: none !important;
                animation: none !important;
                visibility: hidden !important;
            }
        `;
        document.head.appendChild(style);

        if (document.body.style.top !== '0px' && document.body.style.top !== '') {
            document.body.style.top = '0px';
            document.body.style.position = '';
        }
    }

    function getTransCookie() {
        const match = document.cookie.match(/googtrans=([^;]+)/);
        return match ? match[1] : '/id/id';
    }

    let currentTrans = getTransCookie();
    let currentLang = currentTrans.includes('/id/en') ? 'en' : 'id';

    function googleTranslateElementInit() {
        new google.translate.TranslateElement({
            pageLanguage: 'id',
            autoDisplay: false
        }, 'google_translate_element');
        
        if (!document.cookie.match('googtrans')) {
            document.cookie = "googtrans=/id/id; path=/";
        }
    }

    function toggleLang() {
        const targetLang = currentLang === 'id' ? '/id/en' : '/id/id';
        document.cookie = `googtrans=${targetLang}; path=/`;
        document.cookie = `googtrans=${targetLang}; path=/; domain=${global.location.hostname}`;
        global.location.reload();
    }

    // ── 10. EXPAND MENU CATEGORY: SHOW MORE ──
    function toggleMore(tab) {
        const extra = document.getElementById('extra-' + tab);
        const btn = document.querySelector('.t-btn-more-' + tab);
        if (!extra || !btn) return;
        
        extra.classList.toggle('show');
        const isOpen = extra.classList.contains('show');
        
        btn.textContent = isOpen
            ? (currentLang === 'id' ? 'Tutup ▲' : 'Show Less ▲')
            : (currentLang === 'id' ? 'Lihat Menu Lainnya ▼' : 'Show More ▼');
            
        if (isOpen) {
            extra.querySelectorAll('.reveal').forEach(el => {
                el.classList.remove('active');
                setTimeout(() => global.observer.observe(el), 50);
            });
        }

        // Re-init listeners on dynamic menu item show
        if (global.initCartButtons) setTimeout(global.initCartButtons, 50);
        if (global.initTempToggle) setTimeout(global.initTempToggle, 50);
        setTimeout(initMenuImages, 100);
    }

    // ── 11. DYNAMIC MAP LOADING (LEAFLET JS) ──
    function initMap() {
        var lat = (typeof CONFIG !== 'undefined') ? CONFIG.mapCoordinates.lat : -7.9184921;
        var lng = (typeof CONFIG !== 'undefined') ? CONFIG.mapCoordinates.lng : 113.8175745;
        var zoom = (typeof CONFIG !== 'undefined') ? CONFIG.mapZoom : 17;
        var nama = (typeof CONFIG !== 'undefined') ? CONFIG.storeName : 'Warkop Mawar';
        var mapsUrl = (typeof CONFIG !== 'undefined') ? CONFIG.googleMapsLink : 'https://maps.app.goo.gl/DyufcHiVK3apKeKk7';

        const mapEl = document.getElementById('map');
        if (!mapEl) return;

        var map = L.map('map', {
            scrollWheelZoom: false // disable scroll zoom for page scrolling safety
        }).setView([lat, lng], zoom);

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);

        var orangeIcon = L.icon({
            iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-orange.png',
            shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
            iconSize: [25, 41],
            iconAnchor: [12, 41],
            popupAnchor: [1, -34],
            shadowSize: [41, 41]
        });

        L.marker([lat, lng], { icon: orangeIcon }).addTo(map)
            .bindPopup(`<b>${nama.toUpperCase()}</b><br>Tempat Nongkrong &amp; Ngopi Asik<br><br><a href="${mapsUrl}" target="_blank" style="background:#E8622A;color:white;padding:6px 12px;border-radius:6px;text-decoration:none;display:inline-block;margin-top:8px;font-weight:bold;font-size:0.9rem;">Buka Google Maps</a>`)
            .openPopup();
    }

    // ── 12. IMAGE FALLBACK MANAGER ──
    function initMenuImages() {
        document.querySelectorAll('.menu-img').forEach(img => {
            if (img.dataset.imgInit) return;
            img.dataset.imgInit = '1';
            img.style.opacity = '1';

            // Point fallback source directly to the new SVG placeholder
            img.addEventListener('error', function () {
                this.src = 'assets/images/placeholder.svg';
            });

            if (img.complete && img.naturalHeight === 0 && img.src) {
                img.src = 'assets/images/placeholder.svg';
            }
        });
    }

    // ── INITIALIZER SETUP ──
    document.addEventListener('DOMContentLoaded', () => {
        applyConfig();
        initPremiumCursor();
        initHeroVideoSwitcher();
        initMobileNav();
        initScrollRevealObserver();
        initMenuImages();

        // Header dynamic shadow on scroll
        global.addEventListener('scroll', () => {
            const header = document.querySelector('header');
            if (header) {
                header.style.boxShadow = global.scrollY > 60 ? '0 2px 24px rgba(26,15,8,0.08)' : 'none';
            }
        });

        // Theme Button Event Listeners
        const themeBtn = document.getElementById('themeBtn');
        const themeBtnM = document.getElementById('themeBtnM');
        if (themeBtn) themeBtn.addEventListener('click', () => setTheme(!document.body.classList.contains('dark')));
        if (themeBtnM) themeBtnM.addEventListener('click', () => setTheme(!document.body.classList.contains('dark')));

        // Google Translate Event Listeners & initial UI cleans
        let cleanInterval = setInterval(cleanGoogleTranslateUI, 300);
        setTimeout(() => clearInterval(cleanInterval), 6000);
        cleanGoogleTranslateUI();

        const langBtn = document.getElementById('langBtn');
        const langBtnM = document.getElementById('langBtnM');
        if (langBtn) {
            langBtn.textContent = currentLang === 'id' ? 'EN' : 'ID';
            langBtn.addEventListener('click', toggleLang);
        }
        if (langBtnM) {
            langBtnM.textContent = currentLang === 'id' ? 'EN' : 'ID';
            langBtnM.addEventListener('click', toggleLang);
        }

        // Tab category switching triggers
        document.querySelectorAll('.tab-btn').forEach(btn => {
            btn.addEventListener('click', () => {
                document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
                btn.classList.add('active');
                
                const target = btn.dataset.tab;
                document.querySelectorAll('.tab-content').forEach(c => {
                    c.classList.remove('active');
                    if (c.id === 'tab-' + target) c.classList.add('active');
                });
                
                document.querySelectorAll('#tab-' + target + ' .reveal').forEach(el => {
                    el.classList.remove('active');
                    setTimeout(() => global.observer.observe(el), 50);
                });

                // Re-initialize cart buying logic and options for the new tab
                if (global.initCartButtons) setTimeout(global.initCartButtons, 50);
                if (global.initTempToggle) setTimeout(global.initTempToggle, 50);
                setTimeout(initMenuImages, 100);
            });
        });

        // Eco Screen interactive dismissals
        ['mousemove', 'mousedown', 'keydown', 'scroll', 'touchstart', 'wheel', 'click'].forEach(evt => {
            document.addEventListener(evt, () => {
                if (!ecoVisible) resetIdleTimer();
            }, { passive: true });
        });

        document.addEventListener('visibilitychange', () => {
            if (document.hidden) {
                stopClockUpdates();
                idleTimer = setTimeout(showEcoScreen, 30000);
            } else {
                clearTimeout(idleTimer);
                if (ecoVisible) dismissEcoScreen();
                else resetIdleTimer();
            }
        });

        resetIdleTimer();
    });

    // Page Loading animation timer
    const fill = document.getElementById('fill');
    const pct = document.getElementById('pct');
    const loader = document.getElementById('loader');
    const mainContent = document.getElementById('main-content');

    const msgs = ['Menyeduh kopi...', 'Memanaskan mesin...', 'Menyiapkan menu...', 'Selamat datang! ☕'];
    let p = 0, mi = 0;
    let pageLoaded = false;

    global.addEventListener('load', () => {
        pageLoaded = true;
    });

    const loadingInterval = setInterval(() => {
        if (pageLoaded) {
            p = Math.min(p + 5, 100);
        } else {
            if (p < 90) {
                p = Math.min(p + Math.random() * 3 + 0.5, 90);
            }
        }

        if (fill) fill.style.width = p + '%';
        const idx = Math.floor(p / 34);
        
        if (idx !== mi && idx < msgs.length) {
            mi = idx;
            if (pct) pct.textContent = msgs[mi];
        }

        if (p >= 100 && pageLoaded) {
            clearInterval(loadingInterval);
            if (pct) pct.textContent = msgs[3];
            
            setTimeout(() => {
                if (loader) loader.classList.add('hide');
                if (mainContent) mainContent.style.opacity = '1';
                document.body.classList.remove('no-scroll');
                
                if (global.initScrollReveal) global.initScrollReveal();
                initMap(); // load Leaflet OpenStreetMap
            }, 600);
        }
    }, 200);

    // Fallback load protection (takes too long triggers)
    setTimeout(() => {
        if (p < 100) {
            p = 100;
            clearInterval(loadingInterval);
            if (pct) pct.textContent = msgs[3];
            if (loader) loader.classList.add('hide');
            if (mainContent) mainContent.style.opacity = '1';
            document.body.classList.remove('no-scroll');
            
            if (global.initScrollReveal) global.initScrollReveal();
            initMap();
        }
    }, 8000);

    // Expose dynamic APIs to window
    global.googleTranslateElementInit = googleTranslateElementInit;
    global.openLightbox = openLightbox;
    global.closeLightbox = closeLightbox;
    global.handleLightboxClick = handleLightboxClick;
    global.dismissEcoScreen = dismissEcoScreen;
    global.closeMobileNav = closeMobileNav;
    global.toggleMore = toggleMore;
    global.initMap = initMap;
    global.initMenuImages = initMenuImages;

})(window);
