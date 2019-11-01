#enable 64bits target
set $64BITS = 1

set confirm off
set verbose off

set output-radix 0x10
set input-radix 0x10

#never pause output
set height 0
set width 0

#intel style asm
set disassembly-flavor intel

set $SHOW_CONTEXT = 1
set $SHOW_NEST_INSN = 0

set $CONTEXTSIZE_STACK = 6
set $CONTEXTSIZE_DATA  = 8
set $CONTEXTSIZE_CODE  = 8

set $SHOWOBJECTIVEC = 1
set $SHOWCPUREGISTERS = 1
set $SHOWSTACK = 0
set $SHOWDATAWIN = 0

#load from anywhere
set auto-load safe-path /

