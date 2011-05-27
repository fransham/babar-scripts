source $env(COLL_FILE) 

set levelOfDetail "cache"
set ConfigPatch   "Run1"
set BetaMiniTuple "root"
set histFileName  output-$env(CLUSTERID).root
set printFreq 1000
set NEvent    5000

sourceFoundFile BetaMiniUser/MyMiniAnalysis.tcl

exit
