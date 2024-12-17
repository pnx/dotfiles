function cat
    if test -f /usr/bin/bat
        /usr/bin/bat -p --pager=never $argv
    else
        /bin/cat $argv
    end
end
