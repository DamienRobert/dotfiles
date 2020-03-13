vim: ft=markdownlight fdm=expr

# Documentation

* can build pack and docker images: https://guix-hpc.bordeaux.inria.fr/blog/2017/10/using-guix-without-being-root/

* Install
- https://git.savannah.gnu.org/cgit/guix.git/plain/etc/guix-install.sh

* Liens:
- https://guix.gnu.org/cookbook/en/
- https://guix.gnu.org/blog/2019/guix-reduces-bootstrap-seed-by-50/
- https://guix.gnu.org/blog/2019/guix-profiles-in-practice/

# Usage sur plafrim

GNU Guix est désormais disponible sur PlaFRIM.  Guix permet d’installer
des logiciels parmi plus de 7000 paquets sans droits d’administrateur,
le plus souvent sans recompilation et de façon reproductible.  Exemples :

  # Installer hwloc et GCC 7.
  guix package -i hwloc gcc-toolchain

  # Mettre à jour la liste des paquets (prend ~10 mn).
  guix pull

  # Mettre à jour les paquets précédemment installés.
  guix package -u

  # Chercher des solutionneurs.
  guix package -s sparse -s solver | less

Ces commandes peuvent être exécutées sur un nœud « devel » sans gêner
les autres usagers.  Les logiciels installés apparaissent dans
~/.guix-profile par défaut.

Plus d’infos pratiques sur :

  https://gnu.org/software/guix/manual/html_node/Invoking-guix-package.html

Cette installation en est encore au stade expérimental et vos retours
sont donc les bienvenus !  Cette démarche s’inscrit dans le cadre du
projet Guix-HPC :

  https://guix-hpc.bordeaux.inria.fr/

# Nix

Docs:
- https://christine.website/blog/i-was-wrong-about-nix-2020-02-10
  https://christine.website/blog/how-i-start-nix-2020-03-08

Alternatives to the nix dsl:
- https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-nix
- https://github.com/haskell-nix/hnix/blob/master/src/Nix/Type/README.md

Tools:
- https://github.com/target/lorri
  Your project's nix-env
  https://www.tweag.io/posts/2019-03-28-introducing-lorri.html
  -> replaces nix-shell by using direnv to dynamically change the env variables
  (https://direnv.net/ direnv – unclutter your .profile
  direnv checks for the existence of a .envrc)
- https://github.com/nmattia/niv
  Easy dependency management for Nix projects
  Wrapper around nix language to add a project
  $ niv init
  bootstraps a Nix project, in particular creates a nix/sources.json file containing niv and nixpkgs as well as a nix/sources.nix file that returns the sources as a Nix object.
- https://cachix.org/
  Cache for nix packages
