# This script was created by Ben Webb, and is released under CC0
# http://creativecommons.org/publicdomain/zero/1.0/

function function_to_fork {
    ref=`echo $1 | awk -F ',' '{ print $1 }'`
    after=`echo $1 | awk -F ',' '{ print $2 }'`
    before=`echo $1 | awk -F ',' '{ print $3 }'`
    repo_name=`echo $1 | awk -F ',' '{ print $4 }'`
    echo "$ref"
    echo "$after" "$before"
    if [ ! -d "commit/$repo_name/$after" ]; then
        mkdir -p "commit/$repo_name/$after"
        mkdir -p "build/$repo_name/$after"
        cd "build/$repo_name/$after" || exit 1
        git clone https://github.com/IATI/IATI-Standard-SSOT.git
        cd IATI-Standard-SSOT || exit 1
        if [ "$repo_name" = "IATI-Standard-SSOT" ]; then
            git checkout $after
        fi
        git submodule init
        git submodule update
        if [ "$repo_name" != "IATI-Standard-SSOT" ]; then
            cd $repo_name || exit 1
            git checkout $after
            cd .. || exit 1
        fi
        curl -L "https://gist.github.com/Bjwebb/405e5e0e9a0fac5f3a67/raw/layout.html" > IATI-Extra-Documentation/en/_templates/layout.html
        curl -L "https://gist.github.com/Bjwebb/405e5e0e9a0fac5f3a67/raw/layout.html" > IATI-Extra-Documentation/fr/_templates/layout.html
        ./gen.sh
        mv docs/en/_build/html "../../../../commit/$repo_name/$after/en"
        mv docs/fr/_build/html "../../../../commit/$repo_name/$after/fr"
    fi
}

function_to_fork $1 & 
