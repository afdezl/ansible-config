.PHONY: ${TARGETS}

install:
	ansible-playbook -i '127.0.0.1,' -K local.yml
