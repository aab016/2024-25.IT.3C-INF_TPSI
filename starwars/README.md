ELF WHAT ELSE
Executable and Linkable Format (ELF, formerly named Extensible Linking Format) is a common standard file format for executable files, object code, shared libraries, and core dumps.

THEN OBJECT CODE
In computing, object code or object module is the product of an assembler or compiler.
[...] object code is a sequence of statements or instructions in a computer language,[2] usually a machine code language [...]
Object files can in turn be linked to form an executable file or library file. In order to be used, object code must either be placed in an executable file, a library file, or an object file.

0x10	2	e_type

0x01	ET_REL	Relocatable file.
0x02	ET_EXEC	Executable file.
0x03	ET_DYN	Shared object.

https://stackoverflow.com/a/34522357
Nothing.

It sounds like your GCC is configured to build -pie binaries by default. These binaries really are shared libraries (of type ET_DYN), except they run just like a normal executable would.

https://gcc.gnu.org/onlinedocs/gnat_ugn/Position-Independent-Executable-PIE-Enabled-by-Default-on-Linux.html
GNAT generates Position Independent Executable (PIE) code by default. PIE binaries are loaded into random memory locations, introducing an additional layer of protection against attacks.

If you are not interested in building PIE binaries, you can simply turn this feature off by first compiling your code with -fno-pie and then by linking with -no-pie (note the subtle but important difference in the names of the switches – the linker switch does ‘not’ have an f after the dash!).
