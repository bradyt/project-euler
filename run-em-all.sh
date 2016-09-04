#!/bin/bash
# borrowed from
# https://github.com/offby1/project-euler/blob/master/run-em-all.sh

# for f in $(ls -1 [0-9]*.ss [0-9]*.rkt)
# do
#     echo -n "${f}: "
#     racket "${f}"
# done

for f in p02[0-9].hs
do
    echo -n "${f}: "
    # PATH=/usr/local/bin:$PATH python3 "$f"
    stack runghc "$f"
done


