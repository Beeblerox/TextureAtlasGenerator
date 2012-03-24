package 
{
	import atlasgen.Node;
	import atlasgen.Tree;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Zaphod
	 */
	public class Main extends Sprite 
	{
		
		[Embed(source = "../assets/bot.png")]
		public var Bot:Class;
		[Embed(source = "../assets/bot_bullet.png")]
		public var Bot_Bullet:Class;
		[Embed(source = "../assets/bullet.png")]
		public var Bullet:Class;
		[Embed(source = "../assets/crate.png")]
		public var Crate:Class;
		[Embed(source = "../assets/dirt.png")]
		public var Dirt:Class;
		[Embed(source = "../assets/dirt_top.png")]
		public var Dirt_Top:Class;
		[Embed(source = "../assets/elevator.png")]
		public var Elevator:Class;
		[Embed(source = "../assets/empty_tiles.png")]
		public var Empty_Tiles:Class;
		[Embed(source = "../assets/flixelLogo.png")]
		public var FlixelLogo:Class;
		[Embed(source = "../assets/gibs.png")]
		public var Gibs:Class;
		[Embed(source = "../assets/img_tiles.png")]
		public var Img_Tiles:Class;
		[Embed(source = "../assets/jet.png")]
		public var Jet:Class;
		[Embed(source = "../assets/miniframe.png")]
		public var MiniFrame:Class;
		[Embed(source = "../assets/spaceman.png")]
		public var Spaceman:Class;
		[Embed(source = "../assets/spawner.png")]
		public var Spawner:Class;
		[Embed(source = "../assets/spawner_gibs.png")]
		public var Spawner_Gibs:Class;
		[Embed(source = "../assets/tech_tiles.png")]
		public var Tech_Tiles:Class;
		
		public var atlas:Tree;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			atlas = new Tree(256, 256, 1, 1);
			
			/*atlas.addNode(Bitmap(new Bot()).bitmapData, "Bot");
			atlas.addNode(Bitmap(new Bot_Bullet()).bitmapData, "Bot_Bullet");
			atlas.addNode(Bitmap(new Bullet()).bitmapData, "Bullet");
			atlas.addNode(Bitmap(new Crate()).bitmapData, "Crate");
			atlas.addNode(Bitmap(new Dirt()).bitmapData, "Dirt");
			atlas.addNode(Bitmap(new Dirt_Top()).bitmapData, "Dirt_Top");
			atlas.addNode(Bitmap(new Elevator()).bitmapData, "Elevator");
			atlas.addNode(Bitmap(new Empty_Tiles()).bitmapData, "Empty_Tiles");
			atlas.addNode(Bitmap(new FlixelLogo()).bitmapData, "FlixelLogo");
			atlas.addNode(Bitmap(new Gibs()).bitmapData, "Gibs");
			atlas.addNode(Bitmap(new Img_Tiles()).bitmapData, "Img_Tiles");
			atlas.addNode(Bitmap(new Jet()).bitmapData, "Jet");
			atlas.addNode(Bitmap(new MiniFrame()).bitmapData, "MiniFrame");
			atlas.addNode(Bitmap(new Spaceman()).bitmapData, "Spaceman");
			atlas.addNode(Bitmap(new Spawner()).bitmapData, "Spawner");
			atlas.addNode(Bitmap(new Spawner_Gibs()).bitmapData, "Spawner_Gibs");
			atlas.addNode(Bitmap(new Tech_Tiles()).bitmapData, "Tech_Tiles");*/
			
			atlas.addNodes([	Bitmap(new Bot()).bitmapData,
								Bitmap(new Bot_Bullet()).bitmapData,
								Bitmap(new Bullet()).bitmapData,
								Bitmap(new Crate()).bitmapData,
								Bitmap(new Dirt()).bitmapData,
								Bitmap(new Dirt_Top()).bitmapData,
								Bitmap(new Elevator()).bitmapData,
								Bitmap(new Empty_Tiles()).bitmapData,
								Bitmap(new FlixelLogo()).bitmapData,
								Bitmap(new Gibs()).bitmapData,
								Bitmap(new Img_Tiles()).bitmapData,
								Bitmap(new Jet()).bitmapData,
								Bitmap(new MiniFrame()).bitmapData,
								Bitmap(new Spaceman()).bitmapData,
								Bitmap(new Spawner()).bitmapData,
								Bitmap(new Spawner_Gibs()).bitmapData,
								Bitmap(new Tech_Tiles()).bitmapData
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
							]);
			
			var bm:Bitmap = new Bitmap(atlas.atlasBitmapData);
			addChild(bm);
			
			var logo:Bitmap = new Bitmap(atlas.getNodeByKey("Crate").item);
			logo.y = logo.x = 150;
			addChild(logo);
		}
		
	}
	
}