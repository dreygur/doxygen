#!/bin/sh

set -xe

if [ ! -d $2 ]; then
  echo "Path $2 could not be found!"
  exit 1
fi

cd $2

if [ ! -f $1 ]; then
  echo "File $1 could not be found!"
  exit 1
fi

if [ ! -z $3 ] && $3; then
  grep -q GENERATE_LATEX\\s\*=\\s\*YES $1 && BUILD_LATEX=true || BUILD_LATEX=false
  LATEX_DIR="./$(sed -n -e 's/^OUTPUT_DIRECTORY\s*=\s*//p' $1)/$(sed -n -e 's/^LATEX_OUTPUT\s*=\s*//p' $1)"
else
  BUILD_LATEX=0
fi

PACKAGES="doxygen graphviz ttf-freefont $4"
if [ "$BUILD_LATEX" = true ] ; then
  PACKAGES="$PACKAGES perl build-base texlive-full biblatex ghostscript"
fi

sudo apt-get install $PACKAGES -y

doxygen $1

if [ "$BUILD_LATEX" = true ] ; then
  cd $LATEX_DIR
  make
fi