package zenlog;

class FilteredLogger implements ILogger {

    public function new(l:ILogger){
        wrappedLogger = l;
    }

    public var wrappedLogger:ILogger;
	public var enableDebug = false;
	public var enableInfo = true;
	public var enableWarn = true;
	public var enableError = true;
	public var enableCritical = true;
	public var showList: Array<String> = [];
	public var hideList: Array<String> = [];

	public function debug(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
        if (!shouldShow(message, enableDebug)){
			return;
		}
        wrappedLogger.debug(message, extra, pos);
	}

	public function info(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
        if (!shouldShow(message, enableInfo)){
			return;
		}
        wrappedLogger.info(message, extra, pos);
	}

	public function warn(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
        if (!shouldShow(message, enableWarn)){
			return;
		}
        wrappedLogger.warn(message, extra, pos);
	}

	public function error(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
        if (!shouldShow(message, enableError)){
			return;
		}
        wrappedLogger.error(message, extra, pos);
	}

	public function critical(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
        if (!shouldShow(message, enableCritical)){
			return;
		}
        wrappedLogger.critical(message, extra, pos);
	}

	private function shouldShow(?message:Dynamic, levelFlag:Bool):Bool {
		if (passesList(message, showList)){
			return true;
		}
		if (!levelFlag){
			return false;
		}
		if (passesList(message, hideList)){
			return false;
		}
		return true;
	}

	private function passesList(?message:Dynamic, list:Array<String>):Bool {
		if (message == null){
			return true;
		}
		var str = Std.string(message);
		for (needle in list){
			if (str.indexOf(needle) > -1){
				return true;
			}
		}
		return false;
	}
}
