package zenlog;

/*
* Contains an Array<ILogger>.  Whenever logged to, the LogSplitter passes the log to each
* of the underlying loggers.
*/
class LogSplitter {
	public var loggers:Array<ILogger> = [];

    public function new(){}

	public function debug(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
        #if debug
        emptyLoggersWarning();
        #end
		for (logger in loggers) {
			logger.debug(message, extra, pos);
		}
	}

	public function info(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
        #if debug
        emptyLoggersWarning();
        #end
        for (logger in loggers) {
			logger.info(message, extra, pos);
		}
	}

	public function warn(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
        #if debug
        emptyLoggersWarning();
        #end
        for (logger in loggers) {
			logger.warn(message, extra, pos);
		}
	}

	public function error(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
        #if debug
        emptyLoggersWarning();
        #end
        for (logger in loggers) {
			logger.error(message, extra, pos);
		}
	}

	public function critical(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
        #if debug
        emptyLoggersWarning();
        #end
        for (logger in loggers) {
			logger.critical(message, extra, pos);
		}
	}

    #if debug
    private var gaveWarning = false;

    private function emptyLoggersWarning(){
        if (loggers.length == 0){
            if (!gaveWarning){
                trace("You are logging to a LogSplitter with empty loggers.");
            }
        }
    }
    #end
}
