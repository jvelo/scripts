# Settings
MUSIC_DIR="$HOME/Music"
TEMP_DIR="/tmp/"
TEMP_FILE="alarm-clock-`date +%d%m%Y`.m3u"

# 10 random songs in a playlist
find $MUSIC_DIR -type f -regex ".*\.\(mp3\|m4a\|flac\|ogg\)" -print | sort --random-sort | head -10 >> $TEMP_DIR/$TEMP_FILE

# Play
mplayer -playlist $TEMP_DIR/$TEMP_FILE
