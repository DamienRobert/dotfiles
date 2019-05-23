package Verbe;

use strict;
use vars qw(%desinences @troisieme_groupe @index);
%desinences = (e => [qw(e es e)], s => [qw(s s t)], x => [qw(x x t)],
   S => ['s', 's', ''], t => ['', '', 't'],
   i=> [qw(is is ît)], o => [qw(os os ôt)] );

@index= qw(DES PRES REG PASSE PASSE2 FUTUR INF PART REG2 SUBJ SUBJ2);
@troisieme_groupe = (
#Il comprend aussi les verbes du deuxième groupe (à la fin).
#Modèle    Rad    D Prés Reg  Passé.... Fut   Inf    Part  Reg2 Subj Subj2
'tenir     t      s ien  en   in   în   iendr enir   enu   ienn',
'venir     v      s ien  en   in   în   iendr enir   enu   ienn',
'quérir    qu     s ier  ér   i    î    err   érir   is    ièr',
'vêtir     vêt    S .    .    i    î    ir    ir     u',
'entir     en     s .    t    ti   tî   tir   tir',
'sortir    sor    s .    t    ti   tî   tir   tir',
'partir    par    s .    t    ti   tî   tir   tir',
'vrir      v      e r    r    ri   rî   rir   rir    ert',
'frir      f      e r    r    ri   rî   rir   rir    ert',
'eillir    eill   e .    .    i    î    er    ir',
'^faillir  fa     x u    ill  illi illî udr   illir',
'^saillir  saill  e .    .    i    î    er    ir',
'aillir    aill   e .    .    i    î    ir    ir',
'illir     .      s .    ill  illi illî illir illir',
'dormir    dor    s .    m    mi   mî   mir   mir',
'courir    cour   s .    .    u    û    r     ir',
'mourir    m      s eur  our  ouru ourû ourr  ourir  ort  eur',
'^asservir asserv s i    iss  i    î    ir    ir',
'servir    ser    s .    v    vi   vî   vir   vir',
'fuir      fu     s i    y    i    î    ir    ir     i    i',
'ouïr      o      s i    y    uï   uï   uïr   uïr    uï   i',
'^gésir    g      i .    is   -    -    -     ésir   -',
'cevoir    .      s çoi  cev  çu   çû   cevr  cevoir çu   çoiv',
'pourvoir  pourv  s oi   oy   u    û    oir   oir    u    oi',
'savoir    s      s ai   av   u    û    aur   avoir  su   av  ach  ach',
'devoir    d      s oi   ev   u    û    evr   evoir  û    oiv',
'pouvoir   p      x eu   ouv  u    û    ourr  ouvoir u    euv uiss uiss',
'^mouvoir  m      s eu   ouv  u    û    ouvr  ouvoir û    euv',
'mouvoir   m      s eu   ouv  u    û    ouvr  ouvoir u    euv',
'pleuvoir  pl     t eu   euv  u    û    euvr  euvoir u',
'^prévoir  prév   s oi   oy   i    î    oir   oir    u    oi',
'voir      v      s oi   oy   i    î    err   oir    u    oi',
'falloir   fa     t u    ll   llu  llû  udr   lloir',
'prévaloir préva  x u    l    lu   lû   udr   loir',
'valoir    va     x u    l    lu   lû   udr   loir   lu   l   ill',
'vouloir   v      x eu   oul  oulu oulû oudr  ouloir oulu eul euill',
'asseoir   ass    S ied  ey   i    î    iér   eoir   is',
'surseoir  surs   s oi   oy   i    î    eoir  eoir   is   oi',
'seoir     s      S ied  ey   i    î    iér   eoir   is   ié',
'choir     ch     s oi   oy   u    û    err   oir    u    oi',
'prendre   pr     S end  en   i    î    endr  endre  is   enn',
'eindre    ei     s n    gn   gni  gnî  ndr   ndre   nt',
'oindre    oi     s n    gn   gni  gnî  ndr   ndre   nt',
'aindre    ai     s n    gn   gni  gnî  ndr   ndre   nt',
'soudre    so     s u    lv   lu   lû   udr   udre   us',
'coudre    cou    S d    s    si   sî   dr    dre    su',
'moudre    mou    S d    l    lu   lû   dr    dre',
'dre       d      S .    .    i    î    r     re     u',
'foutre    fou    s .    t    ti   tî   tr    tre    tu',
'rompre    romp   s .    .    i    î    r     re     u',
'battre    bat    S .    t    ti   tî   tr    tre    tu',
'mettre    m      S et   ett  i    î    ettr  ettre  is',
'vaincre   vain   S c    qu   qui  quî  cr    cre    cu',
'raire     ra     s i    y    -    -    ir    ire    it   i',
'faire     f      s ai   ais  i    î    er    aire   ait  ais ass ass',
'taire     t      s ai   ais  u    û    air   aire',
'plaire    pl     i a    ais  u    û    air   aire',
'^naître   n      i a    aiss aqui aquî aîtr  aître  é',
'^paître   p      i a    aiss -    -    aîtr  aître',
'aître     .      i a    aiss u    û    aîtr  aître',
'^croître  cr     s oî   oiss û    û    oîtr  oître',
'oître     .      i o    oiss u    û    oîtr  oître',
'croire    cr     s oi   oy   u    û    oir   oire   u    oi',
'boire     b      s oi   uv   u    û    oir   oire   u    oiv',
'^clore    cl     o .    os   -    -    or    ore    os',
'clore     clo    s .    s    -    -    r     re     s',
'^occlure  occl   s u    u    u    û    ur    ure    us',
'^inclure  incl   s u    u    u    û    ur    ure    us',
'clure     cl     s u    u    u    û    ur    ure',
'vivre     v      s i    iv   écu  écû  ivr   ivre',
'suivre    sui    s .    v    vi   vî   vr    vre',
'lire      l      s i    is   u    û    ir    ire',
'^maudire  maud   s i    iss  i    î    ir    ire    it',
'dire      d      s i    is   i    î    ir    ire    it',
'crire     cri    s .    v    vi   vî   r     re     t',
'rire      r      s i    i    i    î    ir    ire',
'nuire     nui    s .    s    si   sî   r     re     .',
'luire     nu     s i    is   i    î    ir    ire    i',
'uire      ui     s .    s    si   sî   r     re     t',
'ire       .      s i    is   i    î    ir    ire    t',
'ir        .      s i    iss  i    î    ir    ir',
'^haïr     ha     s i    ïss  ï    ï    ïr    ïr'
);

# Définit un verbe du premier groupe
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

   $_ eq 'être' and @{%$self}{qw(TYPE REG PART PASSE PASSE2 FUTUR RAD)} =
      ('être', 'ét', 'été', 'fu', 'fû', 'ser', ''), return $self;
   $_ eq 'avoir' and @{%$self}{qw(TYPE REG RAD PASSE PASSE2 FUTUR)} =
      ('avoir', 'av', '', 'eu', 'eû', 'aur'), return $self;
   $_ eq 'aller' and @{%$self}{qw(TYPE REG REG2 RAD FUTUR)} =
      ('aller', 'all', 'aill', '', 'ir'), return $self;

   if (s/er$//) {
      $self->{TYPE} = 1;
      s/e([cmnprsv]|vr)$// and return $self->def1 ($_, "e$1", "è$1");
      s/é(br|c[hr]?|g[lnru]?|[dlmnprsty]|qu|tr|vr)$//
	 and return $self->def1 ($_, "é$1", "è$1");
      s/([cg]|^p|cis|démant|écart|encast|mart|mod)el$//
	 and return $self->def1 ($_ . $1, 'el', 'èl');
      s/(ach|bégu|cors|croch|fil|fur|hal)et$//
	 and return $self->def1 ($_ . $1, 'et', 'èt');
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

# Prépare un radical en c ou g pour l'ajout d'un a ou d'un o
sub prepAO { local $_ = shift; s/c$/ç/; s/g$/ge/; $_ }

#### La conjugaison ####

sub indicatif_present {
   my ($self, $p) = @_;
   return undef if $p !~/^[123456]$/;
   return undef if $self->{DES} eq 't' and $p != 3 ;
   for ($self->{TYPE}) {
      $_ eq 'être'  and return (qw(suis es est sommes êtes sont)) [ $p-1 ];
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
      $p == 6 and return $self->{RAD} . $self->{REG} . 'èrent';
      return (prepAO $self->{RAD} . $self->{REG})
	 . (qw(ai as a âmes âtes)) [ $p-1 ];
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
   my $t = $self->{PART} || $self->{PASSE} || $self->{REG} . 'é';
   return undef if $t eq '-';
   return $self->{RAD} . $t;
}

sub subjonctif_present {
   my ($self, $p) = @_;
   return undef if $p !~/^[123456]$/ or $self->{SUBJ} eq '-';
   return undef if $self->{DES} eq 't' and $p != 3;
   for ($self->{TYPE}) {
      /être/  and return (qw(sois sois soit soyons soyez soient)) [ $p-1 ];
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
      return (prepAO $self->{RAD} . $self->{REG}) . 'ât';
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
