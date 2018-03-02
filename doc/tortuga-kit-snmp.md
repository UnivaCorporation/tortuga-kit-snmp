## SNMP Kit

### Overview

The SNMP kit allows for automated installation and configuration of the SNMP daemon `snmpd` on software profiles on which the component is enabled.

SNMP functionality is provided by the `net-snmp` package.

### Installing the SNMP Kit

Install the SNMP kit using the `install-kit` command-line interface:

    install-kit kit-snmp-6.3.1-0.tar.bz2

This installs the component `snmpd-6.3`, which can be enabled on any software profile.

For example, to enable on the **Compute** software profile:

    enable-component --software-profile Compute snmp-6.3.1-0 snmpd-6.3
    schedule-update

Once complete, any existing nodes in the Compute software profile will have `snmpd` enabled and running.

### Customizing `/etc/snmp/snmpd.conf`

With the SNMP kit enabled, the `snmpd.conf` configuration file is managed by Tortuga.

Any changes should be applied to the configuration file template found in:

    /etc/puppetlabs/code/environments/production/modules/tortuga_kit_snmp/templates/snmpd.conf.erb

Consult the [Net-SNMP](http://www.net-snmp.org) documentation for further information.

\newpage


