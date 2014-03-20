class apache::mod::jk (
  $enable_status         = false,
  $status_allow_from     = '127.0.0.1',
  $jkworkersfile         = undef,
  $jkworkerproperty      = undef,
  $jkshmfile             = undef,
  $jkshmsize             = undef,
  $jkmountfile           = undef,
  $jkmountfilereload     = undef,
  $jkmount               = undef,
  $jkunmount             = undef,
  $jkautoalias           = undef,
  $jkmountcopy           = undef,
  $jkworkerindicator     = undef,
  $jkwatchdoginterval    = undef,
  $jklogfile             = undef,
  $jkloglevel            = undef,
  $jklogstampformat      = undef,
  $jkrequestlogformat    = undef,
  $jkextractssl          = undef,
  $jkhttpsindicator      = undef,
  $jkcertsindicator      = undef,
  $jkcipherindicator     = undef,
  $jkcertchainprefix     = undef,
  $jksessionindicator    = undef,
  $jkkeysizeindicator    = undef,
  $jklocalnameindicator  = undef,
  $jklocalportindicator  = undef,
  $jkremotehostindicator = undef,
  $jkremoteaddrindicator = undef,
  $jkremoteportindicator = undef,
  $jkremoteuserindicator = undef,
  $jkauthtypeindicator   = undef,
  $jkoptions             = undef,
  $jkenvvar              = undef,
  $jkstripsession        = undef,
) {

  ::apache::mod { 'jk': }

  file { 'jk.conf':
    ensure  => file,
    path    => "${::apache::params::mod_dir}/jk.conf",
    content => template('apache/mod/jk.conf.erb'),
    require => File[$::apache::params::mod_dir],
    notify  => Service['httpd'],
  }
}
