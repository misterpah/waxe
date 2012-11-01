package wx;

import wx.Window;

class ComboBox extends ControlWithItems
{
	//public var label(getLabel,setLabel):String;
	public var onSelected(null,setOnSelected) : Dynamic->Void;
	public var onTextEnter(null,setOnTextEnter) : Dynamic->Void;
	public var onTextUpdated(null,setOnTextUpdated) : Dynamic->Void;

   public static function create(inParent:Window, ?inID:Null<Int>, inValue:String="",
	                ?inPosition:Position,
                   ?inSize:Size, ?inChoices:Array<String>, ?inStyle:Int )
   {
		if (inParent==null)
			throw Error.INVALID_PARENT;
      var handle = wx_combo_box_create(
			[inParent.wxHandle,inID,inValue,inPosition,inSize, inStyle], inChoices );
      return new ComboBox(handle);
   }


   public function new(inHandle:Dynamic)
   {
	   super(inHandle);
   }

	function setOnSelected(f:Dynamic->Void)
	   {setHandler(wx.EventID.COMMAND_COMBOBOX_SELECTED,f); return f;}
	function setOnTextUpdated(f:Dynamic->Void)
	   {setHandler(wx.EventID.COMMAND_TEXT_UPDATED,f); return f;}
	function setOnTextEnter(f:Dynamic->Void)
	   {setHandler(wx.EventID.COMMAND_TEXT_ENTER,f); return f;}


   static var wx_combo_box_create = Loader.load("wx_combo_box_create",2);
}
