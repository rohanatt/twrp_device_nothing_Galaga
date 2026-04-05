DEVICE_PATH := device/nothing/Galaga

# -----------------------------------------------------------------------------
# Platform
# -----------------------------------------------------------------------------
TARGET_BOARD_PLATFORM := mt6878
TARGET_BOOTLOADER_BOARD_NAME := Galaga
TARGET_NO_BOOTLOADER := true

# -----------------------------------------------------------------------------
# Architecture
# -----------------------------------------------------------------------------
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55

# -----------------------------------------------------------------------------
# Kernel (GKI + Prebuilt)
# -----------------------------------------------------------------------------
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_BOOT_HEADER_VERSION := 4

TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_NO_KERNEL_OVERRIDE := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel

BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt/dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_RAMDISK_USE_LZ4 := true

BOARD_KERNEL_BASE := 0x3fff8000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x26f08000
BOARD_TAGS_OFFSET := 0x07c88000

BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 log_buf_len=1M ignore_loglevel printk.devkmsg=on
BOARD_BOOTCONFIG += androidboot.selinux=permissive

BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb_offset $(BOARD_TAGS_OFFSET)

# -----------------------------------------------------------------------------
# Kernel Modules
# -----------------------------------------------------------------------------
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(wildcard $(DEVICE_PATH)/prebuilt/modules/ramdisk/*.ko)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/prebuilt/modules/ramdisk/modules.load))
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/prebuilt/modules/ramdisk/modules.load.recovery))

# -----------------------------------------------------------------------------
# Vendor Boot / Recovery
# -----------------------------------------------------------------------------
BOARD_USES_RECOVERY_AS_BOOT := false
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true

# -----------------------------------------------------------------------------
# Partitions (Dynamic)
# -----------------------------------------------------------------------------
BOARD_FLASH_BLOCK_SIZE := 262144

BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864

BOARD_SUPER_PARTITION_SIZE := 9663676416
BOARD_SUPER_PARTITION_GROUPS := nothing_dynamic_partitions

BOARD_NOTHING_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    odm odm_dlkm product system system_dlkm system_ext vendor vendor_dlkm

BOARD_NOTHING_DYNAMIC_PARTITIONS_SIZE := 9122611200

BOARD_USES_METADATA_PARTITION := true

# -----------------------------------------------------------------------------
# Filesystem
# -----------------------------------------------------------------------------
TARGET_USERIMAGES_USE_F2FS := true
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true

# -----------------------------------------------------------------------------
# FSTAB
# -----------------------------------------------------------------------------
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# -----------------------------------------------------------------------------
# AVB
# -----------------------------------------------------------------------------
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# -----------------------------------------------------------------------------
# Security Patch
# -----------------------------------------------------------------------------
PLATFORM_VERSION := 14
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
BOOT_SECURITY_PATCH := 2099-12-31

# -----------------------------------------------------------------------------
# TWRP Configuration
# -----------------------------------------------------------------------------
TW_THEME := portrait_hdpi

TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2392
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888

TW_MAX_BRIGHTNESS := 4094
TW_DEFAULT_BRIGHTNESS := 1200

TW_FRAMERATE := 120

TW_INCLUDE_CRYPTO := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_FUSE_EXFAT := true
TW_HAS_MTP := true

TWRP_INCLUDE_LOGCAT := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true

TW_EXTRA_LANGUAGES := false
TW_SCREEN_BLANK_ON_BOOT := true

TW_DEVICE_VERSION := 1
TARGET_USES_LOGD := true
