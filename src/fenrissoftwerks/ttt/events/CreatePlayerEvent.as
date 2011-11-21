package fenrissoftwerks.ttt.events
{
	import flash.events.Event;

	public class CreatePlayerEvent extends Event
	{
		public static const CREATEPLAYER:String = "createplayer";
    
		private var _username:String;
		private var _password:String;
    
 		public function CreatePlayerEvent(username:String, password:String, bubbles:Boolean=true, cancelable:Boolean=false) {	
			super(CREATEPLAYER, bubbles, cancelable);
			_username = username;
			_password = password;
		}
    
		public function get username():String {
			return _username;
		}
    
		public function get password():String {
			return _password;
		}    
	}
}