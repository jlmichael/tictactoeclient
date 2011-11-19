package fenrissoftwerks.ttt.models
{
	[Bindable]
	public class Model
	{
		private static var _instance:Model = null;
		private var _isLoggedIn:Boolean = false;

		public static function getInstance():Model {
			if (_instance == null) {
				_instance = new Model();
			}
			return _instance;
		}
		
		public function Model()
		{
		}

		public function get isLoggedIn():Boolean {
			return _isLoggedIn;
		}
		
		public function set isLoggedIn(isLoggedIn:Boolean):void {
			_isLoggedIn = isLoggedIn;
		}
	}
}