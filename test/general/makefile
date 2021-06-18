#
# makefile for crexx programs

.rexx.rxbin:
	rxc $*
	rxas $*
	rxdas $*
	rxvm $*

RX_SRC		:= $(wildcard *.rexx)
RX_OBJS		:= $(RX_SRC:.rexx=.rxbin)

.SUFFIXES: .rexx .rxas .rxbin

#
# target all compiles
#
all::	$(RX_OBJS)

#
# target clean removes compiled products
#
.PHONY: clean
clean: 
	rm -f *.rxbin	
	find . -name "*.rexx" | awk '{$$2 = $$1 ; sub ( /\.rexx/,".rxas",$$1 ) ; print $$1 }' | xargs rm -f
