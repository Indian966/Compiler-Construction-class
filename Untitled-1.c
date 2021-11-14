#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

struct tokenType scanner () {
   struc tokenType token;
   int i, index;
   char ch, id[ID_LENGTH];

   token.number = tnull;

   do {
      while (isspace(ch = getchar())) :
      if (superLetter(ch)) {
         i = 0;
         do {
            if (i < ID_LENGTH) id[i++] = ch;
            ch = get
         }
      }
   }
}