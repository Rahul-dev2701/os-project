#include "types.h"
#include "user.h"

#define MAX_DATA 128

static unsigned long long
parse_key(char *s)
{
  unsigned long long value = 0;

  if(*s == 0)
    return 0;

  while(*s){
    if(*s < '0' || *s > '9')
      return 0;

    value = value * 10 + (*s - '0');
    s++;
  }

  return value;
}

static int
hex_value(char c)
{
  if(c >= '0' && c <= '9')
    return c - '0';

  if(c >= 'a' && c <= 'f')
    return c - 'a' + 10;

  if(c >= 'A' && c <= 'F')
    return c - 'A' + 10;

  return -1;
}

int
main(int argc, char *argv[])
{
  unsigned long long key;
  int operation;
  int length = 0;
  int i;
  int high, low;
  char data[MAX_DATA];

  if(argc != 5){
    printf(2, "Usage: effectctl key CREATE|APPEND path hexdata\n");
    exit();
  }

  key = parse_key(argv[1]);

  if(key == 0){
    printf(2, "effectctl: invalid key\n");
    exit();
  }

  if(strcmp(argv[2], "CREATE") == 0){
    operation = 2;

    if(strcmp(argv[4], "-") != 0){
      printf(2, "effectctl: CREATE does not accept data\n");
      exit();
    }

    printf(1, "effectctl: result %d\n",
           effect(key, operation, argv[3], 0, 0));

    exit();
  }

  if(strcmp(argv[2], "APPEND") != 0){
    printf(2, "effectctl: invalid operation\n");
    exit();
  }

  operation = 1;

  if(argv[4][0] == 0){
    printf(2, "effectctl: empty data\n");
    exit();
  }

  for(i = 0; argv[4][i]; i += 2){
    if(argv[4][i + 1] == 0 || length >= MAX_DATA){
      printf(2, "effectctl: invalid data length\n");
      exit();
    }

    high = hex_value(argv[4][i]);
    low = hex_value(argv[4][i + 1]);

    if(high < 0 || low < 0){
      printf(2, "effectctl: invalid hex data\n");
      exit();
    }

    data[length++] = (high << 4) | low;
  }

  printf(1, "effectctl: result %d\n",
         effect(key, operation, argv[3], data, length));

  exit();
}
