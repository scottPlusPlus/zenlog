package zenlog;

typedef IStringLogger = {
	function debug(message:String):Void;
	function info(message:String):Void;
	function warn(message:String):Void;
	function error(message:String):Void;
	function critical(message:String):Void;
}