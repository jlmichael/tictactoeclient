package fenrissoftwerks.ttt.controllers.handlers
{
	import fenrissoftwerks.ttt.components.AcknowledgementPopup;
	import fenrissoftwerks.ttt.controllers.CommandHandler;
	import fenrissoftwerks.ttt.models.Command;
	
	import mx.core.Application;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	import mx.controls.Alert;
	
	public class DisplayAcknowledgementHandler extends CommandHandler
	{
		private var _application:Application;
		private var _popup:AcknowledgementPopup = null;
		
		public function DisplayAcknowledgementHandler(application:Application)
		{
			_application = application;
		}
		
		override public function executeCommand(command:Command):void {
			// Get the message to display from the command
			var message:String = command.commandArgs.pop();
			
			// Create the popup
			_popup = PopUpManager.createPopUp(_application, AcknowledgementPopup, true) as AcknowledgementPopup;
			PopUpManager.centerPopUp(_popup);
			_popup.message = message;
		}
	}
}