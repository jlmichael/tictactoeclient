package fenrissoftwerks.ttt.controllers
{
	import fenrissoftwerks.ttt.events.*;
	import fenrissoftwerks.ttt.models.Model;
	
	import flash.net.Socket;
	
	import mx.controls.Alert;
	import mx.core.Application;
	
	public class Controller
	{
		private var _application:Application;
		private var _socket:Socket;
		private var _model:Model = Model.getInstance();
		
		public function Controller(application:Application)
		{
			_application = application as tictactoeclient;
			
			// Listen for events from the views.
			_application.addEventListener(LoginEvent.LOGIN, handleLoginEvent);
			_application.addEventListener(LogoutEvent.LOGOUT, handleLogoutEvent);
		}
		
		private function handleLoginEvent(event:LoginEvent):void {
			_model.isLoggedIn = true;
		}

		private function handleLogoutEvent(event:LogoutEvent):void {
			_model.isLoggedIn = false;
		}


	}
}