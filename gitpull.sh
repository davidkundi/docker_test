#!/bin/sh

REPOSRC=https://github.com/davidkundi/webapp
LOCALREPO=/home/kundi/webapp

LOCALREPO_VC_DIR=$LOCALREPO/.git

if [ ! -d $LOCALREPO_VC_DIR ]
then
    git clone $REPOSRC $LOCALREPO
else
    cd $LOCALREPO
    git pull $REPOSRC
fi

# End
