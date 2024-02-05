printf "checking ...\n"
diff $2 $3 && exit 0

printf "
#######################
# Merge driver called #
#######################\n"
sleep 0.5
cp -f $2 $3
echo "Keep file from current branch!"

exit 0
