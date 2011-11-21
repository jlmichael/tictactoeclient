package fenrissoftwerks.ttt.events
{
	import flash.events.Event;
	import fenrissoftwerks.ttt.models.Command;

	public class IncomingCommandEvent extends Event
	{
		public static const INCOMINGCOMMAND:String = "incomingcommand";
    
		private var _command:Command;
    
 		public function IncomingCommandEvent(command:Command, bubbles:Boolean=true, cancelable:Boolean=false) {	
			super(INCOMINGCOMMAND, bubbles, cancelable);
			_command = command;
		}
    
		public function get command():Command {
			return _command;
		}
		
        // Override the inherited clone() method.
        override public function clone():Event {
            return new IncomingCommandEvent(command);
        }
		
	}
}