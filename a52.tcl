source $env(COLL_FILE) 

set levelOfDetail "cache"
set ConfigPatch   "Run1"
set BetaMiniTuple "root"
set histFileName  output-$env(CLUSTERID).root
sourceFoundFile BetaMiniUser/MyMiniAnalysis.tcl

module talk KanEventInput
   first set 1
exit

mod talk MyMiniAnalysis
    myverbose set 0
exit

ev beg

exit
