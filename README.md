# curl-test-script

# Hypothèses et décisions technique

L'objectif est de créer un outil prêt pour la production qui automatisera la mise à jour d'un millier de lecteurs de musique en utilisant une API qu'il ne sera pas nécessaire de créer.
L'outil doit pouvoir être utilisé sur les différents systèmes d'exploitation (Windows, MacOs et Linux).

Afin d'y parvenir, il est nécessaire de parser le fichier .csv et de récupérer les différentes mac_address qui seront stockées dans une variable.
Ces mac_address des lecteurs seront à mettre à jour. 
Afin d'envoyer les données brutes au format json, la commande Curl (Client URL) https peut être utilisée. Elle permet d'effectuer des appels HTTP.

Afin d'automatiser l'exécution de toutes ces commandes utilisable sur tous les systèmes d'exploitation, 

Un script shell se présente sous la forme d'un fichier qui seront exécutées de manière séquentielle.
Ces arguments cités ci dessus motivent mon choix de coder en shell.

La commande curl est utilisée comme suit 

```
curl -X PUT -H "Content-Type: application/json" -d @FILENAME DESTINATION
```

Etant développeur embarqué temps réel, c'est grâce à des recherches que j'ai pu fournir cette solution. 

# Comment utiliser l'outil ?

Pour utiliser l'outil, il faut installer un shell sur n'importe quel système d'exploitation.
En entrée, il faut un fichier .csv avec les addresses MAC et un fichier .json avec un header et un body.

Il faudra lancer la commande :
```
./script.sh arg1 arg2
```

arg1 correspond au fichier .csv contenant la liste des adresses MAC, et arg2 au fichier .json correspondant aux différentes versions d'application.

# Comment construire et comment exécuter des tests

Faire des tests unitaires consiste à s'assurer du fonctionnement d'une partie déterminée d'un logiciel.
Dans mon cas, pour faire les tests unitaires, je pourrai utiliser le framework shunit2.

```
#! /bin/sh
# file: test_Octave/unit_test.sh

testEquality() {
  assertEquals 1 1
}

# Load shUnit2.
source shunit2
```