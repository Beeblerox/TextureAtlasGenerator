import Main;
import nme.Assets;
import nme.events.Event;


class ApplicationMain {
	
	static var mPreloader:NMEPreloader;

	public static function main () {
		
		var call_real = true;
		
		
		var loaded:Int = nme.Lib.current.loaderInfo.bytesLoaded;
		var total:Int = nme.Lib.current.loaderInfo.bytesTotal;
		
		if (loaded < total || true) /* Always wait for event */ {
			
			call_real = false;
			mPreloader = new NMEPreloader();
			nme.Lib.current.addChild(mPreloader);
			mPreloader.onInit();
			mPreloader.onUpdate(loaded,total);
			nme.Lib.current.addEventListener (nme.events.Event.ENTER_FRAME, onEnter);
			
		}
		
		
		if (call_real)
			begin ();
	}
	
	private static function begin () {
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields(Main))
		{
			if (methodName == "main")
			{
				hasMain = true;
				break;
			}
		}
		
		if (hasMain)
		{
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
		}
		else
		{
			nme.Lib.current.addChild(cast (Type.createInstance(Main, []), nme.display.DisplayObject));	
		}
		
	}

	static function onEnter (_) {
		
		var loaded:Int = nme.Lib.current.loaderInfo.bytesLoaded;
		var total:Int = nme.Lib.current.loaderInfo.bytesTotal;
		mPreloader.onUpdate(loaded,total);
		
		if (loaded >= total) {
			
			nme.Lib.current.removeEventListener(nme.events.Event.ENTER_FRAME, onEnter);
			mPreloader.addEventListener (Event.COMPLETE, preloader_onComplete);
			mPreloader.onLoaded();
			
		}
		
	}

	public static function getAsset (inName:String):Dynamic {
		
		
		if (inName=="assets/bot.png")
			 
            return Assets.getBitmapData ("assets/bot.png");
         
		
		if (inName=="assets/bot_bullet.png")
			 
            return Assets.getBitmapData ("assets/bot_bullet.png");
         
		
		if (inName=="assets/bullet.png")
			 
            return Assets.getBitmapData ("assets/bullet.png");
         
		
		if (inName=="assets/crate.png")
			 
            return Assets.getBitmapData ("assets/crate.png");
         
		
		if (inName=="assets/dirt.png")
			 
            return Assets.getBitmapData ("assets/dirt.png");
         
		
		if (inName=="assets/dirt_top.png")
			 
            return Assets.getBitmapData ("assets/dirt_top.png");
         
		
		if (inName=="assets/elevator.png")
			 
            return Assets.getBitmapData ("assets/elevator.png");
         
		
		if (inName=="assets/empty_tiles.png")
			 
            return Assets.getBitmapData ("assets/empty_tiles.png");
         
		
		if (inName=="assets/flixelLogo.png")
			 
            return Assets.getBitmapData ("assets/flixelLogo.png");
         
		
		if (inName=="assets/gibs.png")
			 
            return Assets.getBitmapData ("assets/gibs.png");
         
		
		if (inName=="assets/img_tiles.png")
			 
            return Assets.getBitmapData ("assets/img_tiles.png");
         
		
		if (inName=="assets/jet.png")
			 
            return Assets.getBitmapData ("assets/jet.png");
         
		
		if (inName=="assets/miniframe.png")
			 
            return Assets.getBitmapData ("assets/miniframe.png");
         
		
		if (inName=="assets/spaceman.png")
			 
            return Assets.getBitmapData ("assets/spaceman.png");
         
		
		if (inName=="assets/spawner.png")
			 
            return Assets.getBitmapData ("assets/spawner.png");
         
		
		if (inName=="assets/spawner_gibs.png")
			 
            return Assets.getBitmapData ("assets/spawner_gibs.png");
         
		
		if (inName=="assets/tech_tiles.png")
			 
            return Assets.getBitmapData ("assets/tech_tiles.png");
         
		
		if (inName=="assets/bot.png")
			 
            return Assets.getBitmapData ("assets/bot.png");
         
		
		if (inName=="assets/bot_bullet.png")
			 
            return Assets.getBitmapData ("assets/bot_bullet.png");
         
		
		if (inName=="assets/bullet.png")
			 
            return Assets.getBitmapData ("assets/bullet.png");
         
		
		if (inName=="assets/crate.png")
			 
            return Assets.getBitmapData ("assets/crate.png");
         
		
		if (inName=="assets/dirt.png")
			 
            return Assets.getBitmapData ("assets/dirt.png");
         
		
		if (inName=="assets/dirt_top.png")
			 
            return Assets.getBitmapData ("assets/dirt_top.png");
         
		
		if (inName=="assets/elevator.png")
			 
            return Assets.getBitmapData ("assets/elevator.png");
         
		
		if (inName=="assets/empty_tiles.png")
			 
            return Assets.getBitmapData ("assets/empty_tiles.png");
         
		
		if (inName=="assets/flixelLogo.png")
			 
            return Assets.getBitmapData ("assets/flixelLogo.png");
         
		
		if (inName=="assets/gibs.png")
			 
            return Assets.getBitmapData ("assets/gibs.png");
         
		
		if (inName=="assets/img_tiles.png")
			 
            return Assets.getBitmapData ("assets/img_tiles.png");
         
		
		if (inName=="assets/jet.png")
			 
            return Assets.getBitmapData ("assets/jet.png");
         
		
		if (inName=="assets/miniframe.png")
			 
            return Assets.getBitmapData ("assets/miniframe.png");
         
		
		if (inName=="assets/spaceman.png")
			 
            return Assets.getBitmapData ("assets/spaceman.png");
         
		
		if (inName=="assets/spawner.png")
			 
            return Assets.getBitmapData ("assets/spawner.png");
         
		
		if (inName=="assets/spawner_gibs.png")
			 
            return Assets.getBitmapData ("assets/spawner_gibs.png");
         
		
		if (inName=="assets/tech_tiles.png")
			 
            return Assets.getBitmapData ("assets/tech_tiles.png");
         
		
		
		return null;
		
	}
	
	
	private static function preloader_onComplete (event:Event):Void {
		
		mPreloader.removeEventListener (Event.COMPLETE, preloader_onComplete);
		
		nme.Lib.current.removeChild(mPreloader);
		mPreloader = null;
		
		begin ();
		
	}
	
}


class NME_assets_bot_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bot_bullet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bullet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_crate_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_dirt_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_dirt_top_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_elevator_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_empty_tiles_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_flixellogo_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_gibs_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_img_tiles_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_jet_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_miniframe_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_spaceman_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_spawner_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_spawner_gibs_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_tech_tiles_png extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bot_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bot_bullet_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_bullet_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_crate_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_dirt_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_dirt_top_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_elevator_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_empty_tiles_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_flixellogo_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_gibs_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_img_tiles_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_jet_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_miniframe_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_spaceman_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_spawner_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_spawner_gibs_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
class NME_assets_tech_tiles_png1 extends nme.display.BitmapData { public function new () { super (0, 0); } }
