# Compile & Linking the hard way

```
source code   > object code > executable

text          > binary      > binary
moon.c        > moon.o      > a.out

compile       > linking     > execute
gcc -c moon.c > gcc moon.o  > ./a.out
```

## ELF format

### WHAT
Executable and Linkable Format (ELF, formerly named Extensible Linking Format) is a common standard file format for executable files, **object code**, shared libraries, and core dumps.

### OBJECT CODE
In computing, object code or object module is the product of an assembler or compiler.
[...] object code is a sequence of statements or instructions in a computer language, usually a machine code language [...]
Object files can in turn be linked to form an executable file or library file. In order to be used, object code must either be placed in an executable file, a library file, or an object file.

### ELF header

https://en.wikipedia.org/wiki/Executable_and_Linkable_Format#cite_ref-4

| Offset     | size        | Field       | Purpose                      |
| ---------  | ----------- | ----------- | -----------                  |
| 0x10       | 2           | e_type      | Identifies object file type. |
		
Field e_type values:
| Value       | Type        | Meaning           |
| ----------- | ----------- | -----------       |
| 0x01        | ET_REL      | Relocatable file. |
| 0x02        | ET_EXEC     | Executable file.  |
| 0x03	      | ET_DYN      | Shared object.    |

Read ELF header with `readelf -h a.out`

### Examples

Shared object: 0x03 @ 0x10 _ET_DYN_ as type.
```
00000000: 7f45 4c46 0201 0100 0000 0000 0000 0000  .ELF............
00000010: 0300 3e00 0100 0000 5010 0000 0000 0000  ..>.....P.......
```

Executable file: 0x02 @ 0x10 _ET_EXEC_ as type.
```
00000000: 7f45 4c46 0201 0100 0000 0000 0000 0000  .ELF............
00000010: 0200 3e00 0100 0000 4010 4000 0000 0000  ..>.....@.@.....
```

Relocatable file: 0x01 @ 0x10 _ET_REL_ as type.
```
00000000: 7f45 4c46 0201 0100 0000 0000 0000 0000  .ELF............
00000010: 0100 3e00 0100 0000 0000 0000 0000 0000  ..>.............
```
NB: 0000 0000 0000 0000 0000 @ 0x18 means _the file doesn't have an associated entry point_, it's not executable!





## gcc PIE
https://stackoverflow.com/a/34522357

It sounds like your GCC is configured to build -pie binaries by default. These binaries really are shared libraries (of type ET_DYN), except they run just like a normal executable would.

https://gcc.gnu.org/onlinedocs/gnat_ugn/Position-Independent-Executable-PIE-Enabled-by-Default-on-Linux.html

GNAT generates **Position Independent Executable** (PIE) code by default. PIE binaries are loaded into random memory locations, introducing an additional layer of protection against attacks.

If you are not interested in building PIE binaries, you can simply turn this feature off by first compiling your code with -fno-pie and then by linking with -no-pie (note the subtle but important difference in the names of the switches – the linker switch does ‘not’ have an f after the dash!).
