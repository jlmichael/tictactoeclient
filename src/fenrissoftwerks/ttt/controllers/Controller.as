package fenrissoftwerks.ttt.controllers
{
	import com.adobe.serialization.json.*;
	
	import fenrissoftwerks.ttt.controllers.handlers.DisplayAcknowledgementHandler;
	import fenrissoftwerks.ttt.controllers.handlers.DisplayErrorHandler;
	import fenrissoftwerks.ttt.events.*;
	import fenrissoftwerks.ttt.models.Command;
	import fenrissoftwerks.ttt.models.Model;
	
	import flash.utils.Dictionary;
	
	import mx.core.Application;
	
	public class Controller
	{
		private var _application:Application;
		private var _socket:GameSocket;
		private var _commandNameToHandlerMap:Dictionary = new Dictionary();
		
		private var _model:Model = Model.getInstance();
		
		public function Controller(application:Application, socket:GameSocket)
		{
			_application = application as tictactoeclient;
			_socket = socket;
			_socket.connect("localhost", 8080);
									
			// Listen for events from the views.
			_application.addEventListener(LoginEvent.LOGIN, handleLoginEvent);
			_application.addEventListener(LogoutEvent.LOGOUT, handleLogoutEvent);
			_application.addEventListener(CreatePlayerEvent.CREATEPLAYER, handleCreatePlayerEvent);
			_application.addEventListener(IncomingCommandEvent.INCOMINGCOMMAND, handleIncomingCommandEvent);
			
			// Set up command handler hash
			_commandNameToHandlerMap["displayAcknowledgment"] = new DisplayAcknowledgementHandler(_application);
			_commandNameToHandlerMap["displayError"] = new DisplayErrorHandler(_application);
		}
		
		private function handleLoginEvent(event:LoginEvent):void {
			// Get the username and password to create
			var username:String = event.username;
			var password:String = event.password;
			
			// Create the command object;
			var command:Command = new Command();
			command.commandName = "login";
			command.commandArgs = [username, password];
			
			// Serialize and write the command
			var commandAsJSON:String = JSON.encode(command);
			trace("Command looks like: " + commandAsJSON);
			try {
				_socket.writeUTFBytes(commandAsJSON);
				_socket.writeByte(0);
			} catch (e:Error) {
				trace("Error when writing: " + e.message);
			}
			try {
				_socket.flush();
			} catch (e:Error) {
				trace("Error when flushing: " + e.message);
			}

		}

		private function handleLogoutEvent(event:LogoutEvent):void {
			_model.isLoggedIn = false;
		}
		
		private function handleCreatePlayerEvent(event:CreatePlayerEvent):void {
			// Get the username and password to create
			var username:String = event.username;
			var password:String = event.password;
			
			// Create the command object;
			var command:Command = new Command();
			command.commandName = "createPlayer";
			command.commandArgs = [username, password];
			
			// Serialize and write the command
			var commandAsJSON:String = JSON.encode(command);
			trace("Command looks like: " + commandAsJSON);
			try {
				_socket.writeUTFBytes(commandAsJSON);
				_socket.writeByte(0);
			} catch (e:Error) {
				trace("Error when writing: " + e.message);
			}
			try {
				_socket.flush();
			} catch (e:Error) {
				trace("Error when flushing: " + e.message);
			}
		}		
		
		private function handleIncomingCommandEvent(event:IncomingCommandEvent):void {
			// Get the command name and use it to determine which handler to call
			var command:Command = event.command;
			var commandName:String = command.commandName;
			trace("lookup key is " + commandName);
			var handler:CommandHandler = _commandNameToHandlerMap[commandName];
			if(handler == null) {
				trace("undefined command: " + commandName);
				return;
			}
			handler.executeCommand(command);
			
		}
	}
}