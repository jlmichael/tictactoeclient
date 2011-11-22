package fenrissoftwerks.ttt.controllers.handlers
{
	import fenrissoftwerks.ttt.controllers.CommandHandler;
	import fenrissoftwerks.ttt.models.Command;
	import fenrissoftwerks.ttt.components.ErrorPopup;
	import mx.managers.PopUpManager;
	
	import mx.core.Application;
	
	public class DisplayErrorHandler extends CommandHandler
	{
		private var _application:Application;
		private var _popup:ErrorPopup = null;
		
		public function DisplayErrorHandler(application:Application)
		{
			_application = application;
		}

		override public function executeCommand(command:Command):void {
			// Get the message to display from the command
			var message:String = command.commandArgs.pop();
			
			// Create the popup
			_popup = PopUpManager.createPopUp(_application, ErrorPopup, true) as ErrorPopup;
			PopUpManager.centerPopUp(_popup);
			_popup.message = message;
		}

	}
}