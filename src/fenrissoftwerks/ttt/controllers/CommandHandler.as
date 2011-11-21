package fenrissoftwerks.ttt.controllers
{
	import fenrissoftwerks.ttt.models.Command;
	
	public class CommandHandler
	{
		public function CommandHandler()
		{
		}

		public function executeCommand(command:Command):void {
			trace("this should have been overridden!");
		}
	}
}