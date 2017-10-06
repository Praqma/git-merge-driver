echo ""
echo "#######################"
echo "# Merge driver called #"
echo "#######################"
echo ""

echo "ancestor: $1"
echo "---------"
cat $1
echo ""

echo " current: $2"
echo "---------"
cat $2
echo ""

echo "   other: $3"
echo "---------"
cat $3
echo ""

echo "Resolving conflict ..."
sleep 2
echo "This is the merge result" > $2
echo "Conflict resolved!"

echo "resolved: $2"
echo "---------"
cat $2
echo ""

exit 0
