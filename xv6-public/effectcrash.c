#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

#define KEY 0x123456789ABCDEF2ULL

int
main(int argc, char *argv[])
{
  int mode, r, fd, n;
  char buf[64];

  if(argc != 2){
    printf(2, "Usage: effectcrash write|replay|check\n");
    exit();
  }

  if(strcmp(argv[1], "setup") == 0){
    mode = 0;
  } else if(strcmp(argv[1], "write") == 0){
    mode = 1;
  } else if(strcmp(argv[1], "replay") == 0){
    mode = 2;
  } else if(strcmp(argv[1], "check") == 0){
    mode = 3;
  } else {
    printf(2, "Invalid mode\n");
    exit();
  }

    if(mode == 0){
    r = effect(KEY, 2, "crashfile", 0, 0);
    printf(1, "CREATE returned: %d\n", r);
  }

  if(mode == 1){
  r = effect(KEY, 2, "crashfile", 0, 0);
  printf(1, "CREATE returned: %d\n", r);

  crashat(9);
  r = effect(KEY + 1, 1, "crashfile", "HELLO", 5);
  printf(1, "APPEND returned: %d\n", r);
}

  if(mode == 2){
    r = effect(KEY + 1, 1, "crashfile", "HELLO", 5);
    printf(1, "replay returned: %d (expected 5 if committed)\n", r);
  }

  if(mode == 3){
    fd = open("crashfile", O_RDONLY);
    if(fd < 0){
      printf(1, "File does not exist\n");
      exit();
    }

    n = read(fd, buf, sizeof(buf)-1);
    close(fd);

    if(n < 0){
      printf(1, "Read failed\n");
      exit();
    }

    buf[n] = 0;
    printf(1, "Contents: %s\n", buf);
  }

  exit();
}