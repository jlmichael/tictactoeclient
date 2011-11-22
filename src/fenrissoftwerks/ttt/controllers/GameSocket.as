package fenrissoftwerks.ttt.controllers
{
	import com.adobe.serialization.json.*;
	
	import fenrissoftwerks.ttt.events.IncomingCommandEvent;
	import fenrissoftwerks.ttt.models.Command;
	import fenrissoftwerks.ttt.models.CommandFactory;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.Socket;
	
	import mx.core.Application;

	[Event(name="incomingcommand", type="fenrissoftwerks.ttt.events.IncomingCommandEvent")]
	public class GameSocket extends Socket
	{
		private var _application:Application;
		
		public function GameSocket(application:Application, host:String=null, port:int=0)
		{
			super(host, port);
			addEventListener(Event.CONNECT, onConnect);
			addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);
			addEventListener(Event.CLOSE, onClose);
			addEventListener(ProgressEvent.SOCKET_DATA, onSocketData);
			addEventListener(IOErrorEvent.IO_ERROR, onIoError);
			_application = application;
		}
		
		private function onConnect(event:Event):void {
		}
		
		private function onSecurityError(event:Event):void {
		 	trace("SecError: " + event.toString());
		}
		
		private function onClose(event:Event):void {
			trace("in onClose");
		}
		
		private function onSocketData(event:Event):void {
			// Fetch the bytes
            var message:String = readUTFBytes(this.bytesAvailable);
            trace("Message looks like: " + message); 
            			
			// Deserialize the incoming message to a Command
			try {
				var command:Command = CommandFactory.createCommand(message) as Command;
			} catch (e:Error) {
				trace("Got an error while decoding: " + e.message);
			}
			if(command == null) {
				trace("Command was null after deserializing");
			}
			trace(command.toString());
			
			// Dispatch an IncomingCommand event
			var incomingCommandEvent:IncomingCommandEvent = new IncomingCommandEvent(command);
//			var incomingCommandEvent:LoginEvent = new LoginEvent("foo", "bar");
			_application.dispatchEvent(incomingCommandEvent);
			trace("Dispatched event");
		}

		private function onIoError(event:Event):void {
			trace("In onIoError: " + event.toString());
		}
	}
}