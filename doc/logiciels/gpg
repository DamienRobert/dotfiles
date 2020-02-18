vim: ft=markdownlight fdm=expr

Chiffrement/Déchiffrement
=========================

Clé publique:
gpg -r public -e ploum
gpg -e ploum (with default-recipient-self use the default key)
gpg -s ploum (use the default key)
gpg -u key -s ploum

[-a pour de l'ascii armor
--default-key: what key to sign with by default
-u [--local-user] to override for signatures
--default-recipient-self: use the default key to encrypt if *there is no recipient*
-r [--recipient]: keys to use for encryption
--encrypt-to: keys that are added whenever --recipient is used
  (usefull for mail: gpg -e --encrypt-to self-key -r destinataire)]

Décrypter/vérifier: gpg -d/gpg -v

Chiffrement symétrique:
gpg -c --cipher-algo AES256  fichier
  --passphrase ploum

Importer une clé/un keyring:
gpg --import
gpg --edit-key ploum (-> 'trust' pour signer la clé, passwd pour changer le
passwd, sign pour signer, lsign pour signer localement)

Summary: armor -a, encrypt -e, decrypt -d, sign -s, detached sign -b, verify -v
(but -d and -v are automatically guessed; when provided use the STDOUT
output, otherwise write on the file without the gpg extension)

Main Commands
=============

- Generate double keys: gpg --gen-key
- List available keys: gpg --list-keys | -k
  List secret keys: gpg -K
- Exporting your public key: gpg --armor --export keyID
- Importing a key: gpg --import filename
- Receive a key from a keyserver: gpg --recv-keys/--search-keys keyids
  gpg --locate-keys emails
  (use --auto-key-locate mechanisms, by default local,wkd [=Web Key Directory protocol])
- Calculating the fingerprint of a key: gpg --fingerprint keyId
- Send a key on keyserver: gpg --send-key keyID
- Signing a key: gpg --sign-key keyed
- Encrypt and signing a message: gpg -sea -r keyID (then type the message followed by key button CTRL+Z)
- Signing a public message: gpg --clearsign -a -r keyID (then type the message followed by key CTRL+Z)
- Decrypt a message/verify signature: gpg < message.txt
- Encrypt a file with a password: gpg -c filename
- Decrypt a file with password: gpg filename
- Sign a file (signature in a separate file): gpg --armor --detach-sign filename (This will be created as filename.asc with the message)
- Verifying detached signature file .asc: gpg filename.asc
- update keys: gpg --refresh-keys
- send to a key server gpg --send-key
CheatSheet: http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/gpg-cs.html

Signer une clé
--------------
gpg --recv-keys C6921648
gpg --fingerprint C6921648
gpg --sign-key C6921648
gpg --send-key C6921648

[Niveau de la signature: --ask-cert-level -> 0-3
L local signature, R nonRevocable signatre [nrsign]]

Exemples de chiffrement
-----------------------

Chiffrement avec clé secrète/publique:
  tar cJvf - "$@" | gpg -c --cipher-algo AES256 - > "$1.tar.xz.gpg"
  gpgfiles -c $dir -r mainkey #=> tar cvfJ - $dir | gpg "$@" -e > $dir.tar.xz.gpg

Déchiffrement:
  gpgfiles -d "$@" #=> gpg -d "$@" | tar xJvf -


Keys id
=======

- the short key id is the last 2 words of the fingerprint
- the long key id is the last 4 words of the fingerprint
  (to see the long key id of subkeys, which don't have a fingerprint; use gpg --list-keys --with-colon)
- the keygrip is used by gpg-agent; it corresponds to the key in private-keys-v1.d

To specify a key: https://www.gnupg.org/documentation/manuals/gnupg/Specify-a-User-ID.html#Specify-a-User-ID

Specify a key id: https://www.gnupg.org/documentation/manuals/gnupg/Specify-a-User-ID.html
- 0xid: By key-id or fingerprint. Add a '!' at end to force to use the subkey
- =user id: by exact match
- <email>: by email address
- @email: by partial match on email address
- &keygrip: by keygrip
- *partial: substring match [default)]

group
-----

group mynames = paige 0x12345678 joe patti

auto
----

keyserver-options auto-key-retrieve
    This option enables the automatic retrieving of keys from
    a keyserver when verifying signatures made by  keys  that
    are not on the local keyring.
[Used to retrieve key for signatures]

--auto-key-locate keyserver
    GnuPG can automatically locate and retrieve keys as needed using
    this option. This happens when encrypting to  an  email  address
    (in  the  "user@example.com"  form), and there are no user@exam‐
    ple.com keys on the local keyring. 
    keyserver:
    Locate  a  key  using whatever keyserver is defined using
    the --keyserver option.
[Used to locate keys for encryption (but not signature)]

On trust
========

http://security.stackexchange.com/questions/41208/what-is-the-exact-meaning-of-this-gpg-output-regarding-trust

$ gpg --check-trustdb 
gpg: checking the trustdb
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   3  signed:   2  trust: 0-, 0q, 0n, 0m, 0f, 3u
gpg: depth: 1  valid:   2  signed:   2  trust: 0-, 0q, 0n, 0m, 2f, 0u
gpg: depth: 2  valid:   1  signed:   0  trust: 0-, 0q, 0n, 1m, 0f, 0u

depth: la profondeur où l'on est; signed: le nombre de clés signés (donc au
depth 0 c'est les clés que j'ai moi même signé), trust:
  -:No ownertrust assigned / not yet calculated
  e:Trust calculation has failed; probably due to an expired key
  q:Not enough information for calculation
  n:Never trust this key
  m:Marginally trusted
  f:Fully trusted
  u:Ultimately trusted
In --export-ownertrust, 2 is undefined, 3 is never, 4 is marginal, 5 is full, and 6 is ultimate. 128 is for revoked/disabled

https://www.gnupg.org/gph/en/manual/x334.html
Pour la trust value, on regarde les clés *fully valides* signant
l'utilisateur O. Si la clé de O est signée par des signataires S_i, et
qu'on a un S_i fully trusted ou 3 S_i marginally trusted, et que de plus la
longueur d'une chaîne d'une clé ultimate à O est inférieure ou égale à 5,
alors la clé de O est fully valid. Sinon si il y a au moins un S_i
marginally trusted (et la condition sur la longueur), alors la clé de O est
marginally valid.
En particulier, mettre du trust sans signer (au moins localement) ne sera
pas pris en compte!

TOFU
----
More details on https://lists.gnupg.org/pipermail/gnupg-devel/2015-October/030341.html, the tofu database is in .gnupg/tofu.d.

gpg --update-trustdb --trust-model tofu+pgp

--trust-model pgp|classic|tofu|tofu+pgp|direct|always|auto
    tofu
             In the TOFU model, policies are associated with  bindings
             between  keys  and  email  addresses (which are extracted
             from user ids and normalized).  There are five  policies,
             which can be set manually using the --tofu-policy option.
             The default policy can be set using  the  --tofu-default-
             policy policy.

             The  TOFU policies are: auto, good, unknown, bad and ask.
             The auto policy is used by default (unless overridden  by
             --tofu-default-policy)  and marks a binding as marginally
             trusted.  The good, unknown and bad policies mark a bind‐
             ing  as fully trusted, as having unknown trust or as hav‐
             ing trust never, respectively.   The  unknown  policy  is
             useful  for  just  using TOFU to detect conflicts, but to
             never assign positive trust to a binding.  The final pol‐
             icy,  ask  prompts  the  user  to  indicate the binding's
             trust.  If batch mode is enabled (or input is inappropri‐
             ate  in  the  context), then the user is not prompted and
             the undefined trust level is returned.

      tofu+pgp
             This trust model combines TOFU with  the  Web  of  Trust.
             This  is done by computing the trust level for each model
             and then taking the maximum trust level where  the  trust
             levels are ordered as follows: unknown < undefined < mar‐
             ginal < fully < ultimate < expired < never.

             By setting --tofu-default-policy=unknown, this model  can
             be  used  to  implement the web of trust with TOFU's con‐
             flict detection algorithm, but without its assignment  of
             positive  trust  values,  which  some  security-conscious
             users don't like.

Key creation
============
EDDSA: gpg --expert --full-gen-key

Batch: https://www.gnupg.org/documentation/manuals/gnupg/Unattended-GPG-key-generation.html

gpg --homedir /tmp/gpg --batch --gen-key <<EOF
%no-protection
Key-Type: 22 #EDDSA
Key-Curve: Ed25519
Name-Real: Damien Olivier Robert
Name-Email: Damien.Olivier.Robert+gnupg@gmail.com
Name-Comment: Master Public Key
%commit
EOF

$ gpg --edit-key keyid
passwd
To add the passphrase afterwards

Select a nice key:
ruby <<EOF
require 'set'
keys=%x!GNUPGHOME=/tmp/gpg gpg --list-keys --with-colons!
shortids=keys.each_line.select {|l| l =~/^pub:/}.map {|l| l.split(':')[4][-8..-1]}
puts shortids.select {|i| i.each_char.to_set.length <=3}
EOF

Combine Keys
------------
gpg --expert --edit-key 22E892BC
addkey -> 13

Merge keys: http://security.stackexchange.com/questions/32935/migrating-gpg-master-keys-as-subkeys-to-new-master-key

Only keep the subkey: https://wiki.debian.org/Subkeys

Files
-----
- pubring.gpg is the list of all public keys I have
  Newer format: pubring.kbx
- secring.gpg is a list of my private keys (a private key contains the
  public key). This is not used anymore for gpg 2.1 where the gpg-agent is
  used (and the keys are in private-keys-v1.d/)
- trustdb.gpg list the trust of the keys
  (see it with gpg --export-ownertrust >otrust.lst)
- private-keys-v1.d/ the new location of secring
  [use the keygrip]
- openpgpg-revocs.d/ (where gpg-2.1 automatically generate revocation
  certificates; which can be regenerated with gpg --gen-revoke key)
  It is probably a good idea to encrypt them

Keyrings
--------

Convert to kbx:
https://www.gnupg.org/faq/whats-new-in-2.1.html
$ cd ~/.gnupg
$ gpg --export-ownertrust >otrust.lst
$ mv pubring.gpg publickeys
$ gpg2 --import-options import-local-sigs --import publickeys
$ gpg2 --import-ownertrust otrust.lst

Import to a keyring:
gpg --options=/dev/null --keyring=$PWD/agreg.gpg --no-default-keyring --import trousseau_agreg_moddC_2016.asc
Export a keyring
gpg --options=/dev/null --keyring=$PWD/agreg.kbx --no-default-keyring --export-options export-local-sigs --export -o export_keyring.gpg

Add a key to 'friends.gpg':
gpg --options=/dev/null --keyring=keyrings/friends.gpg --no-default-keyring --import ...
gpg --import keyrings/friends.gpg

List keys:
gpg --options=/dev/null --keyring=keyrings/mykeys.gpg --no-default-keyring --list-sigs

Shortcut: gpgfiles --keyring agreg.kbx ...
  #since we don't have a config file we need to stipulate the keyserver
  #done by default in gpgfiles, but we can always add more like:
  gpgfiles --keyring agreg.kbx --keyserver hkp://keys.gnupg.net --recv-keys DA8E58A71D366B11

gpg with ssh
============

http://www.incenp.org/notes/2015/gnupg-for-ssh-authentication.html
https://wiki.archlinux.org/index.php/SSH_keys#GnuPG_Agent

On the file ~/.gnupg/sshcontrol:
  # List of allowed ssh keys.  Only keys present in this file are used
  # in the SSH protocol.  The ssh-add tool may add new entries to this
  # file to enable them; you may also add them manually.  Comment
  # lines, like this one, as well as empty lines are ignored.  Lines do
  # have a certain length limit but this is not serious limitation as
  # the format of the entries is fixed and checked by gpg-agent. A
  # non-comment line starts with optional white spaces, followed by the
  # keygrip of the key given as 40 hex digits, optionally followed by a
  # caching TTL in seconds, and another optional field for arbitrary
  # flags.   Prepend the keygrip with an '!' mark to disable it.

One can use the "authenticate" flag to use a gpg key in ssh:
https://lists.gnupg.org/pipermail/gnupg-users/2015-December/054874.html

Converting to ssh: http://superuser.com/questions/360507/are-gpg-and-ssh-keys-interchangable
With gpg 2.1: --export-ssh-key [but I can't make it work, currently I just
use gpg-agent as ssh-agent and get the keyid via ssh-add -L]

gpg-agent
=========

Now started automatically. To launch manually (for ssh for instance):
  gpgconf --launch gpg-agent
  (ou gpg-connect-agent /bye)

gpgconf --reload gpg-agent #flush the cache [ie forget passphrases]
gpgconf --kill gpg-agent

Loopback:
~/.gnupg/gpg-agent.conf: allow-loopback-pinentry
$ gpg --pinentry-mode loopback -d config/.keys.gpg
-> get the passphrase from gpg rather than from the agent

Pinentry: by default pinentry-gtk

Redirections
------------

$ cat .gnupg/S.gpg-agent
%Assuan%
socket=${XDG_RUNTIME_DIR}/S.gpg-agent

/run
----

Newer versions use /run/user/$(id -u)/gnupg/*

    If a [/var]/run/user/$(id -u)/ directory exists, a gnupg subdir is
    created as needed and the permissions of the directories are checked.
    If that all matches that directory name is returned instead of the
    homedir.
    To cope with non standard homedirs (via GNUPGHOME or --homedir) the
    SHA-1 hash of the homedir is computed, left truncated to 120 bits,
    zBase-32 encoded, prefixed with "d.", and appended to
    "[/var]/run/user/$(id -u)/gnupg/".  If that directory exists and has
    proper permissions it is returned as socket dir - if not the homedir
    is used.  Due to cleanup issues, this directory will not be
    auto-created but needs to be created by the user in advance.
    [note if --homedir=~/.gnupg this is not applied, this is only applied
    for a non standard directory]
    The required permissions are: directory owned by the user, group and
    others bits not set.

    If you are not using the default homedirectly, you may use
    gpgconf --create-sockdir
    to create a dedicated directory below /run/user/$UID/gnupg.  gpgconf
    --remove-socketdir can be used for cleanup; gpgconf now also
    understands --homedir.

    Get the socket name: gpgconf --list-dirs | grep ^agent-socket: | cut -d: -f2
    To see the socket directory which would be used if it exists and all
    permissions are fine, you can use
    $ gpgconf --dry-run --create-socketdir
    gpgconf: socketdir is '/run/user/1000/gnupg'
    $ gpgconf --homedir /foo/tmp --dry-run --create-socketdir
    gpgconf: socketdir is '/run/user/1000/gnupg/d.xhmoxiusfxtwuy8s69hkyxtc'
    gpgconf:        non-default homedir
    gpgconf:        no such subdir

My Keys
=======

-r mainkey, internal, public, oldpublic

(See the backups in ~/.gnupg/mykeys/; I just put here the last values of
the fingerprint, which are shown by --list-packets.
See also ~/ViePratique/Passwords/encrypted-files)

group [internal] (ed25519 SCA) = EAE66111 A6BD78D6
  sub mainkey (cv25519 E): A8F039A2 C3BAB9E4
  sub internal (cv25519 E): 31C556B1 EBB7D78A
group [public] (ed25519 SCA) = BA5AFFAE 99000009
  sub public (cv25519 E): 49CE3D54 0BEC3F3B
group [old_public] (RSA SA)= DFEA373B CBC32853
  sub (RSA E): D212762F 1B11A28D

Plus d'infos sur les clés
-------------------------

[two --fingerprint also list the subkeys fingerprint]
$ gpg --list-keys --with-fingerprint --with-fingerprint --with-keygrip
$ gpg --list-sigs --with-fingerprint --with-fingerprint --with-keygrip

$ gpg --list-secret-keys --with-fingerprint --with-fingerprint --with-keygrip
[cf ~/ViePratique/Passwords/encrypted-files]

My web of trust
---------------
$gpg --export-ownertrust

00F0D0F0,DDDDFFFF (Bisson, full, signed, exported 00F0D0F0)
C6921648 (Ivey-Law, marginal, signed, exported)
722173AA (Hanrot, full, locally signed)
32F0EAAD (Couvreur, marginal, locally signed)

[For signatures, cf gpg --list-sigs, grep 32853, a 'sig L' means locally signed]

Ascii armor export
------------------
#comment agreg.kbx to not export CBC32853 twice
mykeys=(A6BD78D6 99000009 CBC32853)
cd ~/.gnupg/mykeys/
for id in $mykeys; do
  gpg -a --export-options export-local-sigs --export-secret-keys $id | gpg -e -r mainkey -o "private.$id.asc.gpg"
  gpg -a -o "public.$id.asc" --export-options export-local-sigs --export $id
done
gpg --export-ownertrust >! ownertrust

- revoke/*: revocation keys (encrypted with mainkey)
- private.*: export of private keys, encrypted with mainkey
- public*: export of my 'public' public keys. I also copied them to
  ~/website/files/{Damien_Olivier_Robert.asc, Damien_Olivier_Robert-Curve25519.asc}

On the web
----------

http://www.normalesup.org/~robert/pro/infos.html
http://www.normalesup.org/~robert/pro/files/Damien_Olivier_Robert.asc
Fingerprint: E5AE 1E40 0B61 8654 9745 75C3 DFEA 373B CBC3 2853

Keyserver:
- http://pgp.mit.edu:11371/pks/lookup?search=0xDFEA373BCBC32853
- http://pool.sks-keyservers.net/pks/lookup?search=Damien+Robert&fingerprint=on
- http://keys.gnupg.net/pks/lookup?search=Damien+Robert&fingerprint=on&op=index
-> infos (signatures):
- http://pgp.mit.edu:11371/pks/lookup?op=vindex&search=0xDFEA373BCBC32853
- http://pool.sks-keyservers.net/pks/lookup?op=vindex&fingerprint=on&search=0xDFEA373BCBC32853
-> export as .asc:
- http://pgp.mit.edu:11371/pks/lookup?op=get&search=0xDFEA373BCBC32853
- http://pool.sks-keyservers.net/pks/lookup?op=get&search=0xDFEA373BCBC32853

List Packets
============

Pour savoir avec quels clé un fichier est chiffré:
gpg --list-packets --list-only ploum.gpg

gpg --list-packets -> liste les packets, quitte à déchiffrer
  gpg --list-packets message.gpg
  :pubkey enc packet: version 3, algo 16, keyid 832FA0BB345FA8CD
    data: [1022 bits]
    data: [1022 bits]
  :pubkey enc packet: version 3, algo 1, keyid D212762F1B11A28D
    data: [2048 bits]

  You need a passphrase to unlock the secret key for
  user: "Damien Olivier Robert (Master Public Key) <Damien.Olivier.Robert+gnupg@gmail.com>"
  2048-bit RSA key, ID 1B11A28D, created 2012-08-24 (main key ID CBC32853)

  :encrypted data packet:
    length: 309
    mdc_method: 2
  gpg: encrypted with 1024-bit ELG key, ID 345FA8CD, created 2002-05-31
        "Guillaume Hanrot <ghanrot@free.fr>"
  gpg: encrypted with 2048-bit RSA key, ID 1B11A28D, created 2012-08-24
        "Damien Olivier Robert (Master Public Key) <Damien.Olivier.Robert+gnupg@gmail.com>"
  :compressed packet: algo=2
  :literal data packet:
    mode b (62), created 1396731656, name="message",
    raw data: 336 bytes

gpg --list-packets --list-only -> liste les packets qu'il n'y a pas besoin de déchiffrer
#on voit qu'avec ma clé publique on ne voit pas l'email avant de déchiffrer alors qu'avec celle de Guillaume si
  gpg --list-packets --list-only message.gpg
  :pubkey enc packet: version 3, algo 16, keyid 832FA0BB345FA8CD
    data: [1022 bits]
    data: [1022 bits]
  :pubkey enc packet: version 3, algo 1, keyid D212762F1B11A28D
    data: [2048 bits]
  :encrypted data packet:
    length: 309
    mdc_method: 2
  gpg: encrypted with 1024-bit ELG key, ID 345FA8CD, created 2002-05-31
        "Guillaume Hanrot <ghanrot@free.fr>"

gpg --list-only -> donne juste la sortie de "gpg: ..."
  gpg  --list-only message.gpg
  gpg: encrypted with 1024-bit ELG key, ID 345FA8CD, created 2002-05-31
        "Guillaume Hanrot <ghanrot@free.fr>"

cf aussi gpg --list-packets -v pour avoir encore plus de détails

Utilities
=========

Wrapper: https://github.com/peff/pass
 Pass - a very simple password storage mechanism

https://www.gopass.pw/
 gopass is a simple but powerful password manager for your terminal.

https://gist.github.com/rjhansen/67ab921ffb4084c865b3618d6955275f
SKS Keyserver Network Under Attack
