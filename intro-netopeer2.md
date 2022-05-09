# Netopeer2

- [Netopeer2](#netopeer2)
  - [Setup](#setup)
    - [Installing Ubuntu on a VirtualBox](#installing-ubuntu-on-a-virtualbox)
    - [Qualcomm test environment](#qualcomm-test-environment)
    - [Installing the dependencies](#installing-the-dependencies)
      - [libssh](#libssh)
      - [installation directory](#installation-directory)
      - [libyang](#libyang)
      - [sysrepo](#sysrepo)
      - [libnetconf2](#libnetconf2)
      - [netopeer2](#netopeer2-1)
    - [Testing the build](#testing-the-build)
  - [NETCONF session](#netconf-session)
    - [Exchanging Initialization Tag Elements](#exchanging-initialization-tag-elements)
    - [Sending an Operational Request](#sending-an-operational-request)
    - [Locking the Configuration](#locking-the-configuration)
    - [Changing the Configuration](#changing-the-configuration)
    - [Committing the Configuration](#committing-the-configuration)
    - [Unlocking the Configuration](#unlocking-the-configuration)
    - [Closing the NETCONF session](#closing-the-netconf-session)
  - [Exercise: Oven plugin](#exercise-oven-plugin)
  - [Call home](#call-home)

## Setup

[Source](Qualcomm test environment.docx)

### Installing Ubuntu on a VirtualBox

We will install server software which is best run as root user to avoid access privilege issues. To avoid breaking our existing operating system installation, we recommend installing the test environment in a virtual machine. Instructions for installing Ubuntu on a virtual machine are given here: [How to run Ubuntu Desktop on a virtual machine using VirtualBox](https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#1-overview).

All commands given in this tutorial are to be executed in the terminal of the virtual machine.

For our purposes, it is enough to use “Minimal Install” and check the “Install third-party software” checkbox.

To upgrade the default packages:

```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoclean
sudo apt-get autoremove
```

### Qualcomm test environment

The QC test environment is effectively a Sysrepo ecosystem that consists of the following modules:

- **Netopeer2 CLI** - command-line NETCONF client that can be uses as a simple Network Management System (NMS)
- **Netopeer2 NETCONF server** - complement Sysrepo with the Netopeer2 NETCONF server to remotely manage applications via NETCONF
- **Sysrepoctl** - command line tool for changing YANG schemas of Sysrepo (installing, removing and updating schemas)
- **Sysrepocfg** - command line tool for stored YANG data management (importing, exporting and editing configuration that complies with an YANG schema)
- **Sysrepo-plugind** - simple daemon that groups all available Sysrepo plugins into a single process

### Installing the dependencies

Following binaries and development libraries need to be installed before we can start to install the Qualcomm test environment.

```
sudo apt-get install git cmake build-essential bison flex libpcre3-dev libev-dev libavl-dev libprotobuf-c-dev protobuf-c-compiler swig python-dev lua5.2 pkg-config libpcre++-dev openssl libssl-dev libcrypto++-dev zlib1g-dev libpcre2-dev libssh-dev uncrustify libcmocka-dev
```

#### libssh

Libnetconf2 requires the libssh version to be 0.9.6. Ubuntu 20.04 has version 0.9.3 installed whereas Ubuntu 21.10 has 0.9.6 version installed. We can check the installed libssh version with

```
sudo apt show libssh-4
```

If we have a version less than 0.9.6 installed we need to build and install the 0.9.6 version from the source code as instructed below. Otherwise we can skip the libshh installation step.

Installing libssh 0.9.6:

```
wget \
  https://git.libssh.org/projects/libssh.git/snapshot/libssh-0.9.6.tar.gz
tar -xf libssh-0.9.6.tar.gz
rm libssh-0.9.6.tar.gz
cd libssh-0.9.6
mkdir build
cd build
cmake ..
make
sudo make install
```

#### installation directory

Switch user to root to avoid access privilege issues when running the installed services

```
sudo -i
mkdir NetConfServer
cd NetConfServer
```

#### libyang

```
git clone https://github.com/CESNET/libyang.git
cd libyang
mkdir build
cd build
cmake ..
make && make install
```

#### sysrepo

```
cd ~/NetConfServer
git clone https://github.com/sysrepo/sysrepo.git
cd sysrepo
mkdir build
cd build
cmake ..
make && make install
```

#### libnetconf2

```
cd ~/NetConfServer
git clone https://github.com/CESNET/libnetconf2.git
cd libnetconf2
mkdir build
cd build
cmake ..
make && make install
```

#### netopeer2

```
cd ~/NetConfServer
ldconfig /usr/local/lib
git clone https://github.com/CESNET/netopeer2.git
cd netopeer2
mkdir build
cd build
cmake ..
make && make install
```

In case of dynamic link errors during make install netopeer2 add already installed libraries to LD_LIBRARY_PATH.

```
export LD_LIBRARY_PATH=”$LD_LIBRARY_PATH:/usr/local/lib”
```

Or update lib cache and dynamic links:

```
sudo ldconfig /usr/local/lib
```

In case of shared memory issues (this happens if you’re building libraries as a normal user), this was suggested as a workable solution (apparently it’s about some specific kernel configuration in Debian/Ubuntu, that changes behaviour of shared memory access permissions):

```
sudo sysctl fs.protected_regular=0
```

### Testing the build

## NETCONF session 

- [Source 1](https://www.juniper.net/documentation/us/en/software/junos/netconf/topics/task/netconf-session-sample.html)
- [Source 2](Qualcomm test environment.docx)

### Exchanging Initialization Tag Elements

### Sending an Operational Request

### Locking the Configuration

### Changing the Configuration

### Committing the Configuration

### Unlocking the Configuration

### Closing the NETCONF session

## Exercise: Oven plugin

[exercise-2.2-oven-plugin.md](exercise-2-oven-plugin.md)

## Call home

[Source](https://www.blog.adva.com/en/its-time-to-call-home)