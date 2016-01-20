# This is a wrapper class to include all the bits needed for Practitioner
#
class classroom::course::practitioner (
  $offline   = $classroom::params::offline,
  $manageyum = $classroom::params::manageyum,
) inherits classroom::params {
  # just wrap the classroom class
  class { 'classroom':
    offline   => $offline,
    role      => $role,
    manageyum => $manageyum,
  }

  if $role == 'master' {
    # master gets the IRC server and reporting scripts
    include classroom::master::ircd
    include classroom::master::reporting_tools
    include classroom::master::sudoers
  }
  # Everyone gets Irssi
  include classroom::agent::irc

  class { 'classroom::facts':
    coursename => 'practitioner',
  }
}
