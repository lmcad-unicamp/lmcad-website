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
	  Founded in 2014, LMCAD is a computing laboratory that  supports research, development and teaching of computing
	  technologies at
	  the <a href="http://www.unicamp.br/unicamp/?language=en">University
	  of Campinas</a>.
	</p>
	<p>
	  Born with a multidisciplinary DNA, LMCAD supports faculty members, students and industry
	  players from several areas in researching and using technologies such as high-performance computing, cryptography, cloud
	  computing, machine learning, virtualization, computational thinking, Internet
	  of Things, and energy efficient computing.
	</p>
	<p>
		In 2022, LMCAD was renamed <a href="https://discovery.ic.unicamp.br/">Discovery<sup>1</sup></a>.  
		For more information on past and current activities of Discovery, please, visit <a href="https://discovery.ic.unicamp.br/">https://discovery.ic.unicamp.br/</a>
	</p>

      </div>
EOF
}


###########
## MAIN
###########

echo "    <div class=\"row\">"
gen_index_about
echo "    </div> <!-- row -->"
