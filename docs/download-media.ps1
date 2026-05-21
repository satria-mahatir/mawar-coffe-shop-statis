# PowerShell Script untuk Download Media CC0 untuk Mawar Coffee Shop Template
# Jalankan: ./download-media.ps1

$ErrorActionPreference = "Stop"

# Warna output
function Write-Success { Write-Host $args -ForegroundColor Green }
function Write-Info { Write-Host $args -ForegroundColor Cyan }
function Write-Warning { Write-Host $args -ForegroundColor Yellow }

Write-Info "╔════════════════════════════════════════════════════════╗"
Write-Info "║   Download Media CC0 - Mawar Coffee Shop Template      ║"
Write-Info "╚════════════════════════════════════════════════════════╝"
Write-Info ""

# Setup folder
$imageDir = "assets/images"
if (-not (Test-Path $imageDir)) {
    Write-Info "📁 Membuat folder $imageDir..."
    New-Item -ItemType Directory -Path $imageDir -Force | Out-Null
}

# URL sumber media (CC0 - Pexels & Unsplash)
$mediaList = @(
    # VIDEO HERO (6 video)
    @{ name = "hero-video-1.mp4"; url = "https://videos.pexels.com/video-files/3437896/3437896-hd_1280_720_30fps.mp4" },
    @{ name = "hero-video-2.mp4"; url = "https://videos.pexels.com/video-files/3437945/3437945-hd_1280_720_30fps.mp4" },
    @{ name = "hero-video-3.mp4"; url = "https://videos.pexels.com/video-files/4105271/4105271-hd_1280_720_30fps.mp4" },
    @{ name = "hero-video-4.mp4"; url = "https://videos.pexels.com/video-files/6585381/6585381-hd_1280_720_30fps.mp4" },
    @{ name = "hero-video-5.mp4"; url = "https://videos.pexels.com/video-files/4105269/4105269-hd_1280_720_30fps.mp4" },
    @{ name = "hero-video-6.mp4"; url = "https://videos.pexels.com/video-files/3437894/3437894-hd_1280_720_30fps.mp4" },
    
    # FOTO HERO & TENTANG
    @{ name = "hero-banner.webp"; url = "https://images.pexels.com/photos/3407857/pexels-photo-3407857.jpeg?auto=compress&cs=tinysrgb&w=1200&h=800&fit=crop" },
    @{ name = "about-interior.webp"; url = "https://images.pexels.com/photos/3407857/pexels-photo-3407857.jpeg?auto=compress&cs=tinysrgb&w=1200&h=800&fit=crop" },
    
    # GALERI (4 foto)
    @{ name = "gallery-1.webp"; url = "https://images.pexels.com/photos/3407857/pexels-photo-3407857.jpeg?auto=compress&cs=tinysrgb&w=1000" },
    @{ name = "gallery-2.webp"; url = "https://images.pexels.com/photos/3408896/pexels-photo-3408896.jpeg?auto=compress&cs=tinysrgb&w=1000" },
    @{ name = "gallery-3.webp"; url = "https://images.pexels.com/photos/3431471/pexels-photo-3431471.jpeg?auto=compress&cs=tinysrgb&w=1000" },
    @{ name = "gallery-4.webp"; url = "https://images.unsplash.com/photo-1495521821757-a1efb6729352?auto=format&fit=crop&w=1000&q=80" },
    
    # MENU - KOPI (3 foto)
    @{ name = "menu-kopi-1.webp"; url = "https://images.pexels.com/photos/3394650/pexels-photo-3394650.jpeg?auto=compress&cs=tinysrgb&w=800" },
    @{ name = "menu-kopi-2.webp"; url = "https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=800" },
    @{ name = "menu-kopi-3.webp"; url = "https://images.unsplash.com/photo-1495521821757-a1efb6729352?auto=format&fit=crop&w=800&q=80" },
    
    # MENU - MAKANAN (3 foto)
    @{ name = "menu-food-1.webp"; url = "https://images.pexels.com/photos/5632663/pexels-photo-5632663.jpeg?auto=compress&cs=tinysrgb&w=800" },
    @{ name = "menu-food-2.webp"; url = "https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=800&q=80" },
    @{ name = "menu-food-3.webp"; url = "https://images.pexels.com/photos/5737452/pexels-photo-5737452.jpeg?auto=compress&cs=tinysrgb&w=800" }
)

# Download semua media
$successCount = 0
$failCount = 0

foreach ($media in $mediaList) {
    $filePath = "$imageDir/$($media.name)"
    $filename = $media.name
    
    # Cek apakah file sudah ada
    if (Test-Path $filePath) {
        Write-Success "✓ $filename (sudah ada)"
        $successCount++
    } else {
        Write-Info "⬇ Downloading $filename..."
        try {
            # Download file dengan timeout
            $ProgressPreference = 'SilentlyContinue'
            Invoke-WebRequest -Uri $media.url -OutFile $filePath -TimeoutSec 30
            Write-Success "✓ $filename (sukses)"
            $successCount++
        } catch {
            Write-Warning "✗ $filename - GAGAL: $($_.Exception.Message)"
            Write-Warning "  URL: $($media.url)"
            $failCount++
        }
    }
}

Write-Info ""
Write-Info "╔════════════════════════════════════════════════════════╗"
Write-Success "✓ Sukses: $successCount file"
if ($failCount -gt 0) {
    Write-Warning "✗ Gagal: $failCount file"
}
Write-Info "╚════════════════════════════════════════════════════════╝"

if ($failCount -gt 0) {
    Write-Warning ""
    Write-Warning "⚠️  Beberapa file gagal diunduh. Kemungkinan penyebab:"
    Write-Warning "  • URL tidak valid atau sudah tidak aktif"
    Write-Warning "  • Koneksi internet lambat atau terputus"
    Write-Warning "  • Storage penuh atau permission denied"
    Write-Warning ""
    Write-Warning "Solusi: Download manual dari https://www.pexels.com/videos/ dan https://unsplash.com"
    Write-Warning "Baca DOWNLOAD_MEDIA.md untuk petunjuk lengkap."
}

Write-Info ""
Write-Success "✅ Langkah selanjutnya:"
Write-Info "  1. Cek folder assets/images/ untuk memastikan semua file ada"
Write-Info "  2. Update src video di index.html (lihat DOWNLOAD_MEDIA.md)"
Write-Info "  3. Buka index.html di browser dan test video carousel"

Read-Host "Tekan Enter untuk selesai"
