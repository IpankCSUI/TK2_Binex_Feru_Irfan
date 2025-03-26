#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void)

{
  char local_78 [104];
  char *local_10;
  
  local_10 = (char *)malloc(1000);
  printf("%p\n",local_78);
  fflush(stdout);
  fgets(local_10,1000,stdin);
  local_10[999] = '\0';
  printf(local_10);
  fflush(stdout);
  fgets(local_10,1000,stdin);
  local_10[999] = '\0';
  strcpy(local_78,local_10);
  return 0;
}
