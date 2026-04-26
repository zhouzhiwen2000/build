# Rockchip RK3399 hexa core 4GB LPDDR3 SoC GBe eMMC USB3 WiFi/BT
BOARD_NAME="EAIDK-610"
BOARD_VENDOR="openailab"
BOARDFAMILY="rockchip64"
BOARD_MAINTAINER=""
INTRODUCED="2022"
BOOTCONFIG="eaidk-610-rk3399_defconfig"
KERNEL_TARGET="current,edge"
KERNEL_TEST_TARGET="edge"
FULL_DESKTOP="yes"
BOOT_LOGO="desktop"
BOOT_FDT_FILE="rockchip/rk3399-eaidk-610.dtb"
BOOTBRANCH_BOARD="tag:v2026.04"
BOOTPATCHDIR="v2026.04"
BOOT_SCENARIO="binman"
SRC_EXTLINUX="yes"
SRC_CMDLINE="console=ttyS2,1500000 console=tty0"

function post_family_tweaks_bsp__eaidk_610_brcm_firmware_layout() {
	display_alert "$BOARD" "Adding EAIDK-610 Broadcom firmware symlinks" "info"

	mkdir -p "${destination}/lib/firmware/brcm"

	# Keep the board-compatible override local to this board and point it at the
	# generic patchram file already shipped by armbian-firmware.
	ln -sf ../BCM4345C0.hcd "${destination}/lib/firmware/brcm/BCM4345C0.openailab,eaidk-610.hcd"

	# Wi-Fi tries the board-compatible naming first; point it to the generic AP6255 assets.
	ln -sf brcmfmac43455-sdio.bin "${destination}/lib/firmware/brcm/brcmfmac43455-sdio.openailab,eaidk-610.bin"
	ln -sf brcmfmac43455-sdio.txt "${destination}/lib/firmware/brcm/brcmfmac43455-sdio.openailab,eaidk-610.txt"
	ln -sf brcmfmac43455-sdio.clm_blob "${destination}/lib/firmware/brcm/brcmfmac43455-sdio.openailab,eaidk-610.clm_blob"

	return 0
}
