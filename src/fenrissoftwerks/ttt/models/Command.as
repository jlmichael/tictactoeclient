package fenrissoftwerks.ttt.models
{
	public class Command
	{
		public var commandName:String;
		public var commandArgs:Array;
		
		public function Command()
		{
		}

		public function toString():String {
			var str:String = "CommandName: " + commandName + "\n";
			str += "CommandArgs: \n";
			var i:int;
			for (i = 0; i < commandArgs.length; i++) {
				str += "\t" + commandArgs[i] + "\n";
			}
			return str;
		}
	}
}