CC = gcc
CFLAGS = -Wall -O3 -fomit-frame-pointer -funroll-loops -fforce-addr -falign-functions=4 -msse
TARGET = ttaenc
PREFIX = /usr/local
INSTALL = install
RM = rm -f

all: $(TARGET)

$(TARGET): src/$(TARGET).o
	$(CC) $(CFLAGS) $^ -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) src/$(TARGET).o $(TARGET)

install:
	$(INSTALL) -d $(PREFIX)/bin
	$(INSTALL) -m 0755 $(TARGET) $(PREFIX)/bin/
	$(INSTALL) -d $(PREFIX)/share/doc/$(TARGET)
	$(INSTALL) -m 0644 ChangeLog-3.4.1 COPYING README.md $(PREFIX)/share/doc/$(TARGET)

uninstall:
	$(RM) $(PREFIX)/bin/$(TARGET)
	$(RM) -r $(PREFIX)/share/doc/$(TARGET)
