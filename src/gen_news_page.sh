OUTPUT="$1"

function fail
{
    echo "FAIL: $1"
    exit 1
}

echo "    <div class=\"row\">"

cat <<DELIM
      <div class="col-sm-12">
	<h3 class="page-header">News</h3>
      </div> 
DELIM

I=0;
for i in `ls -w ./news/*.html | sort -r `; do
    if [ $I = "${MAX_NEWS_ITEMS}" ]; then break; fi # Stop at MAX_NEWS_ITEMS
    I=$((I+1));
    cat <<DELIM

      <div class="col-sm-12" style="margin-bottom: 20px" >
DELIM
    cat $i
    cat <<DELIM
      </div>
DELIM
done

echo "    </div> <!-- row -->"

