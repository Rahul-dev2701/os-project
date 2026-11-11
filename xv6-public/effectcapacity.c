#include "types.h"
#include "stat.h"
#include "user.h"

int
main(void)
{
  int i, r;
  char data = 'X';

  printf(1, "=== CAPACITY TEST ===\n");

  r = effect(0x5000ULL, 2, "capacity", 0, 0);
  printf(1, "CREATE: %d (expected 0)\n", r);

  for(i = 1; i <= 63; i++){
    r = effect(0x5000ULL + i, 1, "capacity", &data, 1);
    if(r != 1){
      printf(1, "Request %d failed: %d\n", i, r);
      exit();
    }
  }

  printf(1, "64 unique requests: passed\n");

  r = effect(0x6000ULL, 1, "capacity", &data, 1);
  printf(1, "65th request: %d (expected -1)\n", r);

  r = effect(0x5001ULL, 1, "capacity", &data, 1);
  printf(1, "Retry first key: %d (expected 1)\n", r);

  printf(1, "=== TEST COMPLETE ===\n");
  exit();
}
