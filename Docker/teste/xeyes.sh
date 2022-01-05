docker run --rm -it \
    --net host \
    -e DISPLAY=$DISPLAY \
    -v $HOME/.Xauthority:/root/.Xauthority \
    xeyes-ubuntu
