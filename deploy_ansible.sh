#!/bin/bash

# Arrêter le script si une commande échoue
set -e

echo "==========================================="
echo "   DÉMARRAGE DU DÉPLOIEMENT MANUEL (ANSIBLE)"
echo "==========================================="

# 1. Déploiement du Firewall
echo "[1/3] Exécution du playbook Firewall..."
ansible-playbook playbooks/deploy_firewall.yaml

# 2. Déploiement du Load Balancer
echo "[2/3] Exécution du playbook Load Balancer..."
ansible-playbook playbooks/deploy_loadbalancer.yaml

# 3. Déploiement du Web Server
echo "[3/3] Exécution du playbook Web Server..."
ansible-playbook playbooks/deploy_webserver.yaml

echo "==========================================="
echo "   DÉPLOIEMENT TERMINÉ AVEC SUCCÈS"
echo "==========================================="

# Vérification finale
echo "État des conteneurs :"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"