source $env(COLL_FILE) 

set levelOfDetail "cache"
set ConfigPatch   "Run1"
set BetaMiniTuple "root"
set histFileName  output-$env(CLUSTERID).root
set PrintFreq 1000

sourceFoundFile BetaMiniUser/MyMiniAnalysis.tcl

exit
