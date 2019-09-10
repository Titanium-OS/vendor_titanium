lunch_others_targets=()
for device in $(python vendor/titanium/tools/get_official_devices.py)
do
    for var in eng user userdebug; do
        lunch_others_targets+=("titanium_$device-$var")
    done
done
