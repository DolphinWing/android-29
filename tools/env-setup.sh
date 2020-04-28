#!/bin/bash

CPATH=/opt/tools #`pwd`

cp $CPATH/vimrc.txt ~/.vimrc
cp $CPATH/inputrc.txt ~/.inputrc
cat $CPATH/docker.prompt >> /root/.bashrc
