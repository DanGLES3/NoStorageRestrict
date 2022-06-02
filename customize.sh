CODENAME="$(getprop ro.build.version.sdk)"
MODDIRPATH="$MODPATH/system/priv-app/ExternalStorageProvider"

case "$CODENAME" in
	32)
		mkdir -p "$MODDIRPATH"
		cp -rf "$MODPATH"/S2/* "$MODDIRPATH"
		;;
	31)
		mkdir -p "$MODDIRPATH"
		cp -rf "$MODPATH"/S/* "$MODDIRPATH"
		;;
	30)
		mkdir -p "$MODDIRPATH"
		cp -rf "$MODPATH"/R/* "$MODDIRPATH"
		;;
esac

find "$MODPATH"/* -maxdepth 0 ! \( -name 'system' -o -name 'module.prop' \) -exec rm -rf {} \;

REPLACE="
/system/priv-app/ExternalStorageProvider
"
