#!/usr/bin/env fish

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x LANGUAGE en_US.UTF-8

set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/bin $PATH

function vi
    vim $argv
end

function ls
    exa $argv
end

function cat
    bat -p $argv
end

function grep
    rg --hidden $argv
end

function untab
    set temp_file (mktemp)
    expand $argv > $temp_file
    mv $temp_file $argv
end

function ve
    if not test -d venv
        python -m venv venv
    end
    source venv/bin/activate.fish
    if test -e requirements.txt
        python -m pip install -r requirements.txt
    end
end

function ve2
    if not test -d venv
        virtualenv --python=python2 venv
    end
    source venv/bin/activate.fish
    if test -e requirements.txt
        pip install -r requirements.txt
    end
end

function ci
    eval $HOME/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end

function ce
    eval $HOME/miniconda3/bin/conda "shell.fish" "hook" $argv | source
    if not test -d env
        conda env create --prefix ./env --file environment.yml
    end
    conda activate ./env
end

function power
    upower -i /org/freedesktop/UPower/devices/battery_BAT0
end

function gitrename
    for file in (git grep -l $argv[1])
        sed -i "s/$argv[1]/$argv[2]/g" $file
    end
end

function _perm
    find . -type f -not -perm /111 -exec chmod $argv[1] {} \;
    find . -type f      -perm /111 -exec chmod $argv[2] {} \;
    find . -type d                 -exec chmod $argv[2] {} \;
end

function perm600
    find . -type f -exec chmod 600 {} \;
    find . -type d -exec chmod 700 {} \;
end

function perm700
    _perm 600 700
end

function perm750
    _perm 640 750
end

function perm755
    _perm 644 755
end

# removes trailing whitespace in file $argv
function trailing
    sed --in-place 's/[[:space:]]\+$//' $argv
end

function fish_greeting
end
