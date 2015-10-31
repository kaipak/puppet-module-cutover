class cutover (
  $new_master
) {
  case $::puppetversion {
    '2.7.6 (Puppet Enterprise 2.0.0)':  { $uninstallver='PE/2.0.0' }
    '2.7.9 (Puppet Enterprise 2.0.1)':  { $uninstallver='PE/2.0.1' }
    '2.7.9 (Puppet Enterprise 2.0.2)':  { $uninstallver='PE/2.0.2' }
    '2.7.9 (Puppet Enterprise 2.0.3)':  { $uninstallver='PE/2.0.3' }
    '2.7.12 (Puppet Enterprise 2.5.0)': { $uninstallver='PE/2.5.0' }
    '2.7.12 (Puppet Enterprise 2.5.1)': { $uninstallver='PE/2.5.1' }
    '2.7.12 (Puppet Enterprise 2.5.2)': { $uninstallver='PE/2.5.2' }
    '2.7.12 (Puppet Enterprise 2.5.3)': { $uninstallver='PE/2.5.3' }
    '2.7.19 (Puppet Enterprise 2.6.0)': { $uninstallver='PE/2.6.0' }
    '2.7.19 (Puppet Enterprise 2.7.0)': { $uninstallver='PE/2.7.0' }
    '2.7.19 (Puppet Enterprise 2.7.1)': { $uninstallver='PE/2.7.1' }
    '2.7.19 (Puppet Enterprise 2.7.2)': { $uninstallver='PE/2.7.2' }
    '2.7.21 (Puppet Enterprise 2.8.0)': { $uninstallver='PE/2.8.0' }
    '2.7.21 (Puppet Enterprise 2.8.1)': { $uninstallver='PE/2.8.1' }
    '2.7.21 (Puppet Enterprise 2.8.2)': { $uninstallver='PE/2.8.2' }
    '2.7.23 (Puppet Enterprise 2.8.3)': { $uninstallver='PE/2.8.3' }
    '2.7.23 (Puppet Enterprise 2.8.4)': { $uninstallver='PE/2.8.4' }
    '2.7.25 (Puppet Enterprise 2.8.5)': { $uninstallver='PE/2.8.5' }
    '2.7.25 (Puppet Enterprise 2.8.6)': { $uninstallver='PE/2.8.6' }
    '2.7.26 (Puppet Enterprise 2.8.7)': { $uninstallver='PE/2.8.7' }
    '2.7.26 (Puppet Enterprise 2.8.8)': { $uninstallver='PE/2.8.8' }
    '3.2.2 (Puppet Enterprise 3.0.0)':  { $uninstallver='PE/3.0.0' }
    '3.2.4 (Puppet Enterprise 3.0.1)':  { $uninstallver='PE/3.0.1' }
    '3.3.1 (Puppet Enterprise 3.1.0)':  { $uninstallver='PE/3.1.0' }
    '3.3.3 (Puppet Enterprise 3.1.1)':  { $uninstallver='PE/3.1.1' }
    '3.3.3 (Puppet Enterprise 3.1.2)':  { $uninstallver='PE/3.1.2' }
    '3.3.3 (Puppet Enterprise 3.1.3)':  { $uninstallver='PE/3.1.3' }
    '3.4.3 (Puppet Enterprise 3.2.0)':  { $uninstallver='PE/3.2.0' }
    '3.4.3 (Puppet Enterprise 3.2.1)':  { $uninstallver='PE/3.2.1' }
    '3.4.3 (Puppet Enterprise 3.2.2)':  { $uninstallver='PE/3.2.2' }
    '3.4.3 (Puppet Enterprise 3.2.3)':  { $uninstallver='PE/3.2.3' }
    '3.6.2 (Puppet Enterprise 3.3.0)':  { $uninstallver='PE/3.3.0' }
    '3.6.2 (Puppet Enterprise 3.3.1)':  { $uninstallver='PE/3.3.1' }
    '3.6.2 (Puppet Enterprise 3.3.2)':  { $uninstallver='PE/3.3.2' }
    '3.7.0 (Puppet Enterprise 3.7.0)':  { $uninstallver='PE/3.7.0' }
    '3.7.2 (Puppet Enterprise 3.7.1)':  { $uninstallver='PE/3.7.1' }
    '3.7.2 (Puppet Enterprise 3.7.2)':  { $uninstallver='PE/3.7.2' }
    '3.7.4 (Puppet Enterprise 3.7.2)':  { $uninstallver='PE/3.7.2' }
    '3.8.0 (Puppet Enterprise 3.8.0)':  { $uninstallver='PE/3.8.0' }
    '3.8.1 (Puppet Enterprise 3.8.1)':  { $uninstallver='PE/3.8.1' }
    '3.8.2 (Puppet Enterprise 3.8.2)':  { $uninstallver='PE/3.8.2' }
    '2.6.9':                            { $uninstallver='poss' }
    '2.6.10':                           { $uninstallver='poss' }
    '2.6.11':                           { $uninstallver='poss' }
    '2.6.12':                           { $uninstallver='poss' }
    '2.6.14':                           { $uninstallver='poss' }
    '2.6.15':                           { $uninstallver='poss' }
    '2.6.16':                           { $uninstallver='poss' }
    '2.6.17':                           { $uninstallver='poss' }
    '2.6.18':                           { $uninstallver='poss' }
    '2.7.1':                            { $uninstallver='poss' }
    '2.7.3':                            { $uninstallver='poss' }
    '2.7.4':                            { $uninstallver='poss' }
    '2.7.5':                            { $uninstallver='poss' }
    '2.7.6':                            { $uninstallver='poss' }
    '2.7.8':                            { $uninstallver='poss' }
    '2.7.9':                            { $uninstallver='poss' }
    '2.7.10':                           { $uninstallver='poss' }
    '2.7.11':                           { $uninstallver='poss' }
    '2.7.12':                           { $uninstallver='poss' }
    '2.7.13':                           { $uninstallver='poss' }
    '2.7.14':                           { $uninstallver='poss' }
    '2.7.16':                           { $uninstallver='poss' }
    '2.7.17':                           { $uninstallver='poss' }
    '2.7.18':                           { $uninstallver='poss' }
    '2.7.19':                           { $uninstallver='poss' }
    '2.7.20':                           { $uninstallver='poss' }
    '2.7.21':                           { $uninstallver='poss' }
    '2.7.22':                           { $uninstallver='poss' }
    '2.7.23':                           { $uninstallver='poss' }
    '2.7.24':                           { $uninstallver='poss' }
    '2.7.25':                           { $uninstallver='poss' }
    '2.7.26':                           { $uninstallver='poss' }
    '3.0.0':                            { $uninstallver='poss' }
    '3.0.1':                            { $uninstallver='poss' }
    '3.0.2':                            { $uninstallver='poss' }
    '3.1.0':                            { $uninstallver='poss' }
    '3.1.1':                            { $uninstallver='poss' }
    '3.2.1':                            { $uninstallver='poss' }
    '3.2.2':                            { $uninstallver='poss' }
    '3.2.3':                            { $uninstallver='poss' }
    '3.2.4':                            { $uninstallver='poss' }
    '3.3.0':                            { $uninstallver='poss' }
    '3.3.1':                            { $uninstallver='poss' }
    '3.3.2':                            { $uninstallver='poss' }
    '3.4.0':                            { $uninstallver='poss' }
    '3.4.1':                            { $uninstallver='poss' }
    '3.4.2':                            { $uninstallver='poss' }
    '3.4.3':                            { $uninstallver='poss' }
    '3.5.1':                            { $uninstallver='poss' }
    '3.6.0':                            { $uninstallver='poss' }
    '3.6.1':                            { $uninstallver='poss' }
    '3.6.2':                            { $uninstallver='poss' }
    '3.7.0':                            { $uninstallver='poss' }
    '3.7.1':                            { $uninstallver='poss' }
    '3.7.2':                            { $uninstallver='poss' }
    '3.7.3':                            { $uninstallver='poss' }
    '3.7.4':                            { $uninstallver='poss' }
    '3.7.5':                            { $uninstallver='poss' }
    '3.8.1':                            { $uninstallver='poss' }
    '3.8.2':                            { $uninstallver='poss' }
    default:                            { fail("Version ${::puppetversion} is unsupported by this module") }
  }

#  exec { 'create installer':
#    command => "/bin/echo 'curl -k https://${new_master}:8140/packages/current/install.bash | sudo bash' | at now", # + 2 minutes",
#    cwd     => '/',
#  }

  if $uninstallver == 'poss' {
    package { ['facter','hiera']:
      ensure => 'absent',
      require => Package['puppet'],
    }
    package { ['puppet']:
      ensure  => 'absent',
    }
  }
  else {

    file { ['/tmp/chrismatteson-cutover','/tmp/chrismatteson-cutover/PE']:
      ensure => directory,
    }

    file { "/tmp/chrismatteson-cutover/${uninstallver}":
      ensure  => directory,
      recurse => true,
      source  => "puppet:///modules/cutover/${uninstallver}",
      require => File['/tmp/chrismatteson-cutover/PE'],
    }

    file { '/tmp/chrismatteson-cutover/cutover.sh':
      ensure  => file,
      content => template('cutover/cutover.sh.erb'),
      require => File['/tmp/chrismatteson-cutover'],
    }
    
    $puppetdirs = [ '/opt/puppet/', '/opt/puppet/share', '/opt/puppet/share/installer' ]

    file { $puppetdirs:
      ensure => directory,
    }
    
    file {'/opt/puppet/share/installer/utilities':
      ensure => file,
      source => "puppet:///modules/cutover/utilities",
      mode   => '0770',
      # before => Exec['cutover'],
    }

    if $puppetversion != "3.8.2 (Puppet Enterprise 3.8.2)" {
      exec { 'cutover':
        command => '/bin/bash /tmp/chrismatteson-cutover/cutover.sh',
        require => File['/tmp/chrismatteson-cutover/cutover.sh'],
        before => Exec['create installer'],
      }
      exec { 'create installer':
        command => "/usr/bin/curl -k https://${new_master}:8140/packages/current/install.bash | sudo bash",
        cwd     => '/',
      }
    }
  }
}

