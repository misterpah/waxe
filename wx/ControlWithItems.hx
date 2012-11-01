package wx;

import wx.Window;

class ControlWithItems extends Window
{
	function new(inHandle:Dynamic) { super(inHandle); }

	public function clear()  { wx_controlWithItems_clear(wxHandle); }
	static var wx_controlWithItems_clear = Loader.load("wx_controlWithItems_clear",1);

	public function insert(insertString:String,position:Int):Int  { return wx_wxControlWithItems_insert(wxHandle,insertString,position); }
	static var wx_wxControlWithItems_insert = Loader.load("wx_wxControlWithItems_insert",3);

	public function append(insertString:String):Int  { return wx_wxControlWithItems_append(wxHandle,insertString); }
	static var wx_wxControlWithItems_append = Loader.load("wx_wxControlWithItems_append",2);

	public function delete(position:Int)  { wx_wxControlWithItems_delete(wxHandle,position); }
	static var wx_wxControlWithItems_delete = Loader.load("wx_wxControlWithItems_delete",2);

	/*
	public function findString(stringToFind:String,caseSensitive:Bool):Dynamic { wx_wxControlWithItems_FindString(wxHandle,stringToFind,caseSensitive); }
	static var wx_wxControlWithItems_FindString = Loader.load("wx_wxControlWithItems_FindString",3);
	*/

}
