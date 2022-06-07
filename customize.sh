API="$(getprop ro.build.version.sdk)"
DIRPATH="$MODPATH/system/priv-app/ExternalStorageProvider"

case "$API" in
    32)
        mkdir -p "$DIRPATH"
        cp -rf "$MODPATH"/S2/* "$DIRPATH"
        ;;
    31)
        mkdir -p "$DIRPATH"
        cp -rf "$MODPATH"/S/* "$DIRPATH"
        ;;
    30)
        mkdir -p "$DIRPATH"
        cp -rf "$MODPATH"/R/* "$DIRPATH"
        ;;
    [1-9] | [12][0-9])
        abort "! Minimum requirements is Android 11+ (API 30)"
        ;;
    *)
        abort "! Support is not added yet for API $API"
        ;;
esac

find "$MODPATH"/* -maxdepth 0 ! \( -name 'system' -o -name 'module.prop' \) -exec rm -rf {} \;

REPLACE="
/system/priv-app/ExternalStorageProvider
"
