# Oxygen-Sweep
Oxygen Sweep is a grid-based C64 game where the player navigates cave-like levels, collecting ore while managing a limited oxygen supply.

## Author
Markis

## Folder structure

```
\       -> root dir
\bin    -> converted programs
\d64    -> d64 disk
\src    -> source programs
```

## bash Script

The root folder contains three bash scripts to convert and run c64 basic v2 programs. To use these scripts install [Vice](https://vice-emu.sourceforge.io/)

*convertAll.sh*: to convert all the src files between ASCII, PETSCII and tokenized BASIC and place the output in bin.

*run.sh*: to run a prg using Vice

Run this script using this command:

```bash
bash run.sh helloworld.prg
```

*created64.sh*: to create a d64 image disk containing all the converted prg
