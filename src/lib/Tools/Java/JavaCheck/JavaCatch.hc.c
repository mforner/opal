/* hand-coded implementation part of JavaCatch */
/* coding scheme version acc-2.1 */

/* Copyright 1989 - 1998 by the Opal Group, TU Berlin. All rights reserved 
   See OCSHOME/etc/LICENSE or 
   http://uebb.cs.tu-berlin.de/~opal/LICENSE.html for details
   $Date: 1998-06-16 16:00:28 $ ($Revision: 1.1.1.1 $)
*/
#include "JavaVM.h"
#include "Com.h"


extern OBJ _AJavaCatch_AisJavaExcept(OBJ x1) /* isJavaExcept */
{
  return pack_bool(x1 == javabind_exception_ans);
}

extern OBJ _AJavaCatch_AjavaGetExcept(OBJ x1) /* javaGetExcept */
{
  OBJ ob;
  jthrowable ex;
  if ((ex = javabind_last_exception) == NULL){
    HLT("<intern>'JavaUtil: exception object lost?");
  }
  javabind_last_exception = NULL;
  javabind_fromObject(ex, ob);
  return_okay(ob);
}

static init_const_AJavaCatch()
{}
