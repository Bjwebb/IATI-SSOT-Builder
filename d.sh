while true
do
    read line < pipe
    ./git.sh $line
done

