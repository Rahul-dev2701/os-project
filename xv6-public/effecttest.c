
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int
main(void)
{
  int r;
  char buf[64];

  printf(1, "Testing effect syscall...\n");

  // CREATE
  r = effect(0x123456789ABCDEF0ULL, 2, "testfile", 0, 0);
  printf(1, "CREATE: %d (expected 0)\n", r);

  // Duplicate CREATE
  r = effect(0x123456789ABCDEF0ULL, 2, "testfile", 0, 0);
  printf(1, "Duplicate CREATE: %d (expected 0)\n", r);

  // APPEND
  r = effect(0x123456789ABCDEF1ULL, 1, "testfile", "hello", 5);
  printf(1, "APPEND: %d (expected 5)\n", r);

  // Duplicate APPEND
  r = effect(0x123456789ABCDEF1ULL, 1, "testfile", "hello", 5);
  printf(1, "Duplicate APPEND: %d (expected 5)\n", r);

  // Same key, different payload -> hash conflict
  r = effect(0x123456789ABCDEF1ULL, 1, "testfile", "world", 5);
  printf(1, "Hash conflict: %d (expected -2)\n", r);

  // Verify file contents
  int fd = open("testfile", O_RDONLY);
  if(fd < 0){
    printf(1, "ERROR: Could not open testfile\n");
    exit();
  }

  int n = read(fd, buf, sizeof(buf) - 1);
  if(n >= 0)
    buf[n] = 0;
  close(fd);

  printf(1, "File contents: %s (expected hello)\n", buf);
  printf(1, "Test complete.\n");

  exit();
}
