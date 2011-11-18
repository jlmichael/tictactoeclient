package fenrissoftwerks.ttt.events {

	import flash.events.Event;

	public class LoginEvent extends Event {
    
		public static const LOGIN:String = "login";
    
		private var _username:String;
		private var _password:String;
		private var _url:String;
    
 		public function LoginEvent(username:String, password:String, bubbles:Boolean=true, cancelable:Boolean=false) {	
			super(LOGIN, bubbles, cancelable);
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