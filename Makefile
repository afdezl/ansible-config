.PHONY: ${TARGETS}

local:
	ansible-playbook -K laptop.yml

raspberry:
	ansible-playbook raspberry.yml
