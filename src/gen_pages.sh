HEADER=common/header.html
FOOTER=common/footer.html

function fail
{
    echo "FAIL: $1"
    exit 1
}

[ -f ${HEADER} ] || fail "$HEADER is not a file"
[ -f ${FOOTER} ] || fail "$FOOTER is not a file"

# Gen people pages
./gen_people_page.sh > pages/people.html || \
    fail "Could not generate the people pages - see pages/people.html for errors"

./gen_news_page.sh > pages/news.html || \
    fail "Could not generate the news pages - see pages/news.html for errors"

# Gen people pages
./gen_index_page.sh > pages/index.html || \
    fail "Could not generate the indexs - see pages/index.html for errors"

# Gen alumni page
./gen_alumni_page.sh > pages/alumni.html || \
    fail "Could not generate the alumni page - see pages/alumni.html for errors"

# Gen publications pages
./gen_publications_page.sh > pages/publications.html || \
    fail "Could not generate the publications pages - see pages/publications.html for errors"

for i in pages/*.html; do
    B=`basename $i`
    [ -f ${i} ] || fail "$i is not a file"
    echo "Generating page: $i"
    # Generate page
    cp ${HEADER} ./tmp || fail "could not copy ${HEADER} to ./tmp"
    cat $i >> ./tmp || fail "could not append ${i} to ./tmp"
    cat ${FOOTER} >> ./tmp || fail "could not append ${i} to ./tmp"
    echo "Installing page: $i at ../$B"
    mv tmp ../$B || fail "Could not install page at ../$B"
    

done
