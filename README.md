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

Une fois l'installation terminer, ajouter make.exe dans GnuWin32/bin aux variables d'environnement de votre système.

#### nasm

nasm est un compilateur de code assembleur x86asm. Il peut-être télécharger [ici](https://nasm.us/). La dernière version stable suffira.

De la même manière que vous l'avais fait pour make, ajouter nasm à vos variables d'environnement.

### gcc

gcc est un compilateur de code C. Il est disponible sous forme de package avec d'autres outils. Installez [mingw64](https://sourceforge.net/projects/mingw-w64/).

Ajouter le dossier bin de mingw à vos variables environnement afin d'avoir acces au diffèrent outils.

### Installation et lancement du projet

Maintenant que les différents outils nécéssaire à l'installation du projet sont installés, passons à l'installation du projet même. Ouvrez un terminal : 

> git clone https://github.com/MrScriptX/OS

Votre projet est pret à être ouvert dans votre IDE préféré.

Pour lancer le projet : à l'aide d'un terminal faites

> make run

Qemu devrait s'ouvrir et lancer le système d'exploitation.

Si vous souhaitez nettoyer le dossier de build pour une quelconque raison, faites :

> make clean


L'installation est terminé ! Si vous avez des questions ou remarque, n'hésité pas à ouvrir un issue [github](https://github.com/MrScriptX/OS/issues), je ferais mon possible pour y repondre au plus vite.

Amusez-vous bien !