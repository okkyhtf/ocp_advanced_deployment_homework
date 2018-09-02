#!/usr/bin/env bash

genericPwd='r3dh4t1!'
pwdFile=/etc/origin/master/htpasswd

htpasswd -b $pwdFile andrew $genericPwd
htpasswd -b $pwdFile amy $genericPwd
htpasswd -b $pwdFile brian $genericPwd
htpasswd -b $pwdFile betty $genericPwd

oc login -u system:admin

oc adm groups new alphacorp andrew amy
oc adm groups new betacorp brian betty

oc label group/alphacorp client=alpha
oc label group/betacorp client=beta 
