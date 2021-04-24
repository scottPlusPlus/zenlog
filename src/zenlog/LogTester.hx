package zenlog;

class LogTester implements zenlog.ILogger {

    public function new(){}

    public var debugData: Array<LogData> = [];
    public var infoData: Array<LogData> = [];
    public var warnData: Array<LogData> = [];
    public var errorData: Array<LogData> = [];
    public var criticalData: Array<LogData> = [];

	public function debug(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
		debugData.push({message:message, extra:extra, pos:pos});
	}

	public function info(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
		infoData.push({message:message, extra:extra, pos:pos});
	}

	public function warn(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
		warnData.push({message:message, extra:extra, pos:pos});
	}

	public function error(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
		errorData.push({message:message, extra:extra, pos:pos});
	}

	public function critical(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
		criticalData.push({message:message, extra:extra, pos:pos});
	}
}

typedef LogData = {
    ?message:Dynamic,
    ?extra:Array<Dynamic>,
    ?pos: haxe.PosInfos,
}