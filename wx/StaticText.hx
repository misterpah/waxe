package wx;

import wx.Window;

class StaticText extends Window
{
	public var label(getLabel,setLabel):String;

   public static function create(inParent:Window, ?inID:Null<Int>, inText:String="",
	                ?inPosition:Position,
                   ?inSize:Size, ?inStyle:Int )
   {
		if (inParent==null)
			throw Error.INVALID_PARENT;
      var handle = wx_static_text_create(
			[inParent.wxHandle,inID,inText,inPosition,inSize, inStyle] );
      return new StaticText(handle);
   }


   public function new(inHandle:Dynamic)
   {
	   super(inHandle);
   }

	public function setLabel(inString:String) : String
	{
		wx_static_text_set_label(wxHandle,inString);
		return inString;
	}
	public function getLabel() : String
	{
		return wx_static_text_get_label(wxHandle);
	}


   static var wx_static_text_create = Loader.load("wx_static_text_create",1);
   static var wx_static_text_get_label = Loader.load("wx_static_text_get_label",1);
   static var wx_static_text_set_label = Loader.load("wx_static_text_set_label",2);
}
