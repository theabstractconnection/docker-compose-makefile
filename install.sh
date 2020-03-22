#!/bin/bash
TRANSPORT=${TRANSPORT:-ssh}
D_MK_INSTALL_TYPE=${D_MK_INSTALL_TYPE:-install}

case $TRANSPORT in
 ssh)   GIT_URL="git@github.com:theabstractconnection/docker-compose_makefile.git" ;;
 http)  GIT_URL="https://github.com/theabstractconnection/docker-compose_makefile.git" ;;
 https) GIT_URL="https://github.com/theabstractconnection/docker-compose_makefile.git" ;;
esac

echo ""
echo "TRANSPORT    : $TRANSPORT"
echo "GIT_URL      :  $GIT_URL"
echo "D_MK_INSTALL_TYPE :  $D_MK_INSTALL_TYPE"
echo ""

echo "☠☠☠ CLONING REPOSITORY"
git clone $GIT_URL

case $D_MK_INSTALL_TYPE in
 install) 
  echo "☠☠☠ COPYING FILES"
  cp ./docker-compose_makefile/docker-compose.yml .
  cp ./docker-compose_makefile/Dockerfile .
  cp ./docker-compose_makefile/Makefile .
  cp ./docker-compose_makefile/Makefile_scripts.sh .
  cp ./docker-compose_makefile/post-install.sh .
  cp ./docker-compose_makefile/LICENSE . ;;
 update)
  echo "☠☠☠ UPDATING FILES"
  yes | cp cp -f ./docker-compose_makefile/Makefile .
  yes | cp cp -f ./docker-compose_makefile/Makefile_scripts.sh .
esac

echo "☠☠☠ DELETING REPOSITORY"
rm -rf docker-compose_makefile

# USAGE
# curl -H "Cache-Control: no-cache" https://raw.githubusercontent.com/theabstractconnection/docker-compose_makefile/master/install.sh | bash