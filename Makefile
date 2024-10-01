CC ?= gcc
prefix ?= /usr/local
exec_prefix ?= ${prefix}
bindir ?= ${exec_prefix}/bin

.PHONY: install clean all

all: out/bin/hello

out/obj/%.o: src/%.c | out/obj
	$(CC) -c $? -o $@

OBJ += out/obj/main.o
out/bin/hello: $(OBJ) | out/bin
	$(CC) -o $@ $^

install: out/bin/hello
	install -D -m755 out/bin/hello ${DESTDIR}${bindir}/hello

out/:
	mkdir -p $@

out/obj: out/
	mkdir -p $@

out/bin: out/
	mkdir -p $@

clean:
	rm -rf out/
