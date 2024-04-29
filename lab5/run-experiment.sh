#!/bin/bash

set -euo pipefail

echo
for i in $(seq 20); do
  if [ -f castle/castle-8-5-$i-cards.pddl ]; then
    echo " == instance $i =="
    for k in 1000 100000; do
      echo "abstraction with at most $k states:"
      (
        ulimit -t 60
        ulimit -v 2000000
        ./fast-downward/fast-downward.py castle/castle-8-5-$i-cards.pddl --search "astar(pdb(pattern=greedy($k)))" | grep "Greedy generator pattern\|Expanded until last jump\|Total time\|Search time" | sed -e "s/\[.*\] //g"
      )
      echo
    done
  fi
done
