class cutover (
  $new_master
) {

  case $puppetversion {
    '3.8.1 (Puppet Enterprise 3.8.1)':  { $uninstallver=3.8.1 }
    '3.8.0 (Puppet Enterprise 3.8.0)':  { $uninstallver=3.8.0 }
    '2.7.12 (Puppet Enterprise 2.5.0)': { $uninstallver=2.5.0 }
    default:                            { fail='Version Unknown' }
  }
}
