CC=gcc
vulnerable: vulnerable.c
	$(CC) -o vulnerable vulnerable.c -no-pie -fno-stack-protector -z execstack -w
	# -o vulnerable: Output file name
	# vulnerable.c: Input source file
	# -no-pie: Disable position-independent executable
	# -fno-stack-protector: Disable stack protection
	# -z execstack: Mark the stack as executable

.PHONY: clean
clean:
	rm -f vulnerable