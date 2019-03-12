#!/usr/bin

usage()
{
    echo "Usage: docker_build.sh [image_name]"
    echo "\timage_name is optional (default totvslabs/data_challenge)"
}

case $1 in
    -h | --help )           usage
                            exit 0
                            ;;
esac

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
echo "Unzipping the data"

unzip -u -d $SCRIPTDIR/data $SCRIPTDIR/data/challenge.zip

echo "Building the docker image with Dockerfile defined at $SCRIPTPATH"

if [ "$#" -ge 2 ]; then
    usage
fi

IMAGE_NAME=totvslabs/data_challenge
if [ "$#" -eq 1 ]; then
    IMAGE_NAME=$1
fi

echo docker build $SCRIPTPATH -t $IMAGE_NAME
docker build $SCRIPTPATH -t $IMAGE_NAME
