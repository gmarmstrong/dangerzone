# Build the Dangerzone VM for running podman

Thanks, [alpine-make-vm-image](https://github.com/alpinelinux/alpine-make-vm-image) project. License: MIT

To build the VM image:

```sh
docker run \
    --privileged --cap-add=ALL \
    -v $(pwd):/build ubuntu:latest /build/build.sh
```

This will create a VM image file called `dangerzone.qcow2`.