#include "HaxeAPI.h"


value wx_controlWithItems_clear(value inWindow) 
{ 
	wxControlWithItems *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	window->Clear(); 
	return alloc_null();
} 
DEFINE_PRIM(wx_controlWithItems_clear,1);

value wx_wxControlWithItems_insert(value inWindow,value strInsert,value position) 
{ 
	wxControlWithItems *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	return  WXToValue(window->Insert(Val2Str(strInsert),Val2Int(position))); 
} 
DEFINE_PRIM(wx_wxControlWithItems_insert,3);


value wx_wxControlWithItems_append(value inWindow,value strInsert) 
{ 
	wxControlWithItems *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	return  WXToValue(window->Append(Val2Str(strInsert))); 
} 
DEFINE_PRIM(wx_wxControlWithItems_append,2);

value wx_wxControlWithItems_delete(value inWindow,value position) 
{ 
	wxControlWithItems *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	window->Delete(Val2Int(position)); 
	return alloc_null();
} 
DEFINE_PRIM(wx_wxControlWithItems_delete,2);





/*
// cant implement. need to return unsigned int
// maybe need to declare WXToValue (unsigned int)

value wx_wxControlWithItems_getCount(value inWindow) 
{ 
	wxControlWithItems *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	return  WXToValue(window->GetCount()); 
	
} 
DEFINE_PRIM(wx_wxControlWithItems_getCount,1);
*/


/*
//FindString doesn't return the integer. what's wrong with this function

value wx_wxControlWithItems_FindString(value inWindow,value strSearch,value caseSensitive) 
{ 
	wxControlWithItems *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	return  WXToValue(window->FindString(Val2Str(strSearch),Val2Bool(caseSensitive))); 
} 
DEFINE_PRIM(wx_wxControlWithItems_FindString,3);


*/