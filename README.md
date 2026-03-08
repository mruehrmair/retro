# Retro

Small retro computing projects, mainly for the Commodore 64


## Toolchain commands

Some helpful commands using [Vice](https://vice-emu.sourceforge.io/)

### Extract BASIC source code from a prg on a disc image
    c1541 disk.d64 -list
    c1541 disk.d64 -read "MYBASIC" mybasic.prg
    petcat -2 -o mybasic.bas -- mybasic.prg


### Attach prg to a disc image (delete existing file first c1541 will complain otherwise) 
    c1541 -attach game.d64 -delete game
    c1541 -attach game.d64 -write game.prg game
