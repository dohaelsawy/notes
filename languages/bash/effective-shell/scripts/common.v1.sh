password="helloAndGoodbye"
masked_password=$( echo "$password" | sed 's/./*/g')
echo "setting password '$masked_password'"
