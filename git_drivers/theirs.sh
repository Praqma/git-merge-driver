printf "checking ...\n"
diff $2 $3 && exit 0

printf "
#######################
# Merge driver called #
#######################\n"
sleep 0.5
cp -f $3 $2
echo "file was overwrited from another branch!"

exit 0




#printf "ancestor: $1
#---------\n"
#cat $1
#printf "\n"
#
#printf "current branch: $2
#---------\n"
#cat $2
#printf "\n"
#
#printf "another branch: $3
#---------\n"
#cat $3
#printf "\n"
#
#printf "Resolving conflict ...\n"
#sleep 0.5
#cat $3 > $2
##echo "This is the merge result" > $2
#echo "Conflict resolved!"
#
#printf "resolved: $2\n
#---------\n"
#cat $2
#printf "\n"
#
#exit 0
