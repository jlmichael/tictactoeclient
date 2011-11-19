package fenrissoftwerks.ttt.events {

	import flash.events.Event;

	public class LogoutEvent extends Event {
    
		public static const LOGOUT:String = "logout";
        
 		public function LogoutEvent(bubbles:Boolean=true, cancelable:Boolean=false) {	
			super(LOGOUT, bubbles, cancelable);
		}    
	}
}