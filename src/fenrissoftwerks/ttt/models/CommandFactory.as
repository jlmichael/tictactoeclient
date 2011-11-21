package fenrissoftwerks.ttt.models
{
      import com.adobe.serialization.json.JSON;
      
      import flash.utils.describeType;
      import flash.utils.getDefinitionByName;
      
      import mx.controls.Alert;
 
      public class CommandFactory {
 
            public static function createCommand(jsonSource:String):Object {
                  var returnObject:Object = mapToFlexObjects(decodeJSONObject(jsonSource));
            	return returnObject;
            }

//			public static function createCommand(jsonSource:String):Command {
//				var obj:Object = decodeJSONObject(jsonSource);
//				var command:Command = new Command();
//				command.commandName = obj["commandName"];
//				command.commandArgs = obj["commandArgs"];
//				return command;
//			} 
			
            internal static function mapToFlexObjects(obj:Object):Object {
                  var objClass:Class = getDefinitionByName("fenrissoftwerks.ttt.models.Command") as Class;
                  var returnObject:Object = new(objClass)();
                  var propertyMap:XML = describeType(returnObject);
                  var propertyTypeClass:Class;
 
                  for each (var property:XML in propertyMap.variable) {
                        if ((obj as Object).hasOwnProperty(property.@name)) {
                              propertyTypeClass = getDefinitionByName(property.@type) as Class;
                              if (obj[property.@name] is (propertyTypeClass)) {
                                    returnObject[property.@name] = obj[property.@name];
                              }
                        }
                  }
 
                  return returnObject;
            }
 
            internal static function decodeJSONObject(jsonSource:String):Object {
                  var jsonObj:Object = JSON.decode(jsonSource);
                  return jsonObj;
            }
 
      }
}