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
    '3.8.0 (Puppet Enterprise 3.8.0)':  { $uninstallver='PE/3.8.0' }
    '3.8.1 (Puppet Enterprise 3.8.1)':  { $uninstallver='PE/3.8.1' }
    '3.8.2 (Puppet Enterprise 3.8.2)':  { $uninstallver='PE/3.8.2' }
    default:                            { fail("Version $puppetversion is unsupported by this module") }
  }

  exec { 'create installer':
    command => "/bin/echo 'curl -k https://$new_master:8140/packages/current/install.bash | sudo bash' | at now + 2 minutes",
    require => File['/tmp/chrismatteson-cutover/cutover.sh',"/tmp/chrismatteson-cutover/$uninstallver"],
    cwd     => '/',
  }

  file { '/tmp/chrismatteson-cutover':
    ensure => directory,
  }

  file { '/tmp/chrismatteson-cutover/cutover.sh':
    ensure  => file,
    content => template('cutover/cutover.sh.erb'),
    require => File['/tmp/chrismatteson-cutover'],
  }

  file { "/tmp/chrismatteson-cutover/$uninstallver":
    ensure  => directory,
    recurse => true,
    source  => "puppet:///cutover/$uninstallver",
    require => File['/tmp/chrismatteson-cutover'],
  }

  exec { 'cutover':
    command  => '/bin/bash /tmp/chrismatteson-cutover/cutover.sh',
    require => Exec['create installer'],
  }
}

