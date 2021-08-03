# MIPS R5900 (PS2) Toolchain Docker Image

![License](https://img.shields.io/github/license/TobiX/mipsr5900el-toolchain)
![Maintenance](https://img.shields.io/maintenance/yes/2021)
[![Docker image](https://github.com/TobiX/mipsr5900el-toolchain/actions/workflows/deploy.yaml/badge.svg)](https://github.com/TobiX/mipsr5900el-toolchain/actions/workflows/deploy.yaml)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/tobix/mipsr5900el-toolchain/latest)

This docker image contains a precompiled `mipsr5900el-unknown-linux-gnu` for
building modern kernel & userspace for a Sony PlayStation 2. It is based on
a Gentoo stage 3 image and uses `crossdev` to build the toolchain.

It was already used to successfully build:

- https://github.com/frno7/linux
- https://github.com/frno7/iopmod
