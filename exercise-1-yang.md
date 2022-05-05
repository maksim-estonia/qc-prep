# YANG

Source: 
    - [Youtube](https://www.youtube.com/watch?v=zy9QA-uU0u4)
    - [Blog](https://ultraconfig.com.au/blog/learn-yang-full-tutorial-for-beginners/)


### Install pyang dependencies
sudo apt-get install -y xsltproc libxml2-utils

### Clone the pyang repo
git clone https://github.com/mbj4668/pyang

### Install pyang
cd pyang
sudo python3 setup.py install

## Module

At the top of the file, we'll add a "module" statement followed by the name of our module and a braces block. The module name must match the name of our file.

The labels yang-version, namespace, organization, etc are known as "statements" in YANG terminology. Let's go over the function of each statement below.

- **yang-version** - identifies the YANG language specification that the module will conform to. We'll ensure our module conforms to YANG 1.1 which is defined in RFC 7950.
- **namespace** - this is an XML namespace that must be unique for the module. We used a URL but you can use a URN, URI or any other unique identifier here. The namespace specified here must match the namespace on any XML objects which conform to our YANG model.
- **prefix** - A short and unique string to identify our module. This prefix may be used in other YANG modules to import definitions contained in this one.
- **organization** - A string identifying the entity responsible for the module.
- **contact** - Contact details for the entity responsible for the module.
- **description** - A description of the module.
- **revision** - Used for version control. Each edit to a YANG module will add a new revision statement detailing the changes in sub-statements.

## Custom data type

## Container

Our "interfaces" container will hold the child nodes for our configuration data and state data.

```json
container interfaces {

}
```

Let's distinguish between these two data types below.

- **configuration data** - These are _read/write configuration fields_. For our interface example, this would be the interface name, IP address, subnet mask, and admin enabled/disabled. 
- **State data** - These are _read-only operational data fields_. For our interface example, this could include a packer counter and an operational state (physically up or down).

Again, remember that YANG modules will only define the structure of configuration and state data. It will not contain an instantiated value of the data.

### Configuration data

```json
list interface {
  key "name";
  leaf name {
    type string;
    mandatory "true";
    description
      "Interface name. Example value: GigabitEthernet 0/0/0";
  }
  leaf address {
    type dotted-quad;
    mandatory "true";
    description
      "Interface IP address. Example value: 10.10.10.1";
  }
  leaf subnet-mask {
    type dotted-quad;
    mandatory "true";
    description
      "Interface subnet mask. Example value: 255.255.255.0";
  }
  leaf enabled {
    type boolean;
    default "false";
    description
      "Enable or disable the interface. Example value: true";
  }
}
```

### State state

```json
list interface-state {
  config false;
  key "name";
  leaf name {
    type string;
    description
      "Interface name. Example value: GigabitEthernet 0/0/0";
  }
  leaf oper-status {
    type enumeration {
      enum up;
      enum down;
    }
    mandatory "true";
    description
      "Describes whether the interface is physically up or down";
  }
}
```

Looking at the state data you'll notice that one key difference is the "config" statement which is set to false. This indicates that the child nodes belonging to the list are read-only.

That concludes the construction of our YANG module for an instance. We may now proceed to interact with the module using pyang.



- To do basic validation

```bash
pyang ultraconfig-interfaces.yang
```

- view the schema tree of your YANG module

```bash
pyang -f tree ultraconfig-interfaces.yang
```

- generate the DSDL schemas of our YANG module and validate our data instance

```bash
yang2dsdl -v data.xml ultraconfig-interfaces.yang
```

References

- [YangModels/yang](https://github.com/YangModels/yang)
- [OpenConfig YANG Modules](https://github.com/openconfig/public)
- [pyang github](https://github.com/mbj4668/pyang)
  - [yang2dsdl](https://github.com/mbj4668/pyang/blob/master/bin/yang2dsdl)
- [json2xml](https://github.com/vinitkumar/json2xml)
- [yang-explorer](https://github.com/CiscoDevNet/yang-explorer)