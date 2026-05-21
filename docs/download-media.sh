#!/bin/bash

# Bash Script untuk Download Media CC0 untuk Mawar Coffee Shop Template
# Jalankan: bash download-media.sh atau chmod +x download-media.sh && ./download-media.sh

set -e

# Warna output
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${CYAN}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║   Download Media CC0 - Mawar Coffee Shop Template      ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

# Setup folder
IMAGE_DIR="assets/images"
if [ ! -d "$IMAGE_DIR" ]; then
    echo -e "${CYAN}📁 Membuat folder $IMAGE_DIR...${NC}"
    mkdir -p "$IMAGE_DIR"
fi

# Array URL media (CC0 - Pexels & Unsplash)
declare -A mediaList=(
    # VIDEO HERO (6 video)
    [hero-video-1.mp4]="https://videos.pexels.com/video-files/3437896/3437896-hd_1280_720_30fps.mp4"
    [hero-video-2.mp4]="https://videos.pexels.com/video-files/3437945/3437945-hd_1280_720_30fps.mp4"
    [hero-video-3.mp4]="https://videos.pexels.com/video-files/4105271/4105271-hd_1280_720_30fps.mp4"
    [hero-video-4.mp4]="https://videos.pexels.com/video-files/6585381/6585381-hd_1280_720_30fps.mp4"
    [hero-video-5.mp4]="https://videos.pexels.com/video-files/4105269/4105269-hd_1280_720_30fps.mp4"
    [hero-video-6.mp4]="https://videos.pexels.com/video-files/3437894/3437894-hd_1280_720_30fps.mp4"
    
    # FOTO HERO & TENTANG
    [hero-banner.webp]="https://images.pexels.com/photos/3407857/pexels-photo-3407857.jpeg?auto=compress&cs=tinysrgb&w=1200&h=800&fit=crop"
    [about-interior.webp]="https://images.pexels.com/photos/3407857/pexels-photo-3407857.jpeg?auto=compress&cs=tinysrgb&w=1200&h=800&fit=crop"
    
    # GALERI (4 foto)
    [gallery-1.webp]="https://images.pexels.com/photos/3407857/pexels-photo-3407857.jpeg?auto=compress&cs=tinysrgb&w=1000"
    [gallery-2.webp]="https://images.pexels.com/photos/3408896/pexels-photo-3408896.jpeg?auto=compress&cs=tinysrgb&w=1000"
    [gallery-3.webp]="https://images.pexels.com/photos/3431471/pexels-photo-3431471.jpeg?auto=compress&cs=tinysrgb&w=1000"
    [gallery-4.webp]="https://images.unsplash.com/photo-1495521821757-a1efb6729352?auto=format&fit=crop&w=1000&q=80"
    
    # MENU - KOPI (3 foto)
    [menu-kopi-1.webp]="https://images.pexels.com/photos/3394650/pexels-photo-3394650.jpeg?auto=compress&cs=tinysrgb&w=800"
    [menu-kopi-2.webp]="https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&w=800"
    [menu-kopi-3.webp]="https://images.unsplash.com/photo-1495521821757-a1efb6729352?auto=format&fit=crop&w=800&q=80"
    
    # MENU - MAKANAN (3 foto)
    [menu-food-1.webp]="https://images.pexels.com/photos/5632663/pexels-photo-5632663.jpeg?auto=compress&cs=tinysrgb&w=800"
    [menu-food-2.webp]="https://images.unsplash.com/photo-1578985545062-69928b1d9587?auto=format&fit=crop&w=800&q=80"
    [menu-food-3.webp]="https://images.pexels.com/photos/5737452/pexels-photo-5737452.jpeg?auto=compress&cs=tinysrgb&w=800"
)

# Download semua media
success_count=0
fail_count=0

for filename in "${!mediaList[@]}"; do
    url="${mediaList[$filename]}"
    filepath="$IMAGE_DIR/$filename"
    
    # Cek apakah file sudah ada
    if [ -f "$filepath" ]; then
        echo -e "${GREEN}✓ $filename (sudah ada)${NC}"
        ((success_count++))
    else
        echo -e "${CYAN}⬇ Downloading $filename...${NC}"
        
        # Download dengan timeout
        if curl -L --max-time 60 -o "$filepath" "$url" 2>/dev/null; then
            # Validasi file berhasil diunduh (file size > 0)
            if [ -s "$filepath" ]; then
                echo -e "${GREEN}✓ $filename (sukses)${NC}"
                ((success_count++))
            else
                echo -e "${YELLOW}✗ $filename - GAGAL: File kosong${NC}"
                rm -f "$filepath"
                ((fail_count++))
            fi
        else
            echo -e "${YELLOW}✗ $filename - GAGAL: Unduhan gagal${NC}"
            rm -f "$filepath" 2>/dev/null
            ((fail_count++))
        fi
    fi
done

echo ""
echo -e "${CYAN}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}✓ Sukses: $success_count file${NC}"
if [ $fail_count -gt 0 ]; then
    echo -e "${YELLOW}✗ Gagal: $fail_count file${NC}"
fi
echo -e "${CYAN}╚════════════════════════════════════════════════════════╝${NC}"

if [ $fail_count -gt 0 ]; then
    echo ""
    echo -e "${YELLOW}⚠️  Beberapa file gagal diunduh. Kemungkinan penyebab:${NC}"
    echo -e "${YELLOW}  • URL tidak valid atau sudah tidak aktif${NC}"
    echo -e "${YELLOW}  • Koneksi internet lambat atau terputus${NC}"
    echo -e "${YELLOW}  • Storage penuh atau permission denied${NC}"
    echo ""
    echo -e "${YELLOW}Solusi: Download manual dari https://www.pexels.com/videos/ dan https://unsplash.com${NC}"
    echo -e "${YELLOW}Baca DOWNLOAD_MEDIA.md untuk petunjuk lengkap.${NC}"
fi

echo ""
echo -e "${GREEN}✅ Langkah selanjutnya:${NC}"
echo -e "${CYAN}  1. Cek folder assets/images/ untuk memastikan semua file ada${NC}"
echo -e "${CYAN}  2. Update src video di index.html (lihat DOWNLOAD_MEDIA.md)${NC}"
echo -e "${CYAN}  3. Buka index.html di browser dan test video carousel${NC}"
