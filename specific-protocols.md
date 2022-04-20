# Specific protocols

- [Specific protocols](#specific-protocols)
  - [Open RAN explained (Nokia)](#open-ran-explained-nokia)
    - [Advantages of Open RAN](#advantages-of-open-ran)
    - [CloudRAN (vRAN - Virtualized Radio Access Network)](#cloudran-vran---virtualized-radio-access-network)
  - [Open RAN (Ericsson)](#open-ran-ericsson)
  - [Network Management System (pdf)](#network-management-system-pdf)
    - [Network Management Requirements](#network-management-requirements)
    - [Network Management Systems](#network-management-systems)
  - [NETCONF](#netconf)
    - [Operations](#operations)
    - [Messages](#messages)
    - [Transport](#transport)
  - [Netopeer2 - NETCONF Server](#netopeer2---netconf-server)
  - [libnetconf2](#libnetconf2)
    - [Main Features](#main-features)
  - [libyang](#libyang)
  - [sysrepo](#sysrepo)
    - [Main features](#main-features-1)

## Open RAN explained (Nokia)

RAN: Radio Access Network

In an Open RAN environment, the RAN is disaggregated into three main building blocks:

- the Radio Unit (RU)
- the Distributed Unit (DU)
- the Centralised Unit (CU)

The key concept of Open RAN is "opening" the protocols and interfaces between these various building blocks (radios, hardware, and software) in the RAN. The O-RAN alliance has defined different interfaces within the RAN including those for:

- fronthaul between the Radio Unit and the Distributed Unit
- midhaul between the Distributed Unit and the Centralised Unit

Another feature of Open RAN is the RAN Intelligent Controller (RIC) which adds programmability to the RAN.

### Advantages of Open RAN

More innovation and more options for the Operators. They can also add new services. For example, Artificial Intelligence can be introduced via the RIC to optimize the network in the vicinity of a football stadium on a match day.

### CloudRAN (vRAN - Virtualized Radio Access Network)

Whilst virtualization of the RAN is not the same as Open RAN, it can be deployed in conjunction and makes the RAN much more flexible. What was done in hardware can now be done in software which reduced barriers into the market. The DU and CU are effectively computers running software. Instead of using custom hardware, they can now be virtualized and run on any Cloud Server, as long as it is near the base station to reduce latency. 

## Open RAN (Ericsson)

Key elements of Open RAN:

- Cloudification
  - Hardware and software disaggregation
  - RAN applications as cloud-native functions
- Intelligence and automation
  - Open management and orchestration
  - RAN automation interfaces
  - Use external Arteficial Intelligence and Machine Learning capabilities
- Open internal RAN interfaces
  - Interfaces defined 3GPP:
    - Higher layer split
    - Inter-node communication
  - New internal interfaces:
    - O-RAN lower layer split
    - Near-Real Time RIC

## Network Management System (pdf)

[Link](https://www.usi.edu/business/aforough/Chapter%2020.pdf)

- Network Management Requirements
  - Fault management
  - Accounting management
  - Configuration and Name management
  - Performance management
  - Security management
- Network Management Systems
  - Architecture of a Network Management System

### Network Management Requirements

- Fault management: The facilities that enable the detection, isolation, and correction of abnormal operation of the OSI environment.
- Accounting management: The facilities that enable charges to be established for the use of managed objects and costs to be identified for the use of those managed objects.
- Configuration and name management: The facilities that exercise control over, identify, collect data from, and provide data to managed objects for the purpose of assisting in providing for continuous operation of interconnection services. 
- Performance management: The facilities needed to evaluate the behavior of managed objects and the effectiveness of communication activities. 
- Security management: Those aspects of OSI security essential to operate OSI network management correctly and to protect managed objects. 

### Network Management Systems

A network management system is a collection of tools for network monitoring and control that is integrated in the following senses:

- A single operator interface with a powerful but user-friendly set of commands for performing most or all network management tasks.
- A minimal amount of seperate equipment. That is, most of the hardware and software required for network management is incorporated into the existing user equipment.

At least one host in the network is designated as the network control host, or **manager**. In addition to the NME software, the network control host includes a collection of software called the network management application (NMA). The NMA includes an operator interface to allow an authorized used to manage the network. The NMA responds to user commands by displaying information and/or issuing commands to NMEs (Network Management Entity) throughout the network. 

Each other node in the network that is part of the network management system includes an NME and, for purposes of network management, is referred to as an **agent**. Agents include end systems that support user applications as well as nodes that provide a communication service, such as front-end processors, cluster controllers, bridges and routers.

## NETCONF

[Link](https://en.wikipedia.org/wiki/NETCONF)

NETCONF provides mechanisms to install, manipulate, and delete the configuration of network devices. Its operations are realized on top of a simple Remote Procedure Call (RPC) layer. The NETCONF protocol uses an Extensible Markup Language (XML) based data encoding for the configuration data as well as the protocol messages. The protocol messages are exchanged on top of a secure transport protocol.

The NETCONF protocol can be conceptually partitioned into four layers:

1. The **Content** layer consists of configuration data and notification data.
2. The **Operation** layer defines a set of base protocol operations to retrieve and edit the configuration data.
3. The **Messages** layer provides a mechanism for encoding remote procedure calls (RPCs) and notifications.
4. The **Secure Transport** layer provides a secure and reliable transport of messages between a client and server.

The NETCONF protocol has been implemented in network devices such as routers and switches by some major equipment vendors. One particular strength of NETCONF is its support for robust configuration change using transactions involving a number of devices.

The content of NETCONF operations is well-formed XML. Most content is related to network management. Subsequently, support for encoding in JavaScript Object Notation (JSON) was also added.

The NETMOD working group has completed work to define a "human-friendly" modeling language for defining semantics of operational data, configuration data, notifications, and operations, called YANG.

### Operations

The base protocol defines the following protocol operations:


Operation | Description 
---------|----------
 `<get>` | Retrieve running configuration and device state information 
 `<get-config>` | Retrieve all or part of a specified configuration datastore 
 `<edit-config>` |  
 `<copy-config>` |  
 `<delete-config>` |  
 `<lock>` |  
 `<unlock>` |  
 `<close-session>` |  
 `<kill-session>` | 

### Messages

The NETCONF messages layer provides a simple, transport-independent framing mechanism for encoding

- RPC invocations (`<rpc>` messages)
- RPC results (`<rpc-reply>` messages)
- event notifications (`<notification>` messages)

### Transport

- NETCONF Protocol over Secure Shell (SHH)
- NETCONF Protocol over Transport Layer Security (TLS)

## Netopeer2 - NETCONF Server

Netopeer2 is a server for implementing network configuration management based on the NETCONF protocol. Netopeer2 is based on the new generation of the NETCONF and YANG libraries - libyang and libnetconf2. The Netopeer2 server uses sysrepo as a NETCONF datastore implementation.

## libnetconf2

[Link](https://netopeer.liberouter.org/doc/libnetconf2/master/html/)

libnetconf2 is a NETCONF library in C handling NETCONF authentication and all NETCONF RPC communication both server and client-side. 

### Main Features

- Creating SSH, using libssh; or TLS, using OpenSSL
- Creating NETCONF sessions with a pre-established transport protocol
- Creating NETCONF Call Home sessions
- Creating, sending, receiving, and replying to RPCs
- Creating, sending and receiving NETCONF event notifications

## libyang

libyang is a library implementing processing of the YANG schemas and data modeled by the YANG language. The library is implemented in C for GNU/Linux and provides C API.

YANG (Yet Another Next Generation) is a data modeling language for the definition of data sent over network management protocols such as the NETCONF and RESTCONF.

## sysrepo

[Link](https://netopeer.liberouter.org/doc/sysrepo/master/html/)

Sysrepo is a YANG-based datastore for Unix/Linux systems. Applications that have their configuration modelled using YANG can use Sysrepo for its management.

### Main features

Main Sysrepo features are manipulation with YANG data and subscribing to various events. However, before any operation can be performed, a connection and session needs to be created and all the supported YANG schemas installed. Sysrepo can also keep records of its behaviour if logging is configured. Finally, despite being only a library, there are a few auxiliary utilities that use the API in some common ways.

