/* hand-coded interface part of NatConv */

/* Copyright 1989 - 1998 by the Opal Group, TU Berlin. All rights reserved 
   See OCSHOME/etc/LICENSE or 
   http://uebb.cs.tu-berlin.de/~opal/LICENSE.html for details
   $Date$ ($Revision$)
*/
#include "Nat.h"
#include "Char.h"

#define ANatConv_AuncheckedAsChar(x1,x2) {x2=pack_char(unpack_nat(x1));}

