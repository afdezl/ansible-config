.PHONY: ${TARGETS}

laptop:
	ansible-playbook -K laptop.yml -v

raspberry:
	ansible-playbook raspberry.yml -v
