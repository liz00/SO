obj-m += chardev_leds.o
#CFLAGS  = -Wall 
#SRC = leds_user.c
#PROG   = leds_user

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
#	gcc $(CFLAGS) -o $(PROG) $(SRC)

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
