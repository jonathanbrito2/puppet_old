node 'puppetmaster.si-caju.abnote.com.br' {

#      include dexter-utils
#      include dexter-ssh
       include dexter-ntp
       include brito-snmp
#      include brito-repo
#      include dexter-mcollective
#      include brito-rsyslog
#      include brito-guc
       include brito-proteus
   }

node 'hmcefalo.si-caju.abnote.com.br' {

#      include dexter-utils
#       include dexter-ssh
       include dexter-ntp
       include brito-snmp
#      include brito-repo
#      include dexter-mcollective
#      include brito-rsyslog
#      include brito-guc
#      include ocsinventory	
       include brito-proteus
   }


#node 'vmzorah.si-caju.abnote.com.br' {

#     include dexter-utils
#     include dexter-ssh
#     include dexter-ntp
#     include brito-snmp
#     include brito-repo
#     include brito-rsyslog
#     include dexter-mcollective
#     include ocsinventory	
#     include issue
#     include brito-guc 
#     include winbind::matriz
#   }

node 'vmacademos.si-caju.abnote.com.br' {

      include dexter-utils
      include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-rsyslog
      include brito-repo
#     include dexter-mcollective
#     include ocsinventory	
      include brito-postfix
#     include winbind::matriz
#     include brito-proteus
      include issue
#     include brito-guc
#     include winbind::matriz
   }

node 'vmalfeu.si-caju.abnote.com.br' {

      include dexter-utils
#     include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-postfix
      include brito-repo
#     include brito-rsyslog
#     include dexter-mcollective
#     include ocsinventory	
      include issue
#     include brito-guc
#     include brito-proteus
#     include winbind::matriz
   }


#node 'vmgrus.si-caju.abnote.com.br' {

#     include dexter-utils
#     include dexter-ssh
#     include dexter-ntp
#     include brito-snmp
#     include brito-repo
#     include dexter-mcollective
#     include ocsinventory	
#     include issue
#     include winbind::matriz
#     include brito-guc
#   }

# FAVOR NAO APLICAR O MODULO WINBIND NESSE SERVIDOR
node 'vmbasileu.si-caju.abnote.com.br' {

      include dexter-utils
#     include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
#     include dexter-mcollective
      include brito-rsyslog
#     include ocsinventory	
      include issue
#     include zabbixagent
#     include brito-guc
#     include brito-proteus
      include brito-postfix
#     include brito-proteus::oraclelinux

   }

node 'hmbasileu.si-caju.abnote.com.br' {

      include dexter-utils
#     include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
#     include dexter-mcollective
      include brito-rsyslog
#     include ocsinventory	
      include issue
      include zabbixagent
#     include brito-guc
#     include brito-proteus
#     include brito-postfix
      include brito-proteus::oraclelinux

   }


node 'vmacrisio.si-caju.abnote.com.br' {

      include dexter-utils
      include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
#     include dexter-mcollective
      include brito-rsyslog
#     include ocsinventory	
      include issue
#     include brito-guc
      include brito-postfix
      include brito-proteus
### FAVOR NAO HABILITAR O MODULO WINBIND
#     include winbind::matriz

   
}


node 'tstcefalo.si-caju.abnote.com.br' {

#     include dexter-utils
#      include dexter-ssh
#      include dexter-ntp
      include brito-snmp
      include brito-repo
#     include dexter-mcollective
      include brito-rsyslog
#     include ocsinventory	
      include issue
#      include brito-guc
#      include brito-proteus
#      include brito-postfix
#      include winbind::matriz
   }

#node 'tstaries.si-caju.abnote.com.br' {
#
#      include dexter-utils
#      include dexter-ssh
##     include dexter-ntp
#      include brito-snmp
#      include brito-repo
#      include dexter-mcollective
#      include brito-rsyslog
##     include ocsinventory	
#      include issue
#      include brito-guc
#      include brito-proteus
#      include winbind::matriz
#      include brito-postfix
#   }

#node 'tstalexandria.si-caju.abnote.com.br' {

#      include dexter-utils
#      include dexter-ssh
#      include dexter-ntp
#      include brito-snmp
#      include brito-repo
#      include brito-rsyslog
#      include dexter-mcollective
#      include issue
#     include ocsinventory
#      include brito-guc	
#      include brito-proteus
#      include winbind::matriz
#   }

node 'vmfenix.si-caju.abnote.com.br' {

#     include dexter-utils
      include dexter-ssh
      include dexter-ntp
      include brito-snmp
#     include brito-repo
#     include dexter-mcollective
#     include brito-rsyslog
#     include ocsinventory	
#     include issue
      include brito-guc
#     include brito-proteus::oraclelinux
#     include winbind::matriz	
   }

node 'vmhercules.si-caju.abnote.com.br' {

#     include dexter-utils
#     include dexter-ssh
      include dexter-ntp
      include brito-snmp
#     include brito-repo
#     include dexter-mcollective
# NÃO HABILITAR
#     include brito-rsyslog
#     include ocsinventory	
      include issue
#     include brito-guc   
#     include brito-postfix
#     include winbind::matriz	
#     include brito-proteus::oraclelinux
#     include brito-postfix
}

node 'vmalexandria.si-caju.abnote.com.br' {

      include dexter-utils
      include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
      include dexter-mcollective
      include brito-rsyslog
#     include ocsinventory	
      include issue
      include brito-guc   
      include winbind::matriz
      include brito-proteus
#     include zabbixagent
      include brito-postfix
}

node 'vmanaia.si-caju.abnote.com.br' {

      include dexter-utils
      include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
      include dexter-mcollective
      include brito-rsyslog
#     include ocsinventory	
      include issue
#     include brito-proteus
#     include brito-postfix
      include brito-guc   
      include winbind::matriz
}

node 'vmhelio.si-caju.abnote.com.br' {

#     include dexter-utils
      include dexter-ssh
      include dexter-ntp
      include brito-snmp
#     include brito-repo
#     include dexter-mcollective
#     include brito-rsyslog
#     include ocsinventory	
      include issue
      include brito-proteus
      include brito-guc   
      include winbind::matriz
}

node 'vmulisses.si-caju.abnote.com.br' {

      include dexter-utils
#     include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
#     include dexter-mcollective
# FAVOR NAO HABILITAR O RSYSLOG
#     include brito-rsyslog
#     include ocsinventory	
      include issue
      include brito-guc   
      include brito-postfix
      include winbind::matriz
#     include brito-proteus::oraclelinux
      include brito-postfix
}

node 'vmhecate.si-caju.abnote.com.br' {

      include dexter-utils
#     include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
#     include dexter-mcollective
# FAVOR NAO HABILITAR O RSYSLOG
#     include brito-rsyslog
#     include ocsinventory	
      include issue
      include brito-guc   
      include brito-postfix
      include winbind::matriz
#     include brito-proteus::oraclelinux
}
node 'lato.si-caju.abnote.com.br' {

      include dexter-utils
      include dexter-ssh
#     include dexter-ntp
      include brito-snmp
      include brito-repo
#     include dexter-mcollective
#     include brito-rsyslog
#     include ocsinventory	
      include issue
      include brito-guc   
      include brito-postfix
#     include brito-proteus
      include winbind::matriz
}


node 'hercules.si-caju.abnote.com.br' {

      include dexter-utils
#     include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
#     include dexter-mcollective
      include brito-rsyslog
      include ocsinventory	
      include issue
      include brito-postfix
      include brito-guc
#     include brito-proteus::oraclelinux
#     include winbind::matriz
   }


node 'festo.si-caju.abnote.com.br' {

      include dexter-utils
#     include dexter-ssh
      include dexter-ntp
      include brito-snmp
      include brito-repo
#     include dexter-mcollective
      include brito-rsyslog
      include ocsinventory	
      include brito-postfix
      include issue
      include brito-guc
#     include brito-proteus::oraclelinux
#     include winbind::matriz
   }

node 'hmandromeda.si-caju.abnote.com.br' {

#     include dexter-utils
      include dexter-ssh
      include dexter-ntp
      include brito-snmp
#     include brito-repo
#     include dexter-mcollective
      include brito-rsyslog
#     include ocsinventory	
      include issue
#     include brito-postfix
      include brito-guc
#     include brito-proteus::oraclelinux
#     include winbind::matriz
      include zabbixagent
   }

node 'tstandromeda.si-caju.abnote.com.br' {

      include dexter-utils
      include dexter-ssh
      include dexter-ntp
      include brito-snmp
#     include brito-repo
#     include dexter-mcollective
      include brito-rsyslog
#     include ocsinventory	
      include issue
      include brito-postfix
      include brito-guc
#     include brito-proteus::oraclelinux
#     include winbind::matriz
#     include zabbixagent
   }

node 'tstalcer.si-caju.abnote.com.br' {

#     include dexter-utils
      include dexter-ssh
#     include dexter-ntp
      include brito-snmp
      include brito-repo
#     include dexter-mcollective
#     include brito-rsyslog
#     include ocsinventory	
      include issue
#     include brito-postfix
#     include brito-guc
#     include brito-proteus::oraclelinux
#     include winbind::matriz
#     include zabbixagent
      include brito-gnome
   }

node 'tstagamenon.si-caju.abnote.com.br' {

      include dexter-utils
      include dexter-ssh
#     include dexter-ntp
      include brito-snmp
      include brito-repo
      include dexter-mcollective
      include brito-rsyslog
#     include ocsinventory	
      include issue
      include brito-guc
#     include brito-proteus
      include winbind::matriz
   }

#node 'hmatira.si-caju.abnote.com.br' {

#     include dexter-utils
#     include dexter-ssh
#     include dexter-ntp
#     include brito-snmp
#     include brito-repo
#     include dexter-mcollective
#     include brito-rsyslog
#     include ocsinventory	
#     include issue
#     include brito-guc
#     include brito-postfix
#     include brito-proteus
#     include winbind::matriz
#     include zabbixagent
#   }

node 'vmisis.si-caju.abnote.com.br' {

#     include dexter-utils
      include dexter-ssh
      include dexter-ntp
      include brito-snmp
#     include brito-repo
#     include dexter-mcollective
      include brito-rsyslog
      include ocsinventory	
      include issue
      include brito-postfix
      include brito-guc
#     include brito-proteus::oraclelinux
#     include winbind::matriz
#     include zabbixagent
   }


### DPF ###

node 'vmabdera.dpf.local' {

      include dexter-utils
      include dexter-ssh
#     include dexter-ntp
#     include brito-snmp
#     include brito-repo
#     include dexter-mcollective
#     include brito-rsyslog
#     include ocsinventory	
      include issue
#     include brito-postfix
#     include brito-guc
#     include brito-proteus::oraclelinux
#     include winbind::matriz
#     include zabbixagent
   }

### CNH-DF ###

node 'vmcolofon.cnhdf.local' {

      include dexter-utils
      include dexter-ssh
#     include dexter-ntp
#     include brito-snmp
#     include brito-repo
#     include dexter-mcollective
#     include brito-rsyslog
#     include ocsinventory	
      include issue
#     include brito-postfix
#     include brito-guc
#     include brito-proteus::oraclelinux
#     include winbind::matriz
#     include zabbixagent
   }



### CNH-GO - SERVIDORES ###

node 'aries.cnhgo.local' {

#     include dexter-utils
#     include dexter-ssh
#     include dexter-ntp
#     include brito-snmp
#     include brito-repo
#     include dexter-mcollective
#     include brito-rsyslog
#     include ocsinventory	
#     include issue
#     include brito-guc
#     include zabbixagent
#     include winbind::cnhgo	
      include brito-postfix
   }

node 'persefone.cnhgo.local' {

#     include dexter-utils
#     include dexter-ssh
#     include dexter-ntp
#     include brito-snmp
#     include brito-repo
#     include dexter-mcollective
#     include brito-rsyslog
#     include ocsinventory	
#     include issue
#     include brito-guc
#     include zabbixagent
#     include winbind::cnhgo	
   }


### CNH-GO - FIM ###


### CNH-RS - SERVIDORES ###

node 'vmfenico.cnhrs.local' {

     include dexter-utils
     include dexter-ssh
#    include dexter-ntp
     include brito-snmp
#    include brito-repo
#    include dexter-mcollective
#    include brito-rsyslog
#    include ocsinventory	
     include issue
     include brito-guc
     include brito-postfix
#    include zabbixagent
#    include winbind::cnhrs
   }

### CNH-RS - FIM ###


### ID-MA SERVIDORES ### 

node 'vmsparta.idma.local' {

#     include dexter-utils
      include dexter-ssh
      include dexter-ntp
      include brito-snmp
#     include brito-repo
#     include dexter-mcollective
#     include brito-rsyslog
#     include ocsinventory
      include issue
#     include brito-guc
#     include winbind::matriz
#     include brito-proteus
 }

### ID-MA - FIM ###


### CNH-MA SERVIDORES ###

 node 'vmpriapo.cnhma.local' {

 #     include dexter-utils
       include dexter-ssh
       include dexter-ntp
       include brito-snmp
 #     include brito-repo
 #     include dexter-mcollective
 #     include brito-rsyslog
 #     include ocsinventory
       include issue
 #     include brito-guc
 #     include winbind::matriz
 #     include brito-proteus
  }

### CNH-MA - FIM ###


### ID-SP SERVIDORES ###

 node 'vmhades.idsp.local' {

      include dexter-utils
      include dexter-ssh
#     include brito-snmp
#     include brito-repo
      include ocsinventory	
#     include dexter-mcollective
      include issue
#     include brito-guc
#     include brito-proteus
  }

### ID-SP - FIM ###

### INTERPRINT ###

 node 'vmnemesis.sisbc.com' {

#     include dexter-utils
      include dexter-ssh
      include brito-snmp
#     include brito-repo
#     include dexter-mcollective
      include issue
#     include brito-guc
#     include brito-proteus
      include brito-postfix
  }
