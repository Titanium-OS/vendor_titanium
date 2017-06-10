for device in $(curl -s https://raw.githubusercontent.com/Titanium-OS-Devices/official_devices/master/devices.json | sed 's/ //; /^$/d' | grep -Po '\"codename\": ".*?"' | sed -e 's/codename//;s/\"//g;s/\: //')
do
add_lunch_combo titanium_$device-userdebug
done
