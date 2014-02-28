PLATFORM =
#Uncomment to force 64 or 32 bit platform
#PLATFORM = -m64
#PLATFORM = -m32
CC = gcc
CFLAGS = $(PLATFORM) -O3 -Wall -fPIC
LFLAGS = $(PLATFORM) -shared
OBJS = unqlite.o

libunqlite.so: $(OBJS)
	$(CC) $(LFLAGS) -Wl,-soname,libunqlite.so.1 -o $@ $(OBJS)
unqlite.o: unqlite.c unqlite.h
	$(CC) $(CFLAGS) -c unqlite.c

clean:
	rm $(OBJS)
	rm libunqlite.so.1
