<?xml version="1.0" encoding="utf-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="exslt"><sch:ns uri="http://exslt.org/dynamic" prefix="dyn"/><sch:ns uri="http://ultraconfig.com.au/ns/yang/ultraconfig-interfaces" prefix="if"/><sch:ns uri="urn:ietf:params:xml:ns:netconf:base:1.0" prefix="nc"/><sch:let name="root" value="/nc:data"/><sch:pattern id="ultraconfig-interfaces"><sch:rule context="/nc:data/if:interfaces/if:interface"><sch:report test="preceding-sibling::if:interface[if:name=current()/if:name]">Duplicate key "if:name"</sch:report></sch:rule><sch:rule context="/nc:data/if:interfaces/if:interface-state"><sch:report test="preceding-sibling::if:interface-state[if:name=current()/if:name]">Duplicate key "if:name"</sch:report></sch:rule></sch:pattern></sch:schema>
