OUTPUT="$1"

function fail
{
    echo "FAIL: $1"
    exit 1
}


LIST=`ls -w1 publications | sort -n -r` || fail "Could not find publications year directories at publications/"

for i in $LIST; do

    DIR="publications/$i"

    [ -d "$DIR"  ] || fail "$DIR is not a valid publications directory"

    if ls ${DIR}/*.info > /dev/null; then

	echo "<div class=\"row\">"
	echo "<h3 class=\"page-header\">$i</h3>"
	for p in $DIR/*.info; do
	    echo "  <p>"
	    cat $p
	    echo "  </p>"
	done
	echo "</div>"
    fi
done

