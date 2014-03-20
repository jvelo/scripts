for file in $(find -name \*.groovy); do
COMPILESTATIC=`cat $file | grep CompileStatic`
  if grep "CompileStatic" $file &> /dev/null
  then
    :
  else
    echo $file
  fi
done
