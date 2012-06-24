package nme.installer;


import nme.display.BitmapData;
import nme.media.Sound;
import nme.net.URLRequest;
import nme.text.Font;
import nme.utils.ByteArray;
import ApplicationMain;


/**
 * ...
 * @author Joshua Granick
 */

class Assets {

	
	public static var cachedBitmapData:Hash<BitmapData> = new Hash<BitmapData>();
	
	private static var initialized:Bool = false;
	private static var resourceClasses:Hash <Dynamic> = new Hash <Dynamic> ();
	private static var resourceTypes:Hash <String> = new Hash <String> ();
	
	
	private static function initialize ():Void {
		
		if (!initialized) {
			
			resourceClasses.set ("assets/bot.png", NME_assets_bot_png);
			resourceTypes.set ("assets/bot.png", "image");
			resourceClasses.set ("assets/bot_bullet.png", NME_assets_bot_bullet_png);
			resourceTypes.set ("assets/bot_bullet.png", "image");
			resourceClasses.set ("assets/bullet.png", NME_assets_bullet_png);
			resourceTypes.set ("assets/bullet.png", "image");
			resourceClasses.set ("assets/crate.png", NME_assets_crate_png);
			resourceTypes.set ("assets/crate.png", "image");
			resourceClasses.set ("assets/dirt.png", NME_assets_dirt_png);
			resourceTypes.set ("assets/dirt.png", "image");
			resourceClasses.set ("assets/dirt_top.png", NME_assets_dirt_top_png);
			resourceTypes.set ("assets/dirt_top.png", "image");
			resourceClasses.set ("assets/elevator.png", NME_assets_elevator_png);
			resourceTypes.set ("assets/elevator.png", "image");
			resourceClasses.set ("assets/empty_tiles.png", NME_assets_empty_tiles_png);
			resourceTypes.set ("assets/empty_tiles.png", "image");
			resourceClasses.set ("assets/flixelLogo.png", NME_assets_flixellogo_png);
			resourceTypes.set ("assets/flixelLogo.png", "image");
			resourceClasses.set ("assets/gibs.png", NME_assets_gibs_png);
			resourceTypes.set ("assets/gibs.png", "image");
			resourceClasses.set ("assets/img_tiles.png", NME_assets_img_tiles_png);
			resourceTypes.set ("assets/img_tiles.png", "image");
			resourceClasses.set ("assets/jet.png", NME_assets_jet_png);
			resourceTypes.set ("assets/jet.png", "image");
			resourceClasses.set ("assets/miniframe.png", NME_assets_miniframe_png);
			resourceTypes.set ("assets/miniframe.png", "image");
			resourceClasses.set ("assets/spaceman.png", NME_assets_spaceman_png);
			resourceTypes.set ("assets/spaceman.png", "image");
			resourceClasses.set ("assets/spawner.png", NME_assets_spawner_png);
			resourceTypes.set ("assets/spawner.png", "image");
			resourceClasses.set ("assets/spawner_gibs.png", NME_assets_spawner_gibs_png);
			resourceTypes.set ("assets/spawner_gibs.png", "image");
			resourceClasses.set ("assets/tech_tiles.png", NME_assets_tech_tiles_png);
			resourceTypes.set ("assets/tech_tiles.png", "image");
			resourceClasses.set ("assets/bot.png", NME_assets_bot_png1);
			resourceTypes.set ("assets/bot.png", "image");
			resourceClasses.set ("assets/bot_bullet.png", NME_assets_bot_bullet_png1);
			resourceTypes.set ("assets/bot_bullet.png", "image");
			resourceClasses.set ("assets/bullet.png", NME_assets_bullet_png1);
			resourceTypes.set ("assets/bullet.png", "image");
			resourceClasses.set ("assets/crate.png", NME_assets_crate_png1);
			resourceTypes.set ("assets/crate.png", "image");
			resourceClasses.set ("assets/dirt.png", NME_assets_dirt_png1);
			resourceTypes.set ("assets/dirt.png", "image");
			resourceClasses.set ("assets/dirt_top.png", NME_assets_dirt_top_png1);
			resourceTypes.set ("assets/dirt_top.png", "image");
			resourceClasses.set ("assets/elevator.png", NME_assets_elevator_png1);
			resourceTypes.set ("assets/elevator.png", "image");
			resourceClasses.set ("assets/empty_tiles.png", NME_assets_empty_tiles_png1);
			resourceTypes.set ("assets/empty_tiles.png", "image");
			resourceClasses.set ("assets/flixelLogo.png", NME_assets_flixellogo_png1);
			resourceTypes.set ("assets/flixelLogo.png", "image");
			resourceClasses.set ("assets/gibs.png", NME_assets_gibs_png1);
			resourceTypes.set ("assets/gibs.png", "image");
			resourceClasses.set ("assets/img_tiles.png", NME_assets_img_tiles_png1);
			resourceTypes.set ("assets/img_tiles.png", "image");
			resourceClasses.set ("assets/jet.png", NME_assets_jet_png1);
			resourceTypes.set ("assets/jet.png", "image");
			resourceClasses.set ("assets/miniframe.png", NME_assets_miniframe_png1);
			resourceTypes.set ("assets/miniframe.png", "image");
			resourceClasses.set ("assets/spaceman.png", NME_assets_spaceman_png1);
			resourceTypes.set ("assets/spaceman.png", "image");
			resourceClasses.set ("assets/spawner.png", NME_assets_spawner_png1);
			resourceTypes.set ("assets/spawner.png", "image");
			resourceClasses.set ("assets/spawner_gibs.png", NME_assets_spawner_gibs_png1);
			resourceTypes.set ("assets/spawner_gibs.png", "image");
			resourceClasses.set ("assets/tech_tiles.png", NME_assets_tech_tiles_png1);
			resourceTypes.set ("assets/tech_tiles.png", "image");
			
			initialized = true;
			
		}
		
	}
	
	
	public static function getBitmapData (id:String, useCache:Bool = true):BitmapData {
		
		initialize ();
		
		if (resourceTypes.exists (id) && resourceTypes.get (id) == "image") {
			
			if (useCache && cachedBitmapData.exists (id)) {
				
				return cachedBitmapData.get (id);
				
			} else {
				
				var data = cast (Type.createInstance (resourceClasses.get (id), []), BitmapData);
				
				if (useCache) {
					
					cachedBitmapData.set (id, data);
					
				}
				
				return data;
				
			}
			
		} else {
			
			trace ("[nme.Assets] There is no BitmapData asset with an ID of \"" + id + "\"");
			
			return null;
			
		}
		
	}
	
	
	public static function getBytes (id:String):ByteArray {
		
		initialize ();
		
		if (resourceClasses.exists (id)) {
			
			return Type.createInstance (resourceClasses.get (id), []);
			
		} else {
			
			trace ("[nme.Assets] There is no ByteArray asset with an ID of \"" + id + "\"");
			
			return null;
			
		}
		
	}
	
	
	public static function getFont (id:String):Font {
		
		initialize ();
		
		if (resourceTypes.exists (id) && resourceTypes.get (id) == "font") {
			
			return cast (Type.createInstance (resourceClasses.get (id), []), Font);
			
		} else {
			
			trace ("[nme.Assets] There is no Font asset with an ID of \"" + id + "\"");
			
			return null;
			
		}
		
	}
	
	
	public static function getSound (id:String):Sound {
		
		initialize ();
		
		if (resourceTypes.exists (id)) {
			
			if (resourceTypes.get (id) == "sound" || resourceTypes.get (id) == "music") {
				
				return cast (Type.createInstance (resourceClasses.get (id), []), Sound);
				
			}
			
		}
		
		trace ("[nme.Assets] There is no Sound asset with an ID of \"" + id + "\"");
		
		return null;
		
	}
	
	
	public static function getText (id:String):String {
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
	}
	
	
}