#!/bin/fish
function log-grep
    test -z $argv[1] && return 1

    set -l DIR $argv[1]
    mkdir -p $DIR/{grep, csv}

    for file in *.stat.*
        set -l BASENAME $(basename $file)
        echo $BASENAME
        grep -v -e '^\s*#' -e '^\s*$' $file >$DIR/grep/$BASENAME
        cat $DIR/grep/$file | sed -e '1,3d' | sed -E 's/^ +//' | sed -E 's/-+//g'| sed -E 's/ +/,/g' >$DIR/csv/$BASENAME.csv
    end
end
