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
		
		private static var _frame : Frame;
		private var _stage : NMEStage;
		
		public static function main()
		{
			App.boot( function() { new Main(); } );
		}
			
		public function get_stage():ManagedStage {
			if (_stage == null) return null;
			return _stage.stage;
		}   
		
		public static function get_frame():Frame {
			return _frame;
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
		var game = new GameClass();
		stage.addChild(game);
	}
	
	#if (cpp || neko)
		private function _onCloseFrame(data:Dynamic):Void {
			//Quit the app when they close the NME window:
			Sys.exit(0);
		}
	#end   
}
