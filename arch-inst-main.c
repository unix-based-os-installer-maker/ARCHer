#include <stdlib.h>
#include <stdio.h>

int main ()
{
    printf("\n\n\n\n******************"
		"************************");
	printf("\n\n\n*** Welcome to the Arch Linux Installer ***");
	printf("\n\n\n\n*******************"
		"***********************\n");
    printf("\n");

    //Listing disks.
    system("bash lsblk");

    printf("\n");
    printf("What disk will you pick? Enter the full disk name. (e.g. /dev/sda)\n");
    printf("↓\n");

    //Partitioning and mounting.
    system("bash mnt-part.sh");
    printf("\n");

    //Basic installation of software.
    printf("Running a software update.");
    system("bash basic-installation.sh");

    //The shell script above will automatically run the installation from then on.
    return 0;
}