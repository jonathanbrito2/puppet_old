class brito-guc {
#user { 'monitoria':
#    ensure	    => present,
#    groups	    => 'wheel',
#    shell	    => '/bin/bash',
#    comment         => 'Monitoria do WhatsUp Gold',
#    home            => '/home/monitoria',
#    managehome      => true,
#    password        => '$1$HVEUlHsK$xykx.xEbjDz.cLppDZZ8v/',
#    password_min_age => '300',
#    password_max_age => '600',  
#}

user { 'root':
    ensure	    => present,
    shell	    => '/bin/bash',
    password        => '$1$2kq8XfJn$CU2AnHHhYoCHgJFD3A.J30',
    password_min_age => '3',
    password_max_age => '-1',  
}

user { 'backup':
    ensure	    => present,
    groups	    => 'wheel',
    shell	    => '/bin/bash',
    comment         => 'Usuario de Backup',
    home            => '/home/backup',
    managehome      => true,
    password        => '$1$HVEUlHsK$xykx.xEbjDz.cLppDZZ8v/',
    password_min_age => '3',
    password_max_age => '-1',  
}

user { 'zonta':
    ensure	    => present,
    groups	    => 'wheel',
    shell	    => '/bin/bash',
    comment         => 'Monitoria do WhatsUp Gold New',
    home            => '/home/zonta',
    managehome      => true,
    #password        => '$1$HVEUlHsK$xykx.xEbjDz.cLppDZZ8v/',
    password        => '$1$yCSC1xnr$siMNOxtLAQN3DSIveu/Uu/',
    password_min_age => '3',
    password_max_age => '-1',  
}

user { 'wilson.junior':
    ensure	    => absent,
    groups	    => 'wheel',
    shell	    => '/bin/bash',
    comment         => 'Analista Linux da PROTEUS - ACESSO TEMPORARIO',
    home            => '/home/wilson.junior',
    managehome      => true,
    password        => '$1$HVEUlHsK$xykx.xEbjDz.cLppDZZ8v/',
    password_min_age => '3',
    password_max_age => '7',  
}

user { 'brito':
    ensure	    => present,
    groups	    => 'wheel',
    shell	    => '/bin/bash',
    comment         => 'Jonathan Brito - Analista Linux',
    home            => '/home/brito',
    managehome      => true,
    #password        => '$1$84QTLZTe$e.9YXDLf/ZXld4z51YMFH.',
    password        => '$1$2kq8XfJn$CU2AnHHhYoCHgJFD3A.J30',
#    expiry          => 'absent'
    password_min_age => '3',
    password_max_age => '-1',  
}

#user { 'proteus':
#    ensure	    => present,
#    groups	    => 'wheel',
#    shell	    => '/bin/bash',
#    comment         => 'Usuario de Coleta da Proteus',
#    home            => '/home/proteus',
#    managehome      => true,
#    password        => '$1$HVEUlHsK$xykx.xEbjDz.cLppDZZ8v/',
##    expiry          => 'absent'
#    password_min_age => '3',
#    password_max_age => '-1',  
#}

user { 'coleta':
    ensure	    => present,
#    groups	    => 'wheel',
    shell	    => '/bin/bash',
    comment         => 'Usuario de Coleta da Proteus',
    home            => '/home/coleta',
    managehome      => true,
    password        => '$1$HVEUlHsK$xykx.xEbjDz.cLppDZZ8v/',
#    expiry          => 'absent'
    password_min_age => '3',
    password_max_age => '-1',  
}

file { 'login.defs':
	ensure => 'present',
	path   => '/etc/login.defs',
	owner  => 'root',
	group  => 'root',
	mode   => '0644',
	source => "puppet:///modules/brito-guc/login.defs",
    }

file { 'sudoers':
	ensure => 'present',
	path   => '/etc/sudoers',
	owner  => 'root',
	group  => 'root',
	mode   => '0440',
	source => "puppet:///modules/brito-guc/sudoers",
    }


#file { 'system-auth':
#	ensure => 'present',
#	path   => '/etc/pam.d/system-auth',
#	owner  => 'root',
#	group  => 'root',
#	mode   => '0644',
#	source => "puppet:///modules/brito-guc/system-auth",
#    }

# FORCE RUNNING PUPPET CLIENT
#

 cron { 'running_puppet':
         name     => 'Running Puppet Client',
         ensure   => 'present',
         command  => '/usr/bin/puppet agent -t',
         user     => 'root',
         hour     => "*/1",
         minute   => '30',
 }


}
