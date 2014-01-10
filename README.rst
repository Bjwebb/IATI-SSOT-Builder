This is the code for automatically rebuilding dev.iatistandard.org based on changes in the Single Source of Truth.

::

    cp secret.php.example secret.php # and edit
    mkdir json
    mkfifo pipe
