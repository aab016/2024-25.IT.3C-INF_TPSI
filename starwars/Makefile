# https://makefiletutorial.com/

# Variables can only be strings.
# recursive (use =) - only looks for the variables when the command is used, not when it's defined.
# simply expanded (use :=) - like normal imperative programming -- only those defined so far get expanded
# Spaces at the end of a line are not stripped, but those at the start are.
executable_folder = bin/
object_code_folder = tmp/

STAWARS_EXECUTABLE := $(executable_folder)starwars
JEDI_OBJECT := $(object_code_folder)jedi.o
TATOOINE_OBJECT := $(object_code_folder)tatooine.o

# The default shell is /bin/sh
SHELL=/bin/bash

# The first target is selected, because the first target is the default target
# Adding .PHONY to a target will prevent Make from confusing the phony target with a file name.
# make will not look at a "execute" file created
.PHONY: execute
execute: $(STAWARS_EXECUTABLE)
	@echo "Execute"
	./$(STAWARS_EXECUTABLE)
	@echo ""
	@echo "Execute end on `date`"

$(executable_folder):
	mkdir -p $(executable_folder)

$(object_code_folder):
	mkdir -p $(object_code_folder)

# order-only-prerequisites "|" exec them but do not trigger the target if changed
# https://www.gnu.org/savannah-checkouts/gnu/make/manual/html_node/Prerequisite-Types.html#Prerequisite-Types
$(STAWARS_EXECUTABLE): $(TATOOINE_OBJECT) $(JEDI_OBJECT) | $(executable_folder)
# bin/starwars doesn't exist, or tmp/tatooine.o or tmp/jedi.o are newer than bin/starwars
# $@ Outputs the target name
	@echo "Linking to $@ because $? are changed"
	gcc $(TATOOINE_OBJECT) $(JEDI_OBJECT) -o $(STAWARS_EXECUTABLE)
	@chmod +x $(STAWARS_EXECUTABLE)
	@ls -la $(STAWARS_EXECUTABLE)

# order-only-prerequisites "|" exec them but do not trigger the target if changed
# https://www.gnu.org/savannah-checkouts/gnu/make/manual/html_node/Prerequisite-Types.html#Prerequisite-Types
$(TATOOINE_OBJECT): tatooine.c | $(object_code_folder)
# tmp/tatooine.o doesn't exist, or tatooine.c is newer than tmp/tatooine.o
# $^ Outputs all prerequisites
	@echo "Compiling $^ because $? are changed"
	gcc -c tatooine.c -o $(TATOOINE_OBJECT)
	@ls -la $(TATOOINE_OBJECT)

# order-only-prerequisites "|" exec them but do not trigger the target if changed
# https://www.gnu.org/savannah-checkouts/gnu/make/manual/html_node/Prerequisite-Types.html#Prerequisite-Types
$(JEDI_OBJECT): jedi.c | $(object_code_folder)
# tmp/jedi.o doesn't exist, or jedi.c is newer than tmp/jedi.o
# $< Outputs the first prerequisite
	@echo "Compiling $< because $? are changed"
	gcc -c jedi.c -o $(JEDI_OBJECT)
	@ls -la $(JEDI_OBJECT)

# Adding .PHONY to a target will prevent Make from confusing the phony target with a file name.
# make will not look at a "clean" file created
.PHONY: clean
clean:
	rm -fR $(executable_folder)
	rm -fR $(object_code_folder)

