package atlasgen
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	/**
	 * Класс для генерации текстурных атласов
	 * @author Zaphod
	 */
	 
	public class Tree
	{
		public var root:Node;
		
		public var nodes:Dictionary;
		public var atlasBitmapData:BitmapData;
		
		public var borderX:int;
		public var borderY:int;
		
		public function Tree(width:int, height:int, borderX:int = 0, borderY:int = 0) 
		{
			root = new Node(new Rectangle(0, 0, width, height));
			atlasBitmapData = new BitmapData(width, height, true, 0);
			nodes = new Dictionary();
			
			this.borderX = borderX;
			this.borderY = borderY;
		}
		
		public function addNode(data:BitmapData, key:String):Node
		{
			if (hasNodeWithName(key) == true)
			{
				return nodes[key];
			}
			
			if (root.canPlace(data.width, data.height) == false)
			{
				return null;
			}
			
			var insertWidth:int = (data.width == width) ? data.width : data.width + borderX;
			var insertHeight:int = (data.height == height) ? data.height : data.height + borderY;
			
			var nodeToInsert:Node = findNodeToInsert(insertWidth, insertHeight);
			if (nodeToInsert != null)
			{
				var firstChild:Node;
				var secondChild:Node;
				var firstGrandChild:Node;
				var secondGrandChild:Node;
				
				var dw:int = nodeToInsert.width - insertWidth;
				var dh:int = nodeToInsert.height - insertHeight;
				
				if (dw > dh) // делим по горизонтали
				{
					firstChild = new Node(new Rectangle(nodeToInsert.x, nodeToInsert.y, insertWidth, nodeToInsert.height));
					secondChild = new Node(new Rectangle(nodeToInsert.x + insertWidth, nodeToInsert.y, nodeToInsert.width - insertWidth, nodeToInsert.height));
					
					firstGrandChild = new Node(new Rectangle(firstChild.x, firstChild.y, insertWidth, insertHeight), data, key);
					secondGrandChild = new Node(new Rectangle(firstChild.x, firstChild.y + insertHeight, insertWidth, firstChild.height - insertHeight));
				}
				else // делим по вертикали
				{
					firstChild = new Node(new Rectangle(nodeToInsert.x, nodeToInsert.y, nodeToInsert.width, insertHeight));
					secondChild = new Node(new Rectangle(nodeToInsert.x, nodeToInsert.y + insertHeight, nodeToInsert.width, nodeToInsert.height - insertHeight));
					
					firstGrandChild = new Node(new Rectangle(firstChild.x, firstChild.y, insertWidth, insertHeight), data, key);
					secondGrandChild = new Node(new Rectangle(firstChild.x + insertWidth, firstChild.y, firstChild.width - insertWidth, insertHeight));
				}
				
				firstChild.left = firstGrandChild;
				firstChild.right = secondGrandChild;
				
				nodeToInsert.left = firstChild;
				nodeToInsert.right = secondChild;
				
				atlasBitmapData.copyPixels(data, data.rect, new Point(firstGrandChild.x, firstGrandChild.y));
				
				nodes[key] = firstGrandChild;
				
				return firstGrandChild;
			}
			
			return null;
		}
		
		public function get width():int
		{
			return root.width;
		}
		
		public function get height():int
		{
			return root.height;
		}
		
		public function hasNodeWithName(nodeName:String):Boolean
		{
			return (nodes[nodeName] != null);
		}
		
		public function getNodeByKey(key:String):Node
		{
			if (hasNodeWithName(key) == true)
			{
				return nodes[key];
			}
			
			return null;
		}
		
		public function getNodeByBitmap(bitmap:BitmapData):Node
		{
			for each (var node:Node in nodes)
			{
				if (node.item == bitmap)
				{
					return node;
				}
			}
			
			return null;
		}
		
		public function addNodes(bitmaps:Array, keys:Array):Boolean
		{
			var numKeys:int = keys.length;
			var numBitmaps:int = bitmaps.length;
			
			if (numBitmaps != numKeys)
			{
				return false;
			}
			
			var sortedBitmaps:Array = bitmaps.slice();
			sortedBitmaps.sortOn(["width", "height"], Array.DESCENDING | Array.NUMERIC);
			
			var node:Node;
			var result:Boolean = true;
			var index:int;
			for (var i:int = 0; i < numBitmaps; i++)
			{
				index = bitmaps.indexOf(sortedBitmaps[i]);
				node = addNode(sortedBitmaps[i], keys[index]);
				if (node == null)
				{
					result = false;
				}
			}
			
			return result;
		}
		
		public function destoy():void
		{
			deleteSubtree(root);
			root = null;
			atlasBitmapData.dispose();
			atlasBitmapData = null;
			nodes = null;
		}
		
		public function deleteSubtree(node:Node):void
		{
			if (node)
			{
				if (node.left) deleteSubtree(node.left);
				if (node.right) deleteSubtree(node.right);
				node.destroy();
			}
		}
		
		// Внутренний итератор для нисходящего обхода в глубину, использующий стек для хранения информации об еще не пройденных поддеревьях
		private function findNodeToInsert(insertWidth:int, insertHeight:int):Node
		{
			// Стек для хранения узлов
			var stack:Vector.<Node> = new Vector.<Node>();
			// Текущий узел
			var current:Node = root;
			// Основной цикл
			while (true)
			{
				// Обходим текущий узел дерева
				if (current.isEmpty && current.canPlace(insertWidth, insertHeight))
				{
					return current;
				}
				// Переходим к следующему узлу
				if (current.right != null && current.right.canPlace(insertWidth, insertHeight) && current.left != null && current.left.canPlace(insertWidth, insertHeight))
				{
					stack.push(current.right);
					current = current.left;
				}
				else if (current.left != null && current.left.canPlace(insertWidth, insertHeight))
				{
					current = current.left;
				}
				else if (current.right != null && current.right.canPlace(insertWidth, insertHeight))
				{
					current = current.right;
				}
				else
				{
					if (stack.length > 0)
					{
						// Пытаемся извлечь очередную вершину из стека
						current = stack.pop();
					}
					else
					{
						// Стек пуст, заканчиваем работу цикла и функции
						return null;
					}
				}
			}
			
			return null;
		}
		
	}

}