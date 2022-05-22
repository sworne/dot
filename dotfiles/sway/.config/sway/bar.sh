tz_local=$(date '+%Z ➬ %a %R %F')
tz_nyc=$(TZ=America/New_York date '+%Z ➬ %a %R')
tz_la=$(TZ=America/Los_Angeles date '+%Z ➬ %a %R')
tz_jp=$(TZ=Asia/Tokyo date '+%Z ➬ %a %R')
tz_zrh=$(TZ=Europe/Zurich date '+%Z ➬ %a %R')
if [ "$(pidof spotify)" ]; then
    # status can be: Playing, Paused or Stopped
    status=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus'|egrep -A 1 "string"|cut -b 26-|cut -d '"' -f 1|egrep -v ^$`
    artist=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|egrep -A 2 "artist"|egrep -v "artist"|egrep -v "array"|cut -b 27-|cut -d '"' -f 1|egrep -v ^$`
    album=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|egrep -A 1 "album"|egrep -v "album"|cut -b 44-|cut -d '"' -f 1|egrep -v ^$`
    title=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|egrep -A 1 "title"|egrep -v "title"|cut -b 44-|cut -d '"' -f 1|egrep -v ^$`
fi

echo $title by $artist  •   $tz_local   •   $tz_nyc   •   $tz_la   •   $tz_jp   •   $tz_zrh