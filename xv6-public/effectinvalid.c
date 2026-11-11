
#include "types.h"
#include "stat.h"
#include "user.h"

int
main(void)
{
  int r;

  printf(1, "=== INVALID REQUEST TESTS ===\n");

  // Zero key
  r = effect(0ULL, 2, "invalid", 0, 0);
  printf(1, "Zero key: %d (expected -1)\n", r);

  // Invalid operation
  r = effect(0x4001ULL, 3, "invalid", 0, 0);
  printf(1, "Invalid operation: %d (expected -1)\n", r);

  // CREATE with nonzero length
  r = effect(0x4002ULL, 2, "invalid", "X", 1);
  printf(1, "CREATE with payload: %d (expected -1)\n", r);

  // APPEND with zero length
  r = effect(0x4003ULL, 1, "invalid", "", 0);
  printf(1, "Zero-length APPEND: %d (expected -1)\n", r);

  // APPEND with length exceeding 128
  char buf[129];
  for(int i = 0; i < 129; i++)
    buf[i] = 'X';

  r = effect(0x4004ULL, 1, "invalid", buf, 129);
  printf(1, "129-byte APPEND: %d (expected -1)\n", r);

  // APPEND to nonexistent file
  r = effect(0x4005ULL, 1, "doesnotexist", "X", 1);
  printf(1, "Missing target: %d (expected -1)\n", r);

  printf(1, "=== TESTS COMPLETE ===\n");
  exit();
}
