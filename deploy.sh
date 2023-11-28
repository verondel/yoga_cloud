#!/bin/bash

cd terraform
terraform init
terraform apply -auto-approve

cd ../ansible

echo "Вера, planet отключен? Запускаю ansible-playbook playbook.yml? [y/n]: "
read -r confirmation


if [[ $confirmation == "y" || $confirmation == "yes" ]]; then
    ansible-playbook playbook.yml
else
    echo "Отменено пользователем."
fi

