#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/types.h>
#include <unistd.h>

 
#define BUF_SIZE 8192
#define FILE_LEDS "/dev/leds"
 

const char * array[] = {
	"0",
	"3",
	"2",
	"23",
	"1",
	"13",
	"12",
	"123",
	"000"
};

#define n_array (sizeof (array) / sizeof (const char *))

int main(int argc, char* argv[]) {
 
    int output_fd;
    ssize_t  ret_out;

 
    int i;

        for (i = n_array-1; i >= 0; i--) {
            printf ("%d: %s\n", i, array[i]);
        }
 


    while(1){

       for (i = n_array-1; i >= 0; i--) {
            output_fd = open(FILE_LEDS, O_WRONLY, 0644);
            if(output_fd == -1){
                perror("open");
               return 3;
            }

            printf ("%d: %s\n", i, array[i]);
            ret_out = write (output_fd, array[i], (ssize_t)strlen(array[i]));

            close (output_fd);

        	usleep(2000000);
        }
    }
 
    return (EXIT_SUCCESS);
}

