package; 
#if (cpp || neko)						//Stuff the native target needs
	import sys.io.File;
	import wx.App;
	import wx.Button;
	import wx.EventID;
	import wx.FileDialog;
	import wx.Frame;
	import wx.NMEStage;
	import wx.Sizer;
	import openfl.display.ManagedStage;
#elseif flash
	import flash.events.Event;
	import flash.net.FileReference;
#end

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

/**
 * ...
 * @author Zaphod
 */
class PlayState extends FlxState
{
	private var _text:FlxText;
	private var _button:FlxButton;
	
	override public function create():Void 
	{
		FlxG.cameras.bgColor = 0xffaaaaaa;
		
		var _button:FlxButton = new FlxButton(0, 0, "Browse", _onClick);
		add(_button);
		
		_text = new FlxText(0, 0, FlxG.width, "Hello World!");
		_text.y = (FlxG.height - _text.height) / 2;
		_text.setFormat(null, 8, FlxColor.WHITE, "center", FlxColor.BLACK, true);
		
		add(_text);
		
		FlxG.mouse.show();
	}
	
	private function _onClick():Void {
		_showFileDialog();
	}
	
	private function _showFileDialog():Void {
		#if flash
			var fr:FileReference = new FileReference();
			fr.addEventListener(Event.SELECT, _onSelect, false, 0, true);
			fr.addEventListener(Event.CANCEL, _onCancel, false, 0, true);
			fr.browse();
		#elseif (cpp || neko)
			var fileDialog:FileDialog = new FileDialog(Main.get_frame(), "Choose an image" , "" , "" , "PNG and JPG files|*.png;*.jpg|PNG files|*.png|JPG files|*.jpg");
			if (fileDialog.showModal()) {
				_onSelect(fileDialog);
			}else {
				_onCancel(fileDialog);
			}
		#end
   }
   
   #if flash
		private function _onSelect(e:Event):Void {
			var fr:FileReference = cast(e.target, FileReference);
			_text.text = fr.name;
			
			//At this point you can use the FileReference.load() to get the file
			//You don't have the full native path, however.
		}
   
		private function _onCancel(e:Event):Void {	   
			_text.text = "Cancelled!";
		}
	#elseif (cpp || neko)
		private function _onSelect(fileDialog:FileDialog):Void {	   
			_text.text = fileDialog.directory + "/" + fileDialog.file;
						
			//At this point you have the full native path to the file
			//You should use sys.io.File or something from here on
		}
   
		private function _onCancel(fileDialog:FileDialog):Void {	   
			_text.text = "Cancelled!";
		}
	#end
}