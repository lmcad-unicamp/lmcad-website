#/bin/sh

MAX_NEWS_ITEMS=3

function fail
{
    echo "FAIL: $1"
    exit 1
}


function gen_index_about {
   cat <<EOF
      <div class="col-sm-12">

	<h3 class="page-header">About</h3>
	
	<p>
	  Founded in 2014, LMCAD is a computing laboratory that
	  supports research, development and teaching of computing
	  technologies at
	  the <a href="http://www.unicamp.br/unicamp/?language=en">University
	  of Campinas</a>.
	</p>

	<p>
	  Born with a multidisciplinary DNA, the
	  laboratory supports faculty members, students and industry
	  players from several areas, including civil and mechanical
	  engineering, applied mathematics and the oil and gas industry. High
	  performance computing, efficient cryptography, cloud
	  computing, machine learning, virtualization, computational thinking, Internet
	  of Things, energy efficient computing are just a few of the
	  topics investigated at the laboratory.
	</p>

	</p>

      </div>
EOF
}

function gen_index_news {

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
      <div class="col-sm-4" style="margin-bottom: 20px" >
DELIM
    cat $i
    cat <<DELIM
      </div>
DELIM
    done

}


###########
## MAIN
###########

echo "    <div class=\"row\">"
gen_index_about
gen_index_news
echo "    </div> <!-- row -->"
