# R3DOS

R3DOS est un projet de système d'exploitation développé en C et en x86asm. Le seul est unique but de cette OS est de découvrir le fonctionnement d'un système d'exploitation.

## Présentation

R3DOS est développé à partir de C et de x86asm.
L'OS étant développé dans un but éducatif, il n'est donc recommandé de l'installé sur du matériel, mais plutôt de passé par une machine virtuelle.

## Installation

Pour installer le projet, suivez la procédure suivante qui vous guidera vers un projet fonctionnel et à jour.

### Pré-requis

Le projet n'est valide que sous Windows. Le makefile n'est en effet pas configurer pour les machines Linux.

Des logiciels tiers doivent être installer pour pouvoir build et lancer le projet.

#### make

make est un outils de construction de fichier automatique. Télécharger et installer [GnuWin32](http://gnuwin32.sourceforge.net/packages/make.htm) en version "Complete package, except sources".

Une fois l'installation terminer, ajouter make.exe dans GnuWin32/bin aux variable environement de votre système.

#### nasm

nasm est un compilateur de code assembleur x86asm.