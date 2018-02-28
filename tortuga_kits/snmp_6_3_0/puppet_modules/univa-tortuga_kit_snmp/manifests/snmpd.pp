# Copyright 2008-2018 Univa Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


class tortuga_kit_snmp::snmpd::package {
  require tortuga::packages

  $pkgs = [
    'net-snmp-utils',
    'net-snmp',
    'net-snmp-libs',
  ]

  ensure_resource('package', $pkgs, {'ensure' => 'installed'})
}

class tortuga_kit_snmp::snmpd::config {
  require tortuga_kit_snmp::snmpd::package

  $prov_networks = get_nfs_exports()

  file { '/etc/snmp/snmpd.conf':
    content => template('tortuga_kit_snmp/snmpd.conf.erb'),
  }
}

class tortuga_kit_snmp::snmpd::service {
  require tortuga_kit_snmp::snmpd::config

  service { 'snmpd':
    ensure => running,
    enable => true,
  }
}

class tortuga_kit_snmp::snmpd {
  contain tortuga_kit_snmp::snmpd::package
  contain tortuga_kit_snmp::snmpd::config
  contain tortuga_kit_snmp::snmpd::service

  Class['tortuga_kit_snmp::snmpd::config'] ~>
    Class['tortuga_kit_snmp::snmpd::service']
}
