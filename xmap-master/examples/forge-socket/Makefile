
CFLAGS+=-I../../lib/ -I../../forge_socket -Wall
LDFLAGS+=-lpcap -levent -levent_extra -lm
VPATH=../../lib/

# from dpkg-buildflags --get CFLAGS, but use stack-protector-all and fPIC
GCCHARDENING=-g -O2 -fstack-protector-all --param=ssp-buffer-size=4 -Wformat -Wformat-security -Werror=format-security -fPIC
# from gpkg-buildflags --get LDFLAGS, + -z,now
LDHARDENING=-Wl,-Bsymbolic-functions -Wl,-z,relro,-z,now

CFLAGS+=$(GCCHARDENING)
LDFLAGS+=$(LDHARDENING)


all: forge-socket

forge-socket: forge-socket.o xalloc.o logger.o
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

clean:
	rm -f forge-socket *.o
