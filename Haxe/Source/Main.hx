package;

import atlasgen.Node;
import atlasgen.Tree;
import nme.Lib;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.events.Event;
import nme.Assets;

/**
 * ...
 * @author Zaphod
 */
class Main extends Sprite 
{
	public var atlas:Tree;
	
	public static function main():Void
	{
		Lib.current.stage.addChild(new Main());
	}
	
	public function new()
	{
		super();
		
		if (stage != null) init();
		else addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(e:Event = null):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		// entry point
		
		atlas = new Tree(512, 512, 1, 1);
		
		/*atlas.addNode(Assets.getBitmapData("assets/bot.png"), "Bot");
		atlas.addNode(Assets.getBitmapData("assets/bot_bullet.png"), "Bot_Bullet");
		atlas.addNode(Assets.getBitmapData("assets/bullet.png"), "Bullet");
		atlas.addNode(Assets.getBitmapData("assets/crate.png"), "Crate");
		atlas.addNode(Assets.getBitmapData("assets/dirt.png"), "Dirt");
		atlas.addNode(Assets.getBitmapData("assets/dirt_top.png"), "Dirt_Top");
		atlas.addNode(Assets.getBitmapData("assets/elevator.png"), "Elevator");
		atlas.addNode(Assets.getBitmapData("assets/empty_tiles.png"), "Empty_Tiles");
		atlas.addNode(Assets.getBitmapData("assets/flixelLogo.png"), "FlixelLogo");
		atlas.addNode(Assets.getBitmapData("assets/gibs.png"), "Gibs");
		atlas.addNode(Assets.getBitmapData("assets/img_tiles.png"), "Img_Tiles");
		atlas.addNode(Assets.getBitmapData("assets/jet.png"), "Jet");
		atlas.addNode(Assets.getBitmapData("assets/miniframe.png"), "MiniFrame");
		atlas.addNode(Assets.getBitmapData("assets/spaceman.png"), "Spaceman");
		atlas.addNode(Assets.getBitmapData("assets/spawner.png"), "Spawner");
		atlas.addNode(Assets.getBitmapData("assets/spawner_gibs.png"), "Spawner_Gibs");
		atlas.addNode(Assets.getBitmapData("assets/tech_tiles.png"), "Tech_Tiles");*/
		
		/*atlas.addNodes([	Assets.getBitmapData("assets/bot.png"),
							Assets.getBitmapData("assets/bot_bullet.png"),
							Assets.getBitmapData("assets/bullet.png"),
							Assets.getBitmapData("assets/crate.png"),
							Assets.getBitmapData("assets/dirt.png"),
							Assets.getBitmapData("assets/dirt_top.png"),
							Assets.getBitmapData("assets/elevator.png"),
							Assets.getBitmapData("assets/empty_tiles.png"),
							Assets.getBitmapData("assets/flixelLogo.png"),
							Assets.getBitmapData("assets/gibs.png"),
							Assets.getBitmapData("assets/img_tiles.png"),
							Assets.getBitmapData("assets/jet.png"),
							Assets.getBitmapData("assets/miniframe.png"),
							Assets.getBitmapData("assets/spaceman.png"),
							Assets.getBitmapData("assets/spawner.png"),
							Assets.getBitmapData("assets/spawner_gibs.png"),
							Assets.getBitmapData("assets/tech_tiles.png")
						],
						
						["Bot",
						"Bot_Bullet",
						"Bullet",
						"Crate",
						"Dirt",
						"Dirt_Top",
						"Elevator",
						"Empty_Tiles",
						"FlixelLogo",
						"Gibs",
						"Img_Tiles",
						"Jet",
						"MiniFrame",
						"Spaceman",
						"Spawner",
						"Spawner_Gibs",
						"Tech_Tiles"
						]);*/
		
		atlas.createQueue();
		atlas.addToQueue(Assets.getBitmapData("assets/bot.png"), "Bot");
		atlas.addToQueue(Assets.getBitmapData("assets/bot_bullet.png"), "Bot_Bullet");
		atlas.addToQueue(Assets.getBitmapData("assets/bullet.png"), "Bullet");
		atlas.addToQueue(Assets.getBitmapData("assets/crate.png"), "Crate");
		atlas.addToQueue(Assets.getBitmapData("assets/dirt.png"), "Dirt");
		atlas.addToQueue(Assets.getBitmapData("assets/dirt_top.png"), "Dirt_Top");
		atlas.addToQueue(Assets.getBitmapData("assets/elevator.png"), "Elevator");
		atlas.addToQueue(Assets.getBitmapData("assets/empty_tiles.png"), "Empty_Tiles");
		atlas.addToQueue(Assets.getBitmapData("assets/flixelLogo.png"), "FlixelLogo");
		atlas.addToQueue(Assets.getBitmapData("assets/gibs.png"), "Gibs");
		atlas.addToQueue(Assets.getBitmapData("assets/img_tiles.png"), "Img_Tiles");
		atlas.addToQueue(Assets.getBitmapData("assets/jet.png"), "Jet");
		atlas.addToQueue(Assets.getBitmapData("assets/miniframe.png"), "MiniFrame");
		atlas.addToQueue(Assets.getBitmapData("assets/spaceman.png"), "Spaceman");
		atlas.addToQueue(Assets.getBitmapData("assets/spawner.png"), "Spawner");
		atlas.addToQueue(Assets.getBitmapData("assets/spawner_gibs.png"), "Spawner_Gibs");
		atlas.addToQueue(Assets.getBitmapData("assets/tech_tiles.png"), "Tech_Tiles");
		atlas.generateAtlasFromQueue();
		
		var bm:Bitmap = new Bitmap(atlas.atlasBitmapData);
		addChild(bm);
		
		var logo:Bitmap = new Bitmap(atlas.getNodeByKey("Crate").item);
		logo.y = logo.x = 150;
		addChild(logo);
		
	//	atlas.resize(512, 512);
	//	bm.bitmapData = atlas.atlasBitmapData;
	//	atlas.clear();
	//	atlas.rebuildAtlas();
	}
	
}