#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>

int main(int argc, char **argv)
{
	struct termios config;
	int fd, value, characters;
	char buff[5];
	//char q = 'd';
	const float minute = 60000.0;

	fd = open ("/dev/ttyS0" , O_NOCTTY ); 
	if( fd == -1 ){
		printf( "Failed to open the port.\n" );
		return -1;
	}
	if( tcgetattr( fd, &config ) < 0 ){
		printf( "Failed to get the configuration settings.\n" );
		return -1;
	}
	config.c_iflag = IGNCR;
	config.c_lflag = ICANON;
		
	if( cfsetispeed( &config, B9600 ) < 0 ) {
		printf( "could not set the input speed.\n" );
		return -1;
	}

	if( tcsetattr( fd, TCSANOW | TCSAFLUSH, &config ) < 0 ) {
		printf( "could not set the configuration flags.\n" );
		return -1;
	}

 	cfsetispeed(&config,B9600);            // 9600 baud output/write speed
                             

	while(buff != "exit"){

		characters = ( read( fd, buff, 255 ));
		value = atoi(buff);
		buff[characters-1] = '\0';
		printf( " Time taken : %s ms =>  %.2f rpm \n", buff, minute/value);

 		  write(fd,buff,255);// if new data is available on the console, send it to the serial port
	}
close(fd);	

}
