#!/bin/bash

# This script was adapted from work by Keith James (keithj). The original source
# can be found as part of the wtsi-npg/data_handling project here:
#
#   https://github.com/wtsi-npg/data_handling

set -e -x

if [ $TRAVIS_BRANCH -eq "devel" ]; then
  if [ $TRAVIS_REPO_SLUG -eq "jmtcsngr/VVFT" ]; then
    pushd /tmp
      
    popd
  fi
fi

# WTSI NPG Perl repo dependencies
cd /tmp
git clone --branch devel --depth 1 https://github.com/wtsi-npg/ml_warehouse.git ml_warehouse.git
#git clone --branch devel --depth 1 https://github.com/wtsi-npg/npg_tracking.git npg_tracking.git
git clone --branch lims4composition --depth 1 https://github.com/mgcam/npg_tracking.git npg_tracking.git
git clone --branch devel --depth 1 https://github.com/wtsi-npg/npg_seq_common.git npg_seq_common.git

echo $TRAVIS_BRANCH
echo $TRAVIS_REPO_SLUG
