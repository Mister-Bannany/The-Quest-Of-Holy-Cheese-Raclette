CC = gcc
BUILD = release
ifeq ($(BUILD), release)
	CCFLAGS_OBJ = -O3 -Wall -m64 -I include
	EXEC = bin/release/main
else
	ifeq ($(BUILD), debug)
		CCFLAGS_OBJ = -g -Wall -m64 -I include
		EXEC = bin/debug/main
	endif
endif

CCFLAGS = -L lib -lglfw3 -lopengl32 -lUser32 -lGdi32 -lShell32
SRC = $(wildcard src/*.c src/*/*.c)
OBJ = $(SRC:.c=.o)

all : $(EXEC)

debug : 
	make "BUILD = debug"

release :
	make "BUILD = release"

%.o : %.c
	$(CC) -c $< $(CCFLAGS_OBJ) -o $@

$(EXEC) : $(OBJ)
	$(CC) $^ -o $@ $(CCFLAGS)
