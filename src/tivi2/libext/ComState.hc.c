/* hand-coded implementation part of ComState */
/* coding scheme version acc-2.1 */

#include "Com.h"


typedef struct sSTATEID {
    OBJ state;
} * STATEID;

#define pack_id(x) pack_pointer(x)
#define unpack_id(x) unpack_pointer(x)


extern OBJ _AComState_ACreate(OBJ Init,OBJ Unit) /* create */ {
    STATEID id;

    id = (STATEID)malloc_aux(sizeof(struct sSTATEID));

    id->state = Init;

    return_okay(pack_id(id));
}


extern OBJ _AComState_ATrans(OBJ Id,OBJ Fun,OBJ Unit) /* Trans */ {
    STATEID id = unpack_id(Id);

    id->state = EVAL1(Fun, id->state);

    return_okay_nil;
}

extern OBJ _AComState_ASelect(OBJ Id,OBJ Unit) /* Select */ {
    STATEID id = unpack_id(Id);

    copy_some(id->state, 1);

    return_okay(id->state);
}


extern OBJ _AComState_ADelete(OBJ Id,OBJ Unit) /* Delete */ {
    STATEID id = unpack_id(Id);

    free_some(id->state, 1);
    free_aux(id);

    return_okay_nil;
}


static init_const_AComState(){
    init_ACom();
}
    