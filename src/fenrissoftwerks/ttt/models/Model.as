package fenrissoftwerks.ttt.models
{
	[Bindable]
	public class Model
	{
		private static var _instance:Model = null;

		public static function getInstance():Model {
			if (_instance == null) {
				_instance = new Model();
			}
			return _instance;
		}
		
		public function Model()
		{
		}

	}
}