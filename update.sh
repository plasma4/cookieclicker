# If you are on macOS, replace grep with ggrep by installing the Homebrew package.
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
REF="http://orteil.dashnet.org/cookieclicker/"
rm -r img
rm -r loc
rm -r snd
mkdir img
mkdir loc
mkdir snd
# for f in $(cat _jslist.txt) ; do 
#   rm "$f"
# done
cd img/
wget --user-agent="$UA" --referer="$REF" --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/img/
grep -v PARENTDIR index.html | grep '\[IMG' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' > _imglist.txt
wget --user-agent="$UA" --referer="$REF" -N -i _imglist.txt -B http://orteil.dashnet.org/cookieclicker/img/

cd ../snd/
wget --user-agent="$UA" --referer="$REF" --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/snd/
grep -v PARENTDIR index.html | grep '\[SND' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' > _sndlist.txt
wget --user-agent="$UA" --referer="$REF" -N -i _sndlist.txt -B http://orteil.dashnet.org/cookieclicker/snd/

cd ../loc/
wget --user-agent="$UA" --referer="$REF" --convert-links -O index.html http://orteil.dashnet.org/cookieclicker/loc/
grep -v PARENTDIR index.html | grep '\[TXT' | grep -Po 'a href="\K.*?(?=")' | sed 's/\?.*//' > _loclist.txt
wget --user-agent="$UA" --referer="$REF" -N -i _loclist.txt -B http://orteil.dashnet.org/cookieclicker/loc/cd ../
# wget -N -i _jslist.txt -B http://orteil.dashnet.org/cookieclicker/
# wget -O index.html http://orteil.dashnet.org/cookieclicker/
# wget -O style.css http://orteil.dashnet.org/cookieclicker/style.css
# wget -O grab.txt http://orteil.dashnet.org/patreon/grab.php