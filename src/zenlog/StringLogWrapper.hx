package zenlog;

class StringLogWrapper {
	public var logger:IStringLogger;

	public function new(logger:IStringLogger) {
		this.logger = logger;
	}

	public function debug(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
		var str = logToString(message, extra, pos);
		logger.debug(str);
	}

	public function info(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
		var str = logToString(message, extra, pos);
		logger.info(str);
	}

	public function warn(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
		var str = logToString(message, extra, pos);
		logger.warn(str);
	}

	public function error(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
		var str = logToString(message, extra, pos);
		logger.error(str);
	}

	public function critical(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
		var str = logToString(message, extra, pos);
		logger.critical(str);
	}

	private inline function logToString(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):String {
		return Std.string(message + (extra != null ? " [" + extra.join(", ") + "]" : ""));
	}
}
