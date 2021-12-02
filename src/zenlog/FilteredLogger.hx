package zenlog;

class FilteredLogger implements ILogger {

    public function new(l:ILogger){
		wrappedLogger = l;
		highlight = function(str:String):String {
			return "*** " + str + " ***";
		}
    }

    public var wrappedLogger:ILogger;
	public var enableDebug = false;
	public var enableInfo = true;
	public var enableWarn = true;
	public var enableError = true;
	public var enableCritical = true;

	// showList shows even if level is disabled
	public var showList: Array<String> = [];

	//hideList hides even if level is enabled
	public var hideList: Array<String> = [];

	public var highlightList: Array<String> = [];

	public var highlight:String->String;

	public function debug(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
        if (!shouldShow(message, pos, enableDebug)){
			return;
		}
		message = mutateMsg(message, pos);
        wrappedLogger.debug(message, extra, pos);
	}

	public function info(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
        if (!shouldShow(message, pos, enableInfo)){
			return;
		}
		message = mutateMsg(message, pos);
        wrappedLogger.info(message, extra, pos);
	}

	public function warn(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
        if (!shouldShow(message, pos, enableWarn)){
			return;
		}
		message = mutateMsg(message, pos);
        wrappedLogger.warn(message, extra, pos);
	}

	public function error(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
        if (!shouldShow(message, pos, enableError)){
			return;
		}
		message = mutateMsg(message, pos);
        wrappedLogger.error(message, extra, pos);
	}

	public function critical(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
        if (!shouldShow(message, pos, enableCritical)){
			return;
		}
		message = mutateMsg(message, pos);
        wrappedLogger.critical(message, extra, pos);
	}

	private function shouldShow(?message:Dynamic, ?pos:haxe.PosInfos, levelFlag:Bool):Bool {
		if (passesList(message, pos, showList)){
			return true;
		}
		if (!levelFlag){
			return false;
		}
		if (passesList(message, pos, hideList)){
			return false;
		}
		return true;
	}

	private function passesList(?message:Dynamic, ?pos:haxe.PosInfos, list:Array<String>):Bool {
		if (message == null || pos == null){
			return true;
		}
		var str = Std.string(message);
		if (pos != null){
			str += pos.className;
			str += pos.methodName;
			str += pos.fileName;
		}
		for (needle in list){
			if (str.indexOf(needle) > -1){
				return true;
			}
		}
		return false;
	}

	private function mutateMsg(?msg:Dynamic, ?pos:haxe.PosInfos): Dynamic {
		if (msg == null){
			return msg;
		}
		if (!Std.is(msg, String)){
			return msg;
		}
		var str = Std.string(msg);
		str = conditionallyHighlight(str, pos);
		return str;
	}

	private function conditionallyHighlight(message:String, ?pos:haxe.PosInfos):String {
		if (passesList(message, pos, highlightList)){
			return highlight(message);
		}
		return message;
	}
}
