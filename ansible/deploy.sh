#!/bin/bash
ansible-playbook -i hosts 1_2_3_4_ejecutar.yaml
ansible-playbook -i hosts 5_instalar_worker_parte1.yaml
ansible-playbook -i hosts 6_instalar_worker_parte2.yaml
ansible-playbook -i hosts 7_instalar_Jenkins.yaml
