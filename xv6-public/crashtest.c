#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
    int n, fd;

    if(argc != 2) {
        printf(2, "usage: crashtest n (0 = no crash)\n");
        exit();
    }

    n = atoi(argv[1]);
    if(n < 0 || crashat(n) < 0) {
        printf(2, "crashtest: invalid crash point\n");
        exit();
    }

    // Creating or updating a file triggers filesystem log events.
    fd = open("crashdemo", O_CREATE | O_RDWR);
    if(fd < 0) {
        printf(2, "crashtest: cannot open file\n");
        crashat(0);
        exit();
    }

    if(write(fd, "X", 1) != 1) {
        printf(2, "crashtest: write failed\n");
    }
    close(fd);
    crashat(0);
    printf(1, "crashtest: completed without a crash\n");
    exit();
}
