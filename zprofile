#!/bin/zsh
#
# Dircolors...
eval `dircolors -b ~/.dircolors`

# Kill flow control
if tty -s ; then
    stty -ixon
    stty -ixoff
fi

# Exports
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/bin

if [ "$HOSTNAME" = "thisch" ]; then
    #for DA
    CFBUILD_DIRNAME='build_release'
    NGSOLVE_PATH="${HOME}/packages/ngsolve_with_mkl/installed"
    export LD_LIBRARY_PATH=${NGSOLVE_PATH}/lib:/usr/local/lib
    export LD_LIBRARY_PATH=$HOME/cf-fem-lib/${CFBUILD_DIRNAME}/lib:$LD_LIBRARY_PATH
    export PATH=$PATH:$HOME/cf-fem-lib/${CFBUILD_DIRNAME}/green:$HOME/cf-fem-lib/${CFBUILD_DIRNAME}/src

    #for netgen
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/packages/Togl-1.7
    export NETGENDIR=/usr/local/bin
fi

# if [ -z $LD_LIBRARY_PATH ]; then
#     export LD_LIBRARY_PATH=/home/thomas/packages/ngsolve_with_mkl/installed/lib:/usr/local/lib
# else
#     export LD_LIBRARY_PATH=/home/thomas/packages/ngsolve_with_mkl/installed/lib:/usr/local/lib:$LD_LIBRARY_PATH
# fi


#export LC_ALL=en_US.UTF-8
#export LANG=en_US.UTF-8
#export LOCALE=en_US.UTF-8
export BROWSER=chromium-browser
export OOO_FORCE_DESKTOP='gnome'
export EDITOR="emacsclient -c -a /usr/bin/emacs -nw"
export VISUAL="$EDITOR"
export HISTCONTROL=ignoredups
export IGNOREEOF=3
export AWT_TOOLKIT=MToolkit # for matlab
HOSTNAME=`hostname`

if [ "$HOSTNAME" = "firebird" ]; then
    arch="ia32"
    intel_version="11.1/069"
    intel_prefix="/opt/intel/Compiler/"
    export PATH=$PATH:/opt/maple10/bin:$HOME/local/Moves2/bin
    export MATLAB_JAVA=/usr/lib/jvm/java-1.6.0-openjdk/jre
    export CVSROOT=:pserver:hisch@localhost:/usr/local/cvsroot/quest.root
    export SESSA_DATABASE_PATH=$HOME/CVSrepos/Development/databases
    export CFFEM_MLCODE=/home/thomas/cf-fem-lib/matlab
elif [ "$HOSTNAME" = "mustang" ]; then
    arch="intel64"
    intel_version="11.1/046"
    intel_prefix="/opt/intel/Compiler/"
    export PATH=~/gitrepos/emacs/src:/usr/lib64/openmpi/bin:/usr/local/MATLAB/R2010b/bin:$PATH
    export MATLAB_JAVA=/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64/jre
    export CFFEM_MLCODE=/home/thomas/cf-fem-lib/matlab
    export CVSROOT=:pserver:hisch@localhost:/usr/local/cvsroot/quest.root
    export SESSA_DATABASE_PATH=/home/thomas/gitrepos/sessa-git/databases

    #parallel stuff
    export LD_LIBRARY_PATH=/usr/lib64/openmpi/lib:$LD_LIBRARY_PATH
elif [ "$HOSTNAME" = "thisch" ]; then
    #arch="intel64"
    intel_arch="intel64"
    intel_version=""
    intel_prefix="/home/thomas/intel"
    . ${intel_prefix}${intel_version}/bin/compilervars.sh ${intel_arch}

    export MATLAB_JAVA=/usr/lib/jvm/java-1.6.0-openjdk/jre
    export PATH=$PATH:$HOME/MATLAB/R2010b/bin
    export CFFEM_MLCODE=/home/thomas/cf-fem-lib/matlab
else
    arch=""
fi

#if [[ "$arch" = "ia32" ]] || [[ "$arch" = "intel64" ]]; then
if [ "$arch" != "" ]; then
    . ${intel_prefix}${intel_version}/bin/$arch/iccvars_$arch.sh
    . ${intel_prefix}${intel_version}/bin/$arch/ifortvars_$arch.sh
fi

# watch for people
watch=(notme)                   # watch for everybody but me
LOGCHECK=300                    # check every 5 min for login/logout activity

# Zenburn for the Linux console
if [ "$TERM" = "linux" ]; then
    #3f3f3f is problematic on a non-256color terminal
    echo -en "\e]P01e2320" #zen-black (norm. black)
    echo -en "\e]P8709080" #zen-bright-black (norm. darkgrey)
    echo -en "\e]P1705050" #zen-red (norm. darkred)
    echo -en "\e]P9dca3a3" #zen-bright-red (norm. red)
    echo -en "\e]P260b48a" #zen-green (norm. darkgreen)
    echo -en "\e]PAc3bf9f" #zen-bright-green (norm. green)
    echo -en "\e]P3dfaf8f" #zen-yellow (norm. brown)
    echo -en "\e]PBf0dfaf" #zen-bright-yellow (norm. yellow)
    echo -en "\e]P4506070" #zen-blue (norm. darkblue)
    echo -en "\e]PC94bff3" #zen-bright-blue (norm. blue)
    echo -en "\e]P5dc8cc3" #zen-purple (norm. darkmagenta)
    echo -en "\e]PDec93d3" #zen-bright-purple (norm. magenta)
    echo -en "\e]P68cd0d3" #zen-cyan (norm. darkcyan)
    echo -en "\e]PE93e0e3" #zen-bright-cyan (norm. cyan)
    echo -en "\e]P7dcdccc" #zen-white (norm. lightgrey)
    echo -en "\e]PFffffff" #zen-bright-white (norm. white)
    # avoid artefacts
    clear
fi
