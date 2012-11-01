#include "HaxeAPI.h"

value wx_list_box_create(value inParams,value inChoices)
{
	CreationParams params(inParams);
	wxArrayString choices;
	Val2ArrayString(inChoices,choices);
   wxListBox *window = new wxListBox(params.parent,params.id,
              params.position,params.size,choices,params.flags,wxDefaultValidator,params.text);

   return WXToValue(window);
}
DEFINE_PRIM(wx_list_box_create,2)






value wx_list_box_set(value inWindow, value arraySelection) 
{ 
	wxListBox *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	wxArrayString arraySelectionConverted;
	Val2ArrayString(arraySelection,arraySelectionConverted);
	window->Set(arraySelectionConverted); 
	return alloc_null();
} 
DEFINE_PRIM(wx_list_box_set,2);



WIN_PROPERTY(wx_list_box,wxListBox,selection,GetSelection,SetSelection,Val2Int)
WIN_PROPERTY_IDX(wx_list_box,wxListBox,string,GetString,SetString,Val2Str)

