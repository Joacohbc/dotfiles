picom -b 2>> /dev/null
if [ $? == 1 ]; then
  killall -p picom
fi
