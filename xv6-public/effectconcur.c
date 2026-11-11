#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

void
run_pair(unsigned long long k1, char *b1,
         unsigned long long k2, char *b2,
         char *path)
{
  int p[2];
  int pid;

  if(pipe(p) < 0){
    printf(1, "pipe failed\n");
    return;
  }

  pid = fork();

  if(pid == 0){
    char token;
    close(p[1]);
    read(p[0], &token, 1);
    close(p[0]);

    int r = effect(k1, 1, path, b1, 1);
    printf(1, "Child 1: effect returned %d\n", r);
    exit();
  }

  pid = fork();

  if(pid == 0){
    char token;
    close(p[1]);
    read(p[0], &token, 1);
    close(p[0]);

    int r = effect(k2, 1, path, b2, 1);
    printf(1, "Child 2: effect returned %d\n", r);
    exit();
  }

  close(p[0]);
  write(p[1], "xx", 2);
  close(p[1]);

  wait();
  wait();
}

int
file_len(char *path)
{
  char buf[64];
  int fd, n;

  fd = open(path, O_RDONLY);
  if(fd < 0)
    return -1;

  n = read(fd, buf, sizeof(buf));
  close(fd);

  return n;
}

int
main(void)
{

  printf(1, "\n=== CONCURRENCY TESTS ===\n");

  // Test 1: Same key, same request
  effect(0x1001ULL, 2, "dupfile", 0, 0);

  printf(1, "\nTest 1: Same key, same request\n");

  run_pair(0x1002ULL, "X",
           0x1002ULL, "X",
           "dupfile");

  printf(1, "File length: %d (expected 1)\n",
         file_len("dupfile"));

  // Test 2: Different keys
  effect(0x2001ULL, 2, "diffkey", 0, 0);

  printf(1, "\nTest 2: Different keys\n");

  run_pair(0x2002ULL, "A",
           0x2003ULL, "B",
           "diffkey");

  printf(1, "File length: %d (expected 2)\n",
         file_len("diffkey"));

  // Test 3: Same key, different requests
  effect(0x3001ULL, 2, "conflict", 0, 0);

  printf(1, "\nTest 3: Same key, different payloads\n");

  run_pair(0x3002ULL, "P",
           0x3002ULL, "Q",
           "conflict");

  printf(1, "File length: %d (expected 1)\n",
         file_len("conflict"));

  printf(1, "\n=== TESTS COMPLETE ===\n");

  exit();
}
