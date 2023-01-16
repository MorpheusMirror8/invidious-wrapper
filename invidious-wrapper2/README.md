# Wrapper for Invidous

Invidious is an open-source alternative to YouTube. It aims to provide a faster, more privacy-respecting, and ad-free way to browse and watch videos from the site. It also includes features like a dark mode and the ability to play videos in the background. Invidious can be run on a user's own server or accessed through instances run by others.

## Dependencies

- [docker](https://docs.docker.com/get-docker)
- [docker-buildx](https://docs.docker.com/buildx/working-with-buildx/)
- [yq](https://mikefarah.gitbook.io/yq)
- [toml](https://crates.io/crates/toml-cli)
- [make](https://www.gnu.org/software/make)
- [embassy-sdk]

## Cloning

Clone the project locally. Note the submodule link to the original project(s). 

```
git clone https://github.com/Start9Labs/invidiouswrapper.git
cd invidious-wrapper
git submodule update --init --recursive
docker run --privileged --rm tonistiigi/binfmt --install arm64,riscv64,arm
```

## Building

To build the project, run the following commands:

```
make
```

## Installing (on Embassy)

SSH into an Embassy device.
`scp` the `.s9pk` to any directory from your local machine.

```
scp mempool.s9pk root@<LAN ID>:/tmp
```

Run the following command to determine successful install:

```
embassy-cli auth login
embassy-cli package install /tmp/mempool.s9pk
```
