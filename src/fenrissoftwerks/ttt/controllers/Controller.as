package fenrissoftwerks.ttt.controllers
{
	import fenrissoftwerks.ttt.events.*;
	
	import mx.controls.Alert;
	import mx.core.Application;
	
	public class Controller
	{
		private var _application:Application;
		
		public function Controller(application:Application)
		{
			_application = application as tictactoeclient;
			
			// Listen for events from the views.
			_application.addEventListener(LoginEvent.LOGIN, handleLoginEvent);
			
		}
		
		private function handleLoginEvent(event:LoginEvent):void {
			Alert.show("Caught loginEvent!");
		}

	}
}