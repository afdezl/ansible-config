.PHONY: ${TARGETS}

local:
	ansible-playbook -K local.yml

raspberry:
	ansible-playbook raspberry.yml
