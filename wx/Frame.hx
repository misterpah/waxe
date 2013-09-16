package wx;

class Frame extends TopLevelWindow
{
   public var menuBar(null,set) : wx.MenuBar;
   var menuMap : Map<Int,Dynamic->Void>;

   public static function create(inParent:Window, ?inID:Int, inTitle:String="",
                  ?inPosition:{x:Int,y:Int},
                   ?inSize:{width:Int,height:Int}, ?inStyle:Int )
   {
	  var a:Array<Dynamic> = [inParent == null ? null : inParent.wxHandle, inID, inTitle, inPosition, inSize, inStyle] ;
      var handle = wx_frame_create(a);
      return new Frame(handle);
   }


   public function new(inHandle:Dynamic)
   {
      super(inHandle);
      setHandler(EventID.COMMAND_MENU_SELECTED, onMenu);
      menuMap = new Map<Int,Dynamic->Void>();
   }

   /**Redundant getter preserves API compability:**/
   
   public function set_menuBar(inBar:MenuBar):MenuBar {	   
      wx_frame_set_menu_bar(wxHandle,inBar.wxHandle);
      return inBar;
   }
   
   public function wxSetMenuBar(inBar:wx.MenuBar)
   {
	   return set_menuBar(inBar);
   }

   public function handle(id:Int,handler:Dynamic->Void)
   {
      menuMap.set(id,handler);
   }

   public function onMenu(event:Dynamic)
   {
      var id:Int = event.id;
      if (menuMap.exists(id))
         menuMap.get(id)(event);
   }

   static var wx_frame_create = Loader.load("wx_frame_create",1);
   static var wx_frame_set_menu_bar = Loader.load("wx_frame_set_menu_bar",2);

}
