class cutover (
  $new_master
) {

  case $::puppetversion {
    '3.8.1 (Puppet Enterprise 3.8.1)':  { $uninstallver='3.8.1' }
    '3.8.0 (Puppet Enterprise 3.8.0)':  { $uninstallver='3.8.0' }
    '2.7.12 (Puppet Enterprise 2.5.0)': { $uninstallver='2.5.0' }
    default:                            { fail("Version $puppetversion is unsupported by this module") }
  }

  exec { 'create installer':
    command => "/bin/echo 'curl -k https://$new_master:8140/packages/current/install.bash | sudo bash' | at now + 1 minutes",
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

