package atlasgen
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	/**
	 * Atlas Node holds BitmapData and it's position on Atlas
	 * @author Zaphod
	 */
	public class Node
	{
		public var item:BitmapData;
		public var left:Node;
		public var right:Node;
		
		public var rect:Rectangle;
		public var key:String;
		
		public function Node(rect:Rectangle, item:BitmapData = null, key:String = "") 
		{
			this.item = item;
			this.left = null;
			this.right = null;
			this.rect = rect;
			this.key = key;
		}
		
		public function get isEmpty():Boolean
		{
			return (item == null && left == null && right == null);
		}
		
		public function canPlace(width:int, height:int):Boolean
		{
			return (rect.width >= width && rect.height >= height);
		}
		
		public function get x():int
		{
			return int(rect.x);
		}
		
		public function get y():int
		{
			return int(rect.y);
		}
		
		public function get width():int
		{
			return int(rect.width);
		}
		
		public function get height():int
		{
			return int(rect.height);
		}
		
		public function destroy():void
		{
			this.item = null;
			this.left = null;
			this.right = null;
			this.rect = null;
		}
		
	}

}