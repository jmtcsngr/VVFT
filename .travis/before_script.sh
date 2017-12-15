#!/bin/bash

# This script was adapted from work by Keith James (keithj). The original source
# can be found as part of the wtsi-npg/data_handling project here:
#
#   https://github.com/wtsi-npg/data_handling

set -e -x

if [ $TRAVIS_REPO_SLUG -eq "jmtcsngr/VVFT" ]; then
  if [ $TRAVIS_BRANCH -eq "devel" ] || [$TRAVIS_BRANCH -eq "master"]; then
    pushd /tmp
    for project in "ml_warehouse" "npg_tracking"
    do
      pushd $project
      branch_name = $(git rev-parse --abbrev-ref HEAD)
      if [ $branch_name -ne $TRAVIS_BRANCH ]; then
        return 1;
      fi

    done
    popd
  fi
fi

# WTSI NPG Perl repo dependencies
cd /tmp
git clone --branch devel --depth 1 https://github.com/wtsi-npg/ml_warehouse.git ml_warehouse.git
#git clone --branch devel --depth 1 https://github.com/wtsi-npg/npg_tracking.git npg_tracking.git
git clone --branch lims4composition --depth 1 https://github.com/mgcam/npg_tracking.git npg_tracking.git
git clone --branch devel --depth 1 https://github.com/wtsi-npg/npg_seq_common.git npg_seq_common.git

