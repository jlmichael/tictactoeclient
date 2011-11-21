package fenrissoftwerks.ttt.models
{
	import mx.collections.ArrayCollection;
	
	public class Board
	{
		[Bindable]
		private var _spot00:String = '';
		[Bindable]
		private var _spot01:String = '';
		[Bindable]
		private var _spot02:String = '';
		[Bindable]
		private var _spot10:String = '';
		[Bindable]
		private var _spot11:String = '';
		[Bindable]
		private var _spot12:String = '';
		[Bindable]
		private var _spot20:String = '';
		[Bindable]
		private var _spot21:String = '';
		[Bindable]
		private var _spot22:String = '';
		
		public function Board()
		{
		}

		public function getSpot(x:int, y:int):String {
			if(x == 0) {
				if(y == 0) {
					return _spot00;
				} else if(y == 1) {
					return _spot01;
				} else if(y == 2) {
					return _spot02;
				}
			} else if(x == 1) {
				if(y == 0) {
					return _spot10;
				} else if(y == 1) {
					return _spot11;
				} else if(y == 2) {
					return _spot12;
				}
			} else if(x == 2) {
				if(y == 0) {
					return _spot20;
				} else if(y == 1) {
					return _spot21;
				} else if(y == 2) {
					return _spot22;
				}
			}		
			return "";	
		}
		
		public function setSpot(x:int, y:int, letter:String):void {
			if(x == 0) {
				if(y == 0) {
					_spot00 = letter;
				} else if(y == 1) {
					_spot01 = letter;
				} else if(y == 2) {
					_spot02 = letter;
				}
			} else if(x == 1) {
				if(y == 0) {
					_spot10 = letter;
				} else if(y == 1) {
					_spot11 = letter;
				} else if(y == 2) {
					_spot12 = letter;
				}
			} else if(x == 2) {
				if(y == 0) {
					_spot20 = letter;
				} else if(y == 1) {
					_spot21 = letter;
				} else if(y == 2) {
					_spot22 = letter;
				}
			}
		}
	}
}