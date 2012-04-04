#!/usr/bin/env python

import ldap

l = ldap.initialize('ldap://localhost:10389')

r = l.search_s('dc=example,dc=com',ldap.SCOPE_SUBTREE,'(ou=*)',['objectClass','ou'])
for dn,entry in r:
    print 'Processing',repr(dn)

raw_input("Press any key")