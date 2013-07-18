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
#elseif flash							//Stuff the flash target needs
import flash.net.FileReference;
#end

import flash.text.TextField;			//Stuff ALL targets need
import flash.Lib;
import flash.display.Sprite;
import openfl.display.FPS;
import flash.events.Event;
import flash.events.MouseEvent;
	
#if flash
class Main extends Sprite
#else
class Main
#end
{
	#if (cpp || neko)				
	//Stuff just for Waxe
		public var stage(get, null):ManagedStage;
		public var frame : Frame;
		private var _stage : NMEStage;
		
		public static function main()
		{
			App.boot( function() { new Main(); } );
		}
			
		public function get_stage():ManagedStage {
			if (_stage == null) return null;
			return _stage.stage;
		}   	
		
		public function layout()
		{
			_stage.size = _frame.clientSize;
		}   
		
	#end
   
	//Stuff for both targets
	public var tf:TextField; 
   
	public function new()
	{
		#if flash
			super ();		
		#elseif (cpp || neko)
			
			#if waxe
				var fr:Frame = ApplicationMain.frame;
				var W:Int = fr.get_size().width;
				var H:Int = fr.get_size().height;		
				
				_frame = Frame.create(null,0,"NME Frame",{x:0,y:0},{width:W,height:H});
				_frame.onClose = _onCloseFrame;
				var count = 0;
				var me = this;
				_frame.onSize = function(evt) { me.layout(); evt.skip = true; }	

				_stage = NMEStage.create(_frame, null, null, { width:W, height:H} );
				App.setTopWindow(_frame);
				_frame.shown = true;	 
			#end						
			 		
		#end		
			
		//This is where to do your own stuff:
		_entryPoint();
	}

	
   /*********PRIVATE***********/    
   
	private function _entryPoint():Void {
		var s = new Sprite();
		var gfx = s.graphics;
		
		gfx.beginFill(0xff0000);
		gfx.drawRect(0, 0, 200, 100);
		gfx.endFill();
      
		stage.addChild(s);
		stage.frameRate = 10;
		stage.addChild( new FPS(10,10) );
		s.addEventListener(MouseEvent.CLICK, function(_) { trace("CLICK!"); _onClick(null); } );
		
		tf = new TextField();
		tf.text = "Click the red square to show a file";
		tf.width = 800;
		tf.x = 20;
		tf.y = 200;
		
		stage.addChild(tf);
	}
	
	#if (cpp || neko)
		private function _onCloseFrame(data:Dynamic):Void {
			//Quit the app when they close the NME window:
			Sys.exit(0);
		}
	#end
	
	private function _onClick(m:MouseEvent):Void {
	   _showFileDialog(m);
	}	
	
	private function _showFileDialog(event:Dynamic):Void {
		#if flash
			var fr:flash.net.FileReference = new FileReference();
			fr.addEventListener(Event.SELECT, _onSelect, false, 0, true);
			fr.addEventListener(Event.CANCEL, _onCancel, false, 0, true);
			fr.browse();
		#elseif (cpp || neko)
			var fileDialog:FileDialog = new FileDialog(_frame, "Choose an image" , "" , "" , "PNG and JPG files|*.png;*.jpg|PNG files|*.png|JPG files|*.jpg");
			if (fileDialog.showModal()) {
				_onSelect(fileDialog);
			}else {
				_onCancel(fileDialog);
			}
		#end
   }
   
   #if flash
		private function _onSelect(e:Event):Void {
			trace("Selected");
			var fr:FileReference = cast(e.target, FileReference);
			trace("toString = " + fr.toString() + " size = " + fr.size);
			tf.text = fr.name;
			
			//At this point you can use the FileReference.load() to get the file
			//You don't have the full native path, however.
		}
   
		private function _onCancel(e:Event):Void {	   
			trace("Cancel");
			tf.text = "Cancelled!";
		}
	#elseif (cpp || neko)
		private function _onSelect(fileDialog:FileDialog):Void {	   
			trace("Selected");
			tf.text = fileDialog.directory + "/" + fileDialog.file;
						
			//At this point you have the full native path to the file
			//You should use sys.io.File or something from here on
		}
   
		private function _onCancel(fileDialog:FileDialog):Void {	   
			trace("Cancel");
			tf.text = "Cancelled!";
		}
	#end
   
   
}
