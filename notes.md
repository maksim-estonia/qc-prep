# Notes

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
