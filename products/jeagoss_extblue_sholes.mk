# Inherit cyanogenmod configurations
$(call inherit-product, vendor/cyanogen/products/cyanogen_sholes.mk)

# Extremely Blue build time theming vendor setup
# Add Extremely Blue Overrides
PRODUCT_NAME := jeagoss_extblue_sholes
PRODUCT_PACKAGE_OVERLAYS += vendor/jeagoss_extblue/overlay

PRODUCT_COPY_FILES +=  \
    vendor/jeagoss_extblue/proprietary/ThemeDefaults.apk:system/app/ThemeDefaults.apk
    vendor/jeagoss_extblue/prebuilt/common/bin/setdefcols.sh:system/bin/setdefcols.sh