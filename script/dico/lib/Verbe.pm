package Verbe;

use strict;
use vars qw(%desinences @troisieme_groupe @index);
%desinences = (e => [qw(e es e)], s => [qw(s s t)], x => [qw(x x t)],
   S => ['s', 's', ''], t => ['', '', 't'],
   i=> [qw(is is �t)], o => [qw(os os �t)] );

@index= qw(DES PRES REG PASSE PASSE2 FUTUR INF PART REG2 SUBJ SUBJ2);
@troisieme_groupe = (
#Il comprend aussi les verbes du deuxi�me groupe (� la fin).
#Mod�le    Rad    D Pr�s Reg  Pass�.... Fut   Inf    Part  Reg2 Subj Subj2
'tenir     t      s ien  en   in   �n   iendr enir   enu   ienn',
'venir     v      s ien  en   in   �n   iendr enir   enu   ienn',
'qu�rir    qu     s ier  �r   i    �    err   �rir   is    i�r',
'v�tir     v�t    S .    .    i    �    ir    ir     u',
'entir     en     s .    t    ti   t�   tir   tir',
'sortir    sor    s .    t    ti   t�   tir   tir',
'partir    par    s .    t    ti   t�   tir   tir',
'vrir      v      e r    r    ri   r�   rir   rir    ert',
'frir      f      e r    r    ri   r�   rir   rir    ert',
'eillir    eill   e .    .    i    �    er    ir',
'^faillir  fa     x u    ill  illi ill� udr   illir',
'^saillir  saill  e .    .    i    �    er    ir',
'aillir    aill   e .    .    i    �    ir    ir',
'illir     .      s .    ill  illi ill� illir illir',
'dormir    dor    s .    m    mi   m�   mir   mir',
'courir    cour   s .    .    u    �    r     ir',
'mourir    m      s eur  our  ouru our� ourr  ourir  ort  eur',
'^asservir asserv s i    iss  i    �    ir    ir',
'servir    ser    s .    v    vi   v�   vir   vir',
'fuir      fu     s i    y    i    �    ir    ir     i    i',
'ou�r      o      s i    y    u�   u�   u�r   u�r    u�   i',
'^g�sir    g      i .    is   -    -    -     �sir   -',
'cevoir    .      s �oi  cev  �u   ��   cevr  cevoir �u   �oiv',
'pourvoir  pourv  s oi   oy   u    �    oir   oir    u    oi',
'savoir    s      s ai   av   u    �    aur   avoir  su   av  ach  ach',
'devoir    d      s oi   ev   u    �    evr   evoir  �    oiv',
'pouvoir   p      x eu   ouv  u    �    ourr  ouvoir u    euv uiss uiss',
'^mouvoir  m      s eu   ouv  u    �    ouvr  ouvoir �    euv',
'mouvoir   m      s eu   ouv  u    �    ouvr  ouvoir u    euv',
'pleuvoir  pl     t eu   euv  u    �    euvr  euvoir u',
'^pr�voir  pr�v   s oi   oy   i    �    oir   oir    u    oi',
'voir      v      s oi   oy   i    �    err   oir    u    oi',
'falloir   fa     t u    ll   llu  ll�  udr   lloir',
'pr�valoir pr�va  x u    l    lu   l�   udr   loir',
'valoir    va     x u    l    lu   l�   udr   loir   lu   l   ill',
'vouloir   v      x eu   oul  oulu oul� oudr  ouloir oulu eul euill',
'asseoir   ass    S ied  ey   i    �    i�r   eoir   is',
'surseoir  surs   s oi   oy   i    �    eoir  eoir   is   oi',
'seoir     s      S ied  ey   i    �    i�r   eoir   is   i�',
'choir     ch     s oi   oy   u    �    err   oir    u    oi',
'prendre   pr     S end  en   i    �    endr  endre  is   enn',
'eindre    ei     s n    gn   gni  gn�  ndr   ndre   nt',
'oindre    oi     s n    gn   gni  gn�  ndr   ndre   nt',
'aindre    ai     s n    gn   gni  gn�  ndr   ndre   nt',
'soudre    so     s u    lv   lu   l�   udr   udre   us',
'coudre    cou    S d    s    si   s�   dr    dre    su',
'moudre    mou    S d    l    lu   l�   dr    dre',
'dre       d      S .    .    i    �    r     re     u',
'foutre    fou    s .    t    ti   t�   tr    tre    tu',
'rompre    romp   s .    .    i    �    r     re     u',
'battre    bat    S .    t    ti   t�   tr    tre    tu',
'mettre    m      S et   ett  i    �    ettr  ettre  is',
'vaincre   vain   S c    qu   qui  qu�  cr    cre    cu',
'raire     ra     s i    y    -    -    ir    ire    it   i',
'faire     f      s ai   ais  i    �    er    aire   ait  ais ass ass',
'taire     t      s ai   ais  u    �    air   aire',
'plaire    pl     i a    ais  u    �    air   aire',
'^na�tre   n      i a    aiss aqui aqu� a�tr  a�tre  �',
'^pa�tre   p      i a    aiss -    -    a�tr  a�tre',
'a�tre     .      i a    aiss u    �    a�tr  a�tre',
'^cro�tre  cr     s o�   oiss �    �    o�tr  o�tre',
'o�tre     .      i o    oiss u    �    o�tr  o�tre',
'croire    cr     s oi   oy   u    �    oir   oire   u    oi',
'boire     b      s oi   uv   u    �    oir   oire   u    oiv',
'^clore    cl     o .    os   -    -    or    ore    os',
'clore     clo    s .    s    -    -    r     re     s',
'^occlure  occl   s u    u    u    �    ur    ure    us',
'^inclure  incl   s u    u    u    �    ur    ure    us',
'clure     cl     s u    u    u    �    ur    ure',
'vivre     v      s i    iv   �cu  �c�  ivr   ivre',
'suivre    sui    s .    v    vi   v�   vr    vre',
'lire      l      s i    is   u    �    ir    ire',
'^maudire  maud   s i    iss  i    �    ir    ire    it',
'dire      d      s i    is   i    �    ir    ire    it',
'crire     cri    s .    v    vi   v�   r     re     t',
'rire      r      s i    i    i    �    ir    ire',
'nuire     nui    s .    s    si   s�   r     re     .',
'luire     nu     s i    is   i    �    ir    ire    i',
'uire      ui     s .    s    si   s�   r     re     t',
'ire       .      s i    is   i    �    ir    ire    t',
'ir        .      s i    iss  i    �    ir    ir',
'^ha�r     ha     s i    �ss  �    �    �r    �r'
);

# D�finit un verbe du premier groupe
sub def1 {
   my $self = shift;
   @$self{(qw(TYPE RAD REG REG2))} = (1, @_); return $self;
}

sub new {
   my ($self, $proto, $flags); local ($_);
   ($proto, $_, $flags) = (@_, '', '');
   my $class = ref $proto || $proto;
   my $inf = $_;

   $self = {FLAGS => $flags}; #XXX
   bless $self, $class;

   $_ eq '�tre' and @{%$self}{qw(TYPE REG PART PASSE PASSE2 FUTUR RAD)} =
      ('�tre', '�t', '�t�', 'fu', 'f�', 'ser', ''), return $self;
   $_ eq 'avoir' and @{%$self}{qw(TYPE REG RAD PASSE PASSE2 FUTUR)} =
      ('avoir', 'av', '', 'eu', 'e�', 'aur'), return $self;
   $_ eq 'aller' and @{%$self}{qw(TYPE REG REG2 RAD FUTUR)} =
      ('aller', 'all', 'aill', '', 'ir'), return $self;

   if (s/er$//) {
      $self->{TYPE} = 1;
      s/e([cmnprsv]|vr)$// and return $self->def1 ($_, "e$1", "�$1");
      s/�(br|c[hr]?|g[lnru]?|[dlmnprsty]|qu|tr|vr)$//
	 and return $self->def1 ($_, "�$1", "�$1");
      s/([cg]|^p|cis|d�mant|�cart|encast|mart|mod)el$//
	 and return $self->def1 ($_ . $1, 'el', '�l');
      s/(ach|b�gu|cors|croch|fil|fur|hal)et$//
	 and return $self->def1 ($_ . $1, 'et', '�t');
      s/e([lt])$// and return $self->def1 ($_."e$1", '', $1);
      s/^(r?env)oy$// and do {
	 $self->{FUTUR} = 'err'; return $self->def1 ($1, 'oy', 'oi') };
      s/([aou])y$// and return $self->def1 ($_ . $1, 'y', 'i');
      return $self->def1 ($_, '', '');
   }

   $self->{$_} = '' for (@index, 'RAD');
   $self->{IRR} = /^(re)?dire$/ ? 1 : /faire$/ ? 2 : 0;
   for my $l (@troisieme_groupe) {
      my ($mod, @a) = split ' ', $l;
      next unless s/$mod$//;
      s/\.// for (@a);
      $self->{TYPE} = 3; $self->{RAD} = $_.shift @a;
      for (@index) { last unless (@a); $self->{$_} = shift @a; }
      return $self;
   }
   return undef;
}

# Pr�pare un radical en c ou g pour l'ajout d'un a ou d'un o
sub prepAO { local $_ = shift; s/c$/�/; s/g$/ge/; $_ }

#### La conjugaison ####

sub indicatif_present {
   my ($self, $p) = @_;
   return undef if $p !~/^[123456]$/;
   return undef if $self->{DES} eq 't' and $p != 3 ;
   for ($self->{TYPE}) {
      $_ eq '�tre'  and return (qw(suis es est sommes �tes sont)) [ $p-1 ];
      $_ eq 'avoir' and return (qw(ai as a avons avez ont)) [ $p-1 ];
      $_ eq 'aller' and return (qw(vais vas va allons allez vont)) [ $p-1 ];
   }
   $p == 4 and return (prepAO $self->{RAD} . $self->{REG}) . 'ons';
   $p == 5 and return $self->{RAD} . ($self->{IRR} ?
      $self->{PRES} . 'tes' : $self->{REG} . 'ez');
   $p == 6 and return $self->{RAD} . ($self->{IRR} >= 2 ?
      'ont' :  ($self->{REG2} || $self->{REG}) . 'ent');
   my $t = ($self->{TYPE} == 1) ? (qw(e es e)) [ $p-1 ]
      : $desinences{$self->{DES}}->[ $p-1 ];
   my $s = ( exists $self->{PRES} ) ?  $self->{PRES}
      :  $self->{REG2} || $self->{REG};
   return $self->{RAD} . $s . $t;
}

sub indicatif_imparfait {
   my ($self, $p) = @_;
   return undef if $p !~/^[123456]$/;
   return undef if $self->{DES} eq 't' and $p != 3;
   $p == 4 and return $self->{RAD} . $self->{REG} . 'ions';
   $p == 5 and return $self->{RAD} . $self->{REG} . 'iez';
   return (prepAO $self->{RAD} . $self->{REG}) .
      (qw(ais ais ait - - aient)) [ $p-1 ];
}

sub infinitif {
   my $self = shift;
   $self->{TYPE} == 1 and return $self->{RAD} . $self->{REG} . 'er';
   $self->{TYPE} == 3 and return $self->{RAD} . $self->{INF};
   return $self->{TYPE};
}

sub passe_simple {
   my ($self, $p) = @_;
   return undef if $p !~/^[123456]$/ or $self->{PASSE} eq '-';
   return undef if $self->{DES} eq 't' and $p != 3;
   if ($self->{TYPE} eq 1 or $self->{TYPE} eq 'aller') {
      $p == 6 and return $self->{RAD} . $self->{REG} . '�rent';
      return (prepAO $self->{RAD} . $self->{REG})
	 . (qw(ai as a �mes �tes)) [ $p-1 ];
   }
   $p == 4 and return $self->{RAD} . $self->{PASSE2} . 'mes';
   $p == 5 and return $self->{RAD} . $self->{PASSE2} . 'tes';
   return $self->{RAD} . $self->{PASSE} . (qw(s s t - - rent)) [ $p-1 ];
}

sub futur_simple {
   my ($self, $p) = @_;
   return undef if $p !~/^[123456]$/ or $self->{FUTUR} eq '-';
   return undef if $self->{DES} eq 't' and $p != 3;
   return $self->{RAD}
      . ($self->{FUTUR} || ($self->{REG2} || $self->{REG}) . 'er')
      . (qw(ai as a ons ez ont)) [ $p-1 ];
}

sub participe_passe {
   my $self = shift;
   my $t = $self->{PART} || $self->{PASSE} || $self->{REG} . '�';
   return undef if $t eq '-';
   return $self->{RAD} . $t;
}

sub subjonctif_present {
   my ($self, $p) = @_;
   return undef if $p !~/^[123456]$/ or $self->{SUBJ} eq '-';
   return undef if $self->{DES} eq 't' and $p != 3;
   for ($self->{TYPE}) {
      /�tre/  and return (qw(sois sois soit soyons soyez soient)) [ $p-1 ];
      /avoir/ and return (qw(aie aies ait ayons ayez aient)) [ $p-1 ];
   }
   $p == 4 and return $self->{RAD} . ($self->{SUBJ2} || $self->{REG}) . 'ions';
   $p == 5 and return $self->{RAD} . ($self->{SUBJ2} || $self->{REG}) . 'iez';
   my $t = $self->{SUBJ} || $self->{REG2} || $self->{REG};
   return $self->{RAD} . $t . (qw(e es e - - ent)) [ $p-1 ];
}

sub subjonctif_imparfait {
   my ($self, $p) = @_;
   return undef if $p !~/^[123456]$/ or $self->{PASSE} eq '-';
   return undef if $self->{DES} eq 't' and $p != 3;
   $p == 3 and do {
      $self->{PASSE2} and return $self->{RAD} . $self->{PASSE2} . 't';
      return (prepAO $self->{RAD} . $self->{REG}) . '�t';
   };
   my $r = $self->{PASSE} ? $self->{RAD} . $self->{PASSE}
      : (prepAO $self->{RAD} . $self->{REG}) . 'a';
   return $r . 'ss' . (qw(e es - ions iez ent)) [ $p-1 ];
}

sub conditionnel_present {
   my ($self, $p) = @_;
   return undef if $p !~/^[123456]$/ or $self->{FUTUR} eq '-';
   return undef if $self->{DES} eq 't' and $p != 3;
   return $self->{RAD}
      . ($self->{FUTUR} || ($self->{REG2} || $self->{REG}) . 'er')
      . (qw(ais ais ait ions iez aient)) [ $p-1 ];
}

sub participe_present {
   my $self = shift;
   return 'ayant' if $self->{TYPE} eq 'avoir';
   return (prepAO $self->{RAD} . $self->{REG}) . 'ant';
}

1;
