
az login

cd config

$tfdir="../deploy/terraform"

terraform init $tfdir

terraform plan --var-file=singleHANA.json $tfdir

terraform apply --var-file=singleHANA.json  --auto-approve $tfdir


terraform destroy --var-file=singleHANA.json --auto-approve $tfdir


ansible-playbook -i hosts.yml sap-hana/deploy/ansible/sap_playbook.yml

#Copy file
ansible -i hosts  -m copy -a "src = sap-hana/deploy/ansible/test_playbook dest = sap-hana/deploy/ansible/test_playbook"
ansible abc -m copy -a "src = /etc/yum.conf dest = /tmp/yum.conf"