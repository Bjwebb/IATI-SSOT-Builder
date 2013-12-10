function function_to_fork {
    echo "$1" >> test
    ref=`echo $1 | awk -F ',' '{ print $1 }'`
    after=`echo $1 | awk -F ',' '{ print $2 }'`
    before=`echo $1 | awk -F ',' '{ print $3 }'`
    echo "$ref"
    echo "$after" "$before"
    if [ ! -d "commit/$after" ]; then
        mkdir "commit/$after"
        mkdir "build/$after"
        cd "build/$after"
        git clone https://github.com/IATI/IATI-Standard-SSOT.git
        cd IATI-Standard-SSOT
        git submodule init
        git submodule update
        curl "https://gist.github.com/Bjwebb/405e5e0e9a0fac5f3a67/raw/layout.html" > IATI-Extra-Documentation/en/_templates/layout.html
        curl "https://gist.github.com/Bjwebb/405e5e0e9a0fac5f3a67/raw/layout.html" > IATI-Extra-Documentation/fr/_templates/layout.html
        ./gen.sh
        mv docs/en/_build/html "../../../commit/$after/en"
        mv docs/fr/_build/html "../../../commit/$after/fr"
    fi
}

function_to_fork $1 & 
