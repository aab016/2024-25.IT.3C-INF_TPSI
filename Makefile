# The first target is selected, because the first target is the default target

# Variables can only be strings.
cakes_folder = cakes/
# recursive (use =) - only looks for the variables when the command is used, not when it's defined.
# simply expanded (use :=) - like normal imperative programming -- only those defined so far get expanded
# Spaces at the end of a line are not stripped, but those at the start are.

# The default shell is /bin/sh
SHELL=/bin/bash


gcc -c header.c -o header.o
gcc header.o test.c
nel file header solo definizione e costanti

blah: blah.c
# blah doesn't exist, or blah.c is newer than blah
	cc blah.c -o blah

hello:
# https://makefiletutorial.com/
# We'll then run make hello. As long as the hello file does not exist, the commands will run. If hello does exist, no commands will run.
# Each command is run in a new shell (or at least the effect is as such)
	@echo "Hello, World from makefile"
	@echo "CODESPACE_NAME ENV value: $$CODESPACE_NAME"
	mkdir $(cakes_folder)
	touch ${cakes_folder}hello
	ls -la $(cakes_folder)
	touch hello

# Adding .PHONY to a target will prevent Make from confusing the phony target with a file name.
# make will not look at a "clean" file created
.PHONY: clean
clean:
	rm -f hello
	rm -Rf ${cakes_folder}

