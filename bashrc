# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions
source ~/.zsh/alias

export LANG="C"
export LC_ALL="C"

export MYSRCDIR=$HOME/local/src
export LOCSOFT=$HOME/local/software

export NETGENDIR=$LOCSOFT/bin
export NETGENSRCDIR=$MYSRCDIR/netgen-4.9.13
export CFFEMREPO=$HOME/gitrepos/cf-fem-lib
export CFFEMBUILDDIR=$CFFEMREPO/build
export CFBD=$CFFEMBUILDDIR

export RANDPATH=$HOME/gitrepos/randomlas

#python distribution
export EPDPATH=$LOCSOFT/epd-7.2-1-rh5-x86_64/bin

#MPI stuff
#TODO use appropriate includes set by mpi-selector
export MYMPI_INC_PATH=/usr/mpi/qlogic/include
export MYMPI_LIB_PATH=/usr/mpi/qlogic/lib64

export BOOST_SRC_PATH=$MYSRCDIR/boost_1_47_0

export PETSC_DIR=${MYSRCDIR}/petsc-3.2-p6
#export PETSC_ARCH="arch-linux2-cxx-debug"
export PETSC_ARCH=intel-cxx-complex_debug
export SLEPC_DIR=${MYSRCDIR}/slepc-3.2-p3

export PATH=$RANDPATH:$CFFEMBUILDDIR/src:$EPDPATH:$NETGENDIR:$PATH
export PYTHONPATH=${CFFEMREPO}/tools/in2d_creator_scripts:${PYTHONPATH}
export LD_LIBRARY_PATH=$LOCSOFT/lib/:$LOCSOFT/lib/Togl1.7:$LD_LIBRARY_PATH

#for the xml_pp program
#export PERLLIB=/home/lv70072/thisch/bin/

function initcfbuild {
    LANG=C CC=mpicc CXX=mpicxx  cmake -DBOOST_ROOT=$BOOST_SRC_PATH \
        -DCMAKE_CXX_FLAGS="-I$MYSRCDIR" -DCMAKE_EXE_LINKER_FLAGS="-shared-intel" \
        -DCMAKE_BUILD_TYPE=Release -DNETGEN_SOURCE_DIR=$NETGENSRCDIR \
        -DENABLE_MPI=ON \
        -DMPI_INCLUDE_PATH=$MYMPI_INC_PATH -DMPI_LIBRARY=$MYMPI_LIB_PATH \
        -DCMAKE_INSTALL_PREFIX=$LOCSOFT ..
    make -j8
}

function initnonmpicfbuild {
    LANG=C cmake -DBOOST_ROOT=$BOOST_SRC_PATH \
        -DCMAKE_CXX_FLAGS="-I$MYSRCDIR" \
        -DCMAKE_BUILD_TYPE=Release -DNETGEN_SOURCE_DIR=$NETGENSRCDIR \
        -DCMAKE_INSTALL_PREFIX=$LOCSOFT ..
}

function buildpetsc {
   # ./configure --with-scalar-type=complex --with-boost-dir=$BOOST_SRC_PATH --with-X11=0
   # ./configure --with-c++-support=1   --with-scalar-type=complex  --with-x11=0 \
   #     --with-c-support=1 --with-blas-lapack-dir=/opt/intel/Compiler/11.1/046/mkl/lib \
   #     CXXOPTFLAGS="-O3 -xHOST" COPTFLAGS="-O3 -xHOST" FOPTFLAGS="-03 -xHOST"

   #new shared library stuff

    echo number of args $#

    if [ "$1" == "DEBUG" ]; then
        extraflags="PETSC_ARCH=intel-cxx-complex_debug --with-debugging=1";
    else
        extraflags="PETSC_ARCH=intel-cxx-complex --with-debugging=0";
    fi
    echo $extraflags
    # return -1

    cd $PETSC_DIR
    ./configure --with-c++-support=1 --with-scalar-type=complex --with-x11=0 \
        --with-clanguage=cxx --with-blas-lapack-dir=/opt/intel/Compiler/11.1/046/mkl/lib \
        CXXOPTFLAGS="-O3" COPTFLAGS="-O3" FOPTFLAGS="-03" \
        --with-shared-libraries=1 ${extraflags}
        # CXXOPTFLAGS="-O3 -xHost" COPTFLAGS="-O3 -xHost" FOPTFLAGS="-03 -xHost" \

    #todo 'PETSC_ARCH=intel-cxx-complex_debug' --with-debugging=1
    #todo 'PETSC_ARCH=intel-cxx-complex' --with-debugging=0

    #todo play with:
    #'--download-parmetis=yes',
    #'--download-plapack=yes',
    #'--download-superlu_dist=yes',
    #'--download-mumps=yes',
    #'--download-spooles=yes',
    #'--with-fortran-kernels=1',
    #'--download-blacs=ifneeded',
    #'--download-scalapack=ifneeded',
}

function buildslepc {
    cd $SLEPC_DIR
    ./configure
}

function  makecfmpi {
    cd $CFBD; make -j8 pertubation; cd -
}

function makecfmpiall {
    cd $CFBD; make -j8 ; cd -
}

# function makecfmpi {
#     cd $CFBD; make -j8 pertubation; cd -
# }

alias gs='git status'
alias gd='git diff'
#alias python='python2.6'
#alias e='emacs -nw'
alias e='emacsclient -nw -a /usr/bin/emacs'
alias vim='emacsclient -nw -a /usr/bin/emacs'
alias started=${HOME}/gitrepos/dotfiles/emacs.d/start-emacs-server.sh
alias ked="e -e '(kill-emacs)'"
