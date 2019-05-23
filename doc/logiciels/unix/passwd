vim: ft=markdownlight fdm=expr

passwd and shadow
=================

- /etc/passwd
foo:x:1000:100:Foo Bar,,,:/home/foo:/bin/zsh
Login Name:Encrypted Passwd:UID:GID:User Name+Comments:User HOME:SHELL

- /etc/shadow:
foo:$id$salt$encrypted:15503:0:99999:7:::
Login Name:Encrypted Passwd:Date of Last passwd Change (in days since
EPoch):Minimum passwd age:Maximum passwd age:password warning period:passwd
inactivity period:account expiration date:reserved

id=1: MD5, id=2a: Blowfish, id=5:Sha256, id=6:Sha512

    A password field which starts with a exclamation mark means that
    the password is locked. The remaining characters on the line
    represent the password field before the password was locked.
- date of last password change
    The date of the last password change, expressed as the number of
    days since Jan 1, 1970.
    The value 0 has a special meaning, which is that the user should
    change her pasword the next time she will log in the system.
    An empty field means that password aging features are disabled.
- minimum password age
    The minimum password age is the number of days the user will have
    to wait before she will be allowed to change her password again.
    An empty field and value 0 mean that there are no minimum password
    age.
- maximum password age
    The maximum password age is the number of days after which the user
    will have to change her password.
    After this number of days is elapsed, the password may still be
    valid. The user should be asked to change her password the next
    time she will log in.
    An empty field means that there are no maximum password age, no
    password warning period, and no password inactivity period (see
    below).
    If the maximum password age is lower than the minimum password age,
    the user cannot change her password.
- password warning period
    The number of days before a password is going to expire (see the
    maximum password age above) during which the user should be warned.
    An empty field and value 0 mean that there are no password warning
    period.
- password inactivity period
    The number of days after a password has expired (see the maximum
    password age above) during which the password should still be
    accepted (and the user should update her password during the next
    login).
    After expiration of the password and this expiration period is
    elapsed, no login is possible using the current user's password.
    The user should contact her administrator.
    An empty field means that there are no enforcement of an inactivity
    period.
- account expiration date
    The date of expiration of the account, expressed as the number of
    days since Jan 1, 1970.
    Note that an account expiration differs from a password expiration.
    In case of an acount expiration, the user shall not be allowed to
    login. In case of a password expiration, the user is not allowed to
    login using her password.
    An empty field means that the account will never expire.
    The value 0 should not be used as it is interpreted as either an
    account with no expiration, or as an expiration on Jan 1, 1970.

Utilities
=========

- useradd / groupadd #add
- userdel / groupdel #delete
- usermod / groupmod / passwd #modify
- pwck / grpck #check; vipw, vigr: edit the password or group file
- newgrp: log in to a new group
    If not part of the group, need to enter group password
- gpasswd: change the group password, add members or admins (who can use gpasswd to set the group password:
    If a password is set the members can still use newgrp(1) without a
    password, and non-members must supply the password.)

Exemples:
sudo usermod -a -G network dams #-a: append
gpasswd -a user group
gpasswd -d user group #delete group from user

Files:
- passwd / shadow
- group / gshadow
- login.defs #for 'login'

Exemples
---------

sudo passwd -S user
sudo passwd -Sa => get status of user/all users

sudo passwd toto => change the passwd of toto

ex: passwd -S toto
toto P 08/21/2012 3 0 7 8
 #login name: P->usable passwd, L->locked passwd, NP-> no passwd
 :last passwd change:min age:max age:warning period:inactivity period

Changing informations in /etc/passwd
  usermod:
    -c comments (normally changed with chfn)
    -d homedir (add -m to also move homedir)
    -g gid
    -G groups (use -a to add them)
    -l login name
    -u: uid (add -o to allow no unique uid)
    -s: login shell
    -Z: selinux user
  chfn:
    -f: full-name
    -o: office
    -p: office phone
    -h: home phone

Changing informations in /etc/shadow
  usermod:
    -e expire date
    -f: inactivity period
    -L: lock, -U: unlock (like passwd -l/-u)
    -p crypted passwd: change passwd (bad idea as it appears in ps)
  Ex usermod -p 'x' user: to forcibly lock the user
     usermod -p '' user: no password
  passwd:
   -n: set min day change
   -x: set max days
   -w: set warn day change
   -i: set the inactivity period
   -l: lock passwd (add a ! in front of the crypt)
       [user can still log with ssh!]
   -u: unlock
  chage: change user password expiry information
    -d last_changed, -E expire_date, -I inactive, -l list,
    -m minday, -M maxday, -W warndays

See also /etc/login.defs:
- what to do in case of failed login
- logging
- MAIL_DIR, default PATH
- hush login
- default value of ERASECHAR, KILLCHAR, UMASK
- default passwd aging control (set by useradd)
- UID min/max, systemd uid min/max, same for gid
- comment fields that can be changed by user
- does a homedir need to exist?
- enabling user group (for when the GID is the same as the UID)

Setting password via the command line
--------------------------------------

sudo useradd --password ${PASSWORD} dams
sudo usermod --password ${PASSWORDHASH} dams #here $PASSWORDHASH is the hash

For several users:
echo -e 'root:toto\ndams:toto' | sudo chpasswd

The hash can be generated as:
$ openssl passwd -crypt 'vagrant'
  0EzoY3KqyuJnI

- sha-512 in perl with salt 'saltsalt':
$ perl -e 'print crypt("password","\$6\$saltsalt\$") . "\n"'

- In python:
$ python2 -c 'import crypt; print crypt.crypt("test", "$6$random_salt")'

- in ruby (beautiful!)
$ 'password'.crypt('$6$' + rand(36 ** 8).to_s(36))
(from: http://serverfault.com/questions/330069/how-to-create-an-sha-512-hashed-password-for-shadow)

Lock logins
============

Rem: if min age > max age, passwd change is still possible at password expiration period

- When no passwd `passwd -d toto`, can't su, but can ssh or sudo -u toto
  and can also login on a tty

- When account expired:
  Gondolin ~ $ su toto
  Password:
  => Your account has expired; please contact your system administrator
  su: incorrect password; same with ssh, but sudo -u toto work
  The same happen when the max+inactivity period is reached: the account is
  expired

- Putting /sbin/nologin as shell (sudo chsh toto)
  su toto: This account is currently not available.
  Same with ssh, but sudo -u toto ploum work

  [Funny thing: putting /bin/cat as a user shell work (the user can only
  launch cat) ssh toto@localhost ls show that ssh try to launch cat -c "ls"
  and output an error because cat does not know option -c]

- If password is expired, but inactivity period ok => required to change
  password on both ssh and standard login.
- If account is expired (or password expired+inactivity) impossible to log
  on ssh or su/standard login.

Summary:
- to prevent passwd authentification but allow ssh, lock the account
  (or put an invalid password)
- to prevent all login, either expire the account or put /sbin/nologin as
shell (or /bin/false)

