.PHONY: ${TARGETS}


install: bootstrap requirements

requirements:
	@echo ""
	@echo "installing galaxy requirements"
	@echo ""
	ansible-galaxy install -r requirements.yml

bootstrap:
	@echo ""
	@echo "downloading and installing Ansible"
	@echo ""
	sudo apt-get install -y software-properties-common
	sudo apt-get update
	sudo apt-get install -y ansible

laptop:
	ansible-playbook -K laptop.yml -v

raspberry:
	ansible-playbook raspberry.yml -v

