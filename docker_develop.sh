#!/usr/bin

usage()
{
    echo "Usage: docker_run_notebook.sh [image_name]\n\tthe image_name is optional (default totvslabs/data_challenge)"
}

case $1 in
    -h | --help )           usage
                            exit 0
                            ;;
esac

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

if [ "$#" -ge 2 ]; then
    usage
    exit 0
fi

echo "Running the docker image $SCRIPTPATH to execute the notebook"

IMAGE_NAME=totvslabs/data_challenge
if [ "$#" -eq 1 ]; then
    IMAGE_NAME=$1
fi

docker run -v $SCRIPTPATH:/home/jovyan/ -p 8890:8888 --entrypoint "/opt/conda/bin/jupyter" -ti $IMAGE_NAME notebook