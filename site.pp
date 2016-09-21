node puppetnode1 {
  include '::mysql::server'

  mysql_database { 'test_mdb':
    ensure  => 'present',
    charset => 'utf8',
  }

  mysql_user { 'test_user@localhost':
    ensure  => 'present',
  }

  mysql_grant { 'test_user@localhost/*.*':
    ensure => 'present',
    options => ['GRANT'],
    privileges => ['ALL'],
    table => '*.*',
    user => 'test_user@localhost',
  }
}

