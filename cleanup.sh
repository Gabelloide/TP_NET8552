#!/bin/bash

echo "==========================================="
echo "   NETTOYAGE DE L'ENVIRONNEMENT"
echo "==========================================="

# Liste des conteneurs à supprimer
CONTAINERS="vnf-firewall vnf-lb vnf-web"

for vnf in $CONTAINERS; do
    if [ "$(docker ps -aq -f name=$vnf)" ]; then
        echo "Suppression du conteneur : $vnf"
        docker rm -f $vnf
    else
        echo "Conteneur $vnf introuvable ou déjà supprimé."
    fi
done

echo "==========================================="
echo "   NETTOYAGE TERMINÉ"
echo "==========================================="