# This script was created by Ben Webb, and is released under CC0
# http://creativecommons.org/publicdomain/zero/1.0/

while true
do
    read line < pipe
    ./git.sh $line
done

