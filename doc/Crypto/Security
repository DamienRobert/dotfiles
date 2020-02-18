vim: ft=markdownlight fdm=expr

Protocoles
==========

Hash
----

Shake128/256: http://crypto.stackexchange.com/questions/30587/what-is-the-use-case-for-xof-functions-i-e-shake128-256

The Keccak family of hash functions: Sha3/Shake128/ParallelHash128/KangarooTwelve:
https://public-inbox.org/git/91a34c5b-7844-3db2-cf29-411df5bcf886@noekeon.org/

Authenticity+Integrity
----------------------

HMAC
  http://en.wikipedia.org/wiki/Hash-based_message_authentication_code
  As with any MAC, it may be used to simultaneously verify both the data integrity and the authentication of a message.
  \textit{HMAC}(K, m) = H \left( (K \oplus opad) | H((K \oplus ipad) | m)\right)
  ie  MAC = H(key ∥ H(key ∥ message))

Poly1305
  http://en.wikipedia.org/wiki/Poly1305-AES
  Poly1305-AES is a cryptographic message authentication code (MAC) written
  by Daniel J. Bernstein. It can be used to verify the data integrity and
  the authenticity of a message.

Confidentiality+Authenticity+Integrity
--------------------------------------

AES-GSM
  http://en.wikipedia.org/wiki/Galois/Counter_Mode
  It is an authenticated encryption algorithm designed to provide both data authenticity (integrity) and confidentiality.
  Galois Message Authentication Code (GMAC) is an authentication-only variant of the GCM which can be used as an incremental message authentication code
[New protocol: AES-GCM-SIV]

CCM
  http://en.wikipedia.org/wiki/CCM_mode
  As the name suggests, CCM mode combines the well-known counter mode of encryption with the well-known CBC-MAC mode of authentication.
  http://en.wikipedia.org/wiki/CBC-MAC

OCB (authenticity+confidentiality), resilient

http://crypto.stackexchange.com/questions/9539/authenticated-encryption-mode-for-stream-cipher

- AES-GCM is built by combining a polynomial one-time MAC called GHash with the stream cipher AES-CTR.
- Salsa20-Poly1305 is built by combining a polynomial one-time MAC called Poly1305 with the stream cipher Salsa.
- Poly1305-AES is built by combining a polynomial one-time MAC called Poly1305 with the stream cipher AES-CTR.

Symmetric Key Crypto
--------------------

AES
 Block code cipher

ChaCha20
  http://en.wikipedia.org/wiki/Salsa20
  Stream cipher
  (Chacha20 is a variant of Salsa20
  ChaCha is the basis of the BLAKE hash function, a finalist in the NIST hash function competition, and BLAKE2 successor tuned for even higher speed. It also defines a variant using 16 64-bit words (1024 bits of state), with correspondingly adjusted rotation constants.)

Block Cipher modes
------------------

http://en.wikipedia.org/wiki/Block_cipher_modes_of_operation#Cipher-block_chaining_.28CBC.29

Public Key
----------

curve-25519 (for ECDH)

Certificates
------------

http://en.wikipedia.org/wiki/Comparison_of_TLS_implementations
Key exchange algorithms (certificate-only)
  RSA, DHE-RSA, DHE-DSS, ECDH-ECDSA, ECDHE-ECDSA, ECDH-RSA, ECDHE-RSA

Encryption algorithms
  AES-CBC,AES-CCM,AES-GCM
  Chacha20-Poly1305

SSH
---

Ciphers (default)
  aes128-ctr,aes192-ctr,aes256-ctr,arcfour256,arcfour128,
  aes128-gcm@openssh.com,aes256-gcm@openssh.com,
  chacha20-poly1305@openssh.com,
  aes128-cbc,3des-cbc,blowfish-cbc,cast128-cbc,aes192-cbc,
  aes256-cbc,arcfour
KexAlgorithms (default)
  curve25519-sha256@libssh.org,
  ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-
  sha2-nistp521,
  diffie-hellman-group-exchange-sha256,
  diffie-hellman-group-exchange-sha1,
  diffie-hellman-group14-sha1,
  diffie-hellman-group1-sha1
Authentification: id_dsa, id_rsa, id_ecdsa, id_ed25519

Forward Secrecy
---------------

http://en.wikipedia.org/wiki/Forward_secrecy
In cryptography, forward secrecy (FS; also known as perfect forward secrecy, or PFS[1] and also key erasure[2]) is a property of key-agreement protocols ensuring that a session key derived from a set of long-term keys cannot be compromised if one of the long-term keys is compromised in the future.

Ex: Diffie Helmann Key Exchange (DHE)
    E for epheremal, ie the diffie-helman key is regenerated; TLS has DH
    protocols where the DH key is used for the signature and can't change
    for each sessions

=> DHE/ECDHE: Diffie-Hellman Epheremal

Signature
----------

http://dedis.cs.yale.edu/dissent/papers/witness-abs
Multiple Schnorr Signatures with EdDsa

https://en.wikipedia.org/wiki/Ring_signature

PAKE
----

Password authenticated key exchange (PAKE)
Cf Opaque

PKCS
----

http://en.wikipedia.org/wiki/PKCS

PKCS #1         2.2     RSA Cryptography Standard[1]
PKCS #3         1.4     Diffie–Hellman Key Agreemen
PKCS #5         2.0     Password-based Encryption Standard[3]
PKCS #7         1.5     Cryptographic Message Syntax Standard[5] (S/MIME)
PKCS #8         1.2     Private-Key Information Syntax Standard[6]
PKCS #9         2.0     Selected Attribute Types[7]
PKCS #10        1.7     Certification Request Standard[8]
PKCS #11        2.30    Cryptographic Token Interface[9]
PKCS #12        1.1     Personal Information Exchange Syntax Standard
PKCS #15        1.1     Cryptographic Token Information Format Standard[13]

Certificates: http://en.wikipedia.org/wiki/X.509
An X.509 certificate contains a public key and an identity

Common filename extensions for X.509 certificates are:[citation needed]
- .pem – (Privacy-enhanced Electronic Mail) Base64 encoded DER certificate, enclosed between "-----BEGIN CERTIFICATE-----" and "-----END CERTIFICATE-----"
- .cer, .crt, .der – usually in binary DER form, but Base64-encoded certificates are common too (see .pem above)
- .p7b, .p7c – PKCS#7 SignedData structure without data, just certificate(s) or CRL(s)
- .p12 – PKCS#12, may contain certificate(s) (public) and private keys (password protected)
- .pfx – PFX, predecessor of PKCS#12 (usually contains data in PKCS#12 format, e.g., with PFX files generated in IIS)
* PKCS#7 is a standard for signing or encrypting (officially called "enveloping") data. Since the certificate is needed to verify signed data, it is possible to include them in the SignedData structure. A .P7C file is a degenerated SignedData structure, without any data to sign.[citation needed]
* PKCS#12 evolved from the personal information exchange (PFX) standard and is used to exchange public and private objects in a single file.[citation needed]
  => commonly used to bundle a private key with its X.509 certificate or to bundle all the members of a chain of trust.

See also for the representation  ASN.1 and the encoding DER
http://en.wikipedia.org/wiki/Abstract_Syntax_Notation_One
http://en.wikipedia.org/wiki/X.690#DER_encoding

Key Derivation
--------------

https://github.com/bitcoin/bips/blob/master/bip-0032.mediawiki
Bitcoin key derivation for ecdsa

Cf the thread starting on
https://www.ietf.org/mail-archive/web/cfrg/current/msg09077.html
- https://www.ietf.org/mail-archive/web/cfrg/current/msg09083.html
  More references
- https://www.ietf.org/mail-archive/web/cfrg/current/msg09093.html
  Formalisation of blinded signatures

Commitment
----------

https://blog.chain.com/preparing-for-a-quantum-future-45535b316314#.ndtru0anu
Pedersen commitments and El Gamal commitments
=> Use Discrete logarithm equality proofs
Implementation: https://github.com/dedis/crypto/blob/master/proof/dleq.go#L104

Proving the equivalence of a DL is due to Schnorr and called the sigma
protocol, cf http://www.cs.au.dk/~ivan/Sigma.pdf for a nice discussion

See the thread starting on
https://moderncrypto.org/mail-archive/curves/2017/000850.html
"Non-interactive zero knowledge proofs of discrete log equivalence"
In particular
- https://moderncrypto.org/mail-archive/curves/2017/000853.html
  summarizes Schnorr's Sigma protocol
  Note: sigma protocols are honest verifier zero-knowledge, which is different
  from zero-knowledge. The Fiat-Shamir transform converts these to
  noninteractive zero-knowledge protocols in the ROM, so in practice 
  this is good enough (cf the paper above)
- https://moderncrypto.org/mail-archive/curves/2017/000852.html
  applications of NIZK DLEQ
- https://moderncrypto.org/mail-archive/curves/2017/000855.html
  How to derive NIZK DLEQ from Sigma ("Chaum-Pedersen" idea), with more
  references

Forward Secure Non-Interactive Key Exchange:
http://www.di.ens.fr/users/pointche/Documents/Papers/2014_scn.pdf

Modern crypto
-------------

Monnaie électronique, vote électronique, certificats anonymes,
transfert inconscient, multipartite computation,
obfuscation/white-box crypto, functional encryption, fully homomorphique

Cf https://blog.cryptographyengineering.com/2014/02/21/cryptographic-obfuscation-and/
https://en.wikipedia.org/wiki/Functional_encryption
https://crypto.stackexchange.com/questions/386/what-are-the-differences-between-white-box-cryptography-and-code-obfuscation

* Math mesh: http://mathmesh.com/Documents/draft-hallambaker-mesh-architecture.html
  https://mailarchive.ietf.org/arch/browse/mathmesh/?qdr=y

Software
--------

* gpg alternative
- https://latacora.micro.blog/2019/07/16/the-pgp-problem.html
- https://blog.gtank.cc/modern-alternatives-to-pgp/

- File transfert (using pake): https://magic-wormhole.readthedocs.io/en/latest/welcome.html
  firefox send cli: https://gitlab.com/timvisee/ffsend
- Signature: signify / minisign
- Encryption: age https://docs.google.com/document/d/11yHom20CrsuX8KQJXBBw04s80Unjv8zCg_A7sPAX_9Y/view, https://news.ycombinator.com/item?id=19951405
  https://github.com/FiloSottile/age

* gpg
- gpg:
    gpg4win [=gpg + kleopatra]
    chrome/firefox plugin: Flowcrypt, Mailvelope
    Web Key Directory: https://wiki.gnupg.org/WKD [=authoritative version
    of keyservers]
- keybase.io: gpg wrapper with a nice web 2.0 interface
  Allows to verify keys and associate keys with social accounts
  => use the saltpack crypto messaging format for chat
     https://saltpack.org
  => https://keybase.io/docs/kbfs
     Public, signed directories for everyone in the world
- pep - pretty easy privacy: https://prettyeasyprivacy.com/
  For mail in android/ios/outlook; uses gnupg
  Il y a eu un exposé là-dessus au GNU Hackers' Meeting 2016; les vidéos
  sont disponibles ici: 
    http://videos.rennes.inria.fr/Workshop-GNUHackersMeetings2016/expose-GNUVolkerBirk18aout2016.mp4
    http://videos.rennes.inria.fr/Workshop-GNUHackersMeetings2016/expose2-GNUVolkerBirk19aout2016.mp4
  => intégré dans enigmail
- openkeychain: free software, manage pgp keys on android, integrates with k9mail

* Chat
- signal protocol (was Axolotl): Double Ratchet Algorithm, prekeys, and a triple Diffie–Hellman (3-DH) handshake,[4] and uses Curve25519, AES-256 and HMAC-SHA256 as primitives https://en.wikipedia.org/wiki/Signal_Protocol
  => signal (was text secure), whatsapp, facebook messenger, google allo
- telegram, threema, wire (closed source)
- matrix: https://matrix.org/blog/2019/06/11/introducing-matrix-1-0-and-the-matrix-org-foundation
  Client: Riot.im
  => https://blog.jabberhead.tk/2019/03/10/a-look-at-matrix-orgs-olm-megolm-encryption-protocol/ [Olm=Matrix, vs Omemo]
- xmpp: OTR (off the record), OMEMO (multi client end-to-end encryption
  using double ratchet algorithm, based on signal's protocol)

* Web:
- https://letsencrypt.org/ #free ssl certificates
  => https://github.com/Neilpang/acme.sh
     https://github.com/lukas2511/dehydrated
- mail: https://protonmail.com/

* Curve 25519: https://ianix.com/pub/curve25519-deployment.html
  https://en.wikipedia.org/wiki/Comparison_of_cryptography_libraries

* Cloudflare: https://blog.cloudflare.com/tag/crypto
- https://blog.cloudflare.com/a-free-argo-tunnel-for-your-next-project/
  [alternative to ngrok: https://ngrok.com/]
- https://blog.cloudflare.com/cloudflare-ethereum-gateway/
- https://blog.cloudflare.com/secure-time/
  => time.cloudflare.com
- https://blog.cloudflare.com/announcing-1111/ (dns)
- https://blog.cloudflare.com/1111-warp-better-vpn/ [1111+wireguard wrapper]

Modèles de sécurités
====================

http://en.wikipedia.org/wiki/Ciphertext_indistinguishability

* Indistinguishability under chosen-plaintext attack (IND-CPA)
- The challenger generates a key pair PK, SK based on some security parameter k (e.g., a key size in bits), and publishes PK to the adversary. The challenger retains SK.
- The adversary may perform a polynomially bounded number of encryptions or other operations.
- Eventually, the adversary submits two distinct chosen plaintexts \scriptstyle M_0, M_1 to the challenger.
- The challenger selects a bit b \scriptstyle \in {0, 1} uniformly at random, and sends the challenge ciphertext C = E(PK, \scriptstyle M_b) back to the adversary.
- The adversary is free to perform any number of additional computations or encryptions. Finally, it outputs a guess for the value of b.

* Indistinguishability under chosen ciphertext attack/adaptive chosen ciphertext attack (IND-CCA1, IND-CCA2)
- The challenger generates a key pair PK, SK based on some security parameter k (e.g., a key size in bits), and publishes PK to the adversary. The challenger retains SK.
- The adversary may perform any number of encryptions, calls to the decryption oracle based on arbitrary ciphertexts, or other operations.
- Eventually, the adversary submits two distinct chosen plaintexts \scriptstyle M_0,\, M_1 to the challenger.
- The challenger selects a bit b ∈ {0, 1} uniformly at random, and sends the "challenge" ciphertext C = E(PK, \scriptstyle M_b) back to the adversary.
- The adversary is free to perform any number of additional computations or encryptions.
  - In the non-adaptive case (IND-CCA1), the adversary may not make further calls to the decryption oracle.
  - In the adaptive case (IND-CCA2), the adversary may make further calls to the decryption oracle, but may not submit the challenge ciphertext C.
- Finally, the adversary outputs a guess for the value of b.

Correspondances:
- IND-CPA  \Leftrightarrow semantic security under CPA.
- NM-CPA (non-malleability under chosen plaintext attack) \Rightarrow IND-CPA.
- NM-CPA (non-malleability under chosen plaintext attack) \not\Rightarrow IND-CCA2.
- NM-CCA2 (non-malleability under adaptive chosen ciphertext attack) \Leftrightarrow IND-CCA2.

http://en.wikipedia.org/wiki/Semantic_security
In cryptography, a cryptosystem is semantically secure if any probabilistic, polynomial-time algorithm (PPTA) that is given the ciphertext of a certain message m (taken from any distribution of messages), and the message's length, cannot determine any partial information on the message with probability non-negligibly higher than all other PPTA's that only have access to the message length (and not the ciphertext).[

http://en.wikipedia.org/wiki/Malleability_%28cryptography%29
Malleability is a property of some cryptographic algorithms.[1] An encryption algorithm is malleable if it is possible for an adversary to transform a ciphertext into another ciphertext which decrypts to a related plaintext. That is, given an encryption of a plaintext m, it is possible to generate another ciphertext which decrypts to f(m), for a known function f, without necessarily knowing or learning m.

Bugs et attaques
================

* Spectre et Meltdown:
https://googleprojectzero.blogspot.fr/2018/01/reading-privileged-memory-with-side.html

Explications:
http://pythonsweetness.tumblr.com/post/169166980422/the-mysterious-case-of-the-linux-page-table
https://arstechnica.com/gadgets/2018/01/whats-behind-the-intel-design-flaw-forcing-numerous-patches/
https://arstechnica.com/gadgets/2018/01/meltdown-and-spectre-every-modern-proces
sor-has-unfixable-security-flaws/

https://www.reddit.com/r/sysadmin/comments/7o39et/meltdown_spectre_megathread/

* Efail:
https://efail.de/
The EFAIL attacks break PGP and S/MIME email encryption by coercing clients into sending the full plaintext of the emails to the attacker.

* HTTP Desync
https://portswigger.net/research/http-desync-attacks-request-smuggling-reborn
