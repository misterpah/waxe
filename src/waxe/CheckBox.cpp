#include "HaxeAPI.h"

value wx_checkbox_create(value inParams)
{
	CreationParams params(inParams);
   wxCheckBox *window = new wxCheckBox(params.parent,params.id,params.text,
										  params.position,params.size,params.flags);

   return WXToValue(window);
}
DEFINE_PRIM(wx_checkbox_create,1)

WIN_PROPERTY(wx_checkbox,wxCheckBox,checked,IsChecked,SetValue,Val2Bool)



value wx_checkbox_setValue(value inWindow, value state) 
{ 
	wxCheckBox *window; 
	if (!ValueToWX(inWindow,window)) 
		val_throw(alloc_string("Invalid Window")); 
	window->SetValue(Val2Bool(state)); 
	return alloc_null();
} 
DEFINE_PRIM(wx_checkbox_setValue,2);