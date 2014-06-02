while read line; do
    git rm $line
done < $1
