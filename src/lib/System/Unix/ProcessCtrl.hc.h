/* hand-coded interface part of ProcessCtrl */
/* coding scheme version acc-2.1 */

/* Copyright 1989 - 1998 by the Opal Group, TU Berlin. All rights reserved 
   See OCSHOME/etc/LICENSE or 
   http://uebb.cs.tu-berlin.de/~opal/LICENSE.html for details
   $Date: 1998-06-16 16:00:20 $ ($Revision: 1.1.1.1 $)
*/

/* import pid_t */
#include <unixconfig.h>

/* DATA process == */

typedef struct sPROCESS {
  struct sCELL header;
  pid_t        value;
} * PROCESS;

#define size_process          sizeof_small(struct sPROCESS)
#define alloc_process(p)      alloc_small_flat(size_process,p)
#define make_process(v,p)     {alloc_process(p);((PROCESS)(p))->value=v;}
#define copy_process(p,n)     copy_structured(p,n)
#define free_process(p,n)     free_structured(p,n)
#define excl_process(p,n)     excl_structured(p,n)
#define decr_process(p,n)     decr_structured(p,n)

/* macro based implementations */

/* < : process ** process -> bool */
#define AProcessCtrl_Sl(p1,p2,r) {\
  r=pack_clean_bool(((PROCESS)(p1))->value < ((PROCESS)(p2))->value);\
  free_process(p1,1); free_process(p2,1);\
}

/* = : process ** process -> bool */
#define AProcessCtrl_Se(p1,p2,r) {\
  r=pack_clean_bool(((PROCESS)(p1))->value == ((PROCESS)(p2))->value);\
  free_process(p1,1); free_process(p2,1);\
}

/* no other macro based implementations */
