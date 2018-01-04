for device in $(python vendor/titanium/tools/get_official_devices.py)
do
for var in eng user userdebug; do
add_lunch_combo titanium_$device-$var
done
done
