#!/usr/bin/bash

if [ ! -f /persist/comma/id_rsa.pub ]; then
  mkdir -p /persist/comma

  openssl genrsa -out /persist/comma/id_rsa.tmp 2048 &&
    openssl rsa -in /persist/comma/id_rsa.tmp -pubout -out /persist/comma/id_rsa.tmp.pub &&
    sync &&
    mv /persist/comma/id_rsa.tmp /persist/comma/id_rsa &&
    mv /persist/comma/id_rsa.tmp.pub /persist/comma/id_rsa.pub &&
    chmod 755 /persist/comma/ &&
    chmod 744 /persist/comma/id_rsa &&
    sync
fi

# ALIAS_CHECK=$(/usr/bin/grep gitpull /system/comma/home/.bash_profile)
# GET_PROP1=$(getprop persist.sys.locale)
# GET_PROP2=$(getprop persist.sys.local)
# GET_PROP_ATZ=$(getprop persist.sys.timezone)
# if [ -f "/data/params/d/OPKRTimeZone" ]; then
#     GET_PROP_STZ=$(cat /data/params/d/OPKRTimeZone)
# fi

# if [ "$ALIAS_CHECK" == "" ]; then
#     sleep 3
#     mount -o remount,rw /system
#     echo "alias gi='/data/openpilot/selfdrive/assets/addon/script/gitpull.sh'" >> /system/comma/home/.bash_profile
#     mount -o remount,r /system
# fi

# if [ "$GET_PROP1" != "ko-KR" ]; then
#     setprop persist.sys.locale ko-KR
# fi
# if [ "$GET_PROP2" != "ko-KR" ]; then
#     setprop persist.sys.local ko-KR
# fi
# if [ "$GET_PROP_STZ" != "" ] && [ "$GET_PROP_ATZ" != "$GET_PROP_STZ" ]; then
#     setprop persist.sys.timezone $GET_PROP_STZ
# fi

# if [ ! -f "/system/fonts/KaiGenGothicKR-Normal.ttf" ]; then
#     sleep 3
#     mount -o remount,rw /system
#     cp -rf /data/openpilot/selfdrive/assets/addon/font/KaiGenGothicKR* /system/fonts/
#     cp -rf /data/openpilot/selfdrive/assets/addon/font/fonts.xml /system/etc/fonts.xml
#     chmod 644 /system/etc/fonts.xml
#     chmod 644 /system/fonts/KaiGenGothicKR*
#     mount -o remount,r /system
#     reboot
# fi

# if [ -f "/data/bootanimation.zip" ]; then
#     DIFF=$(diff /data/bootanimation.zip /system/media/bootanimation.zip)
#     if [ "$DIFF" != "" ]; then
#         sleep 3
#         mount -o remount,rw /system
#         cp -f /data/bootanimation.zip /system/media/bootanimation.zip
#         chmod 644 /system/media/bootanimation.zip
#         mount -o remount,r /system
#     fi
# fi

export PASSIVE="0"
export LD_LIBRARY_PATH="/system/lib64:/usr/local/lib64:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/data/openpilot/third_party/snpe/aarch64:$LD_LIBRARY_PATH"
export LOGPRINT="debug"
exec ./launch_chffrplus.sh

