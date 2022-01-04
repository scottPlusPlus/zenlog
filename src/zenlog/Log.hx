package zenlog;

/*
* Static Log service, which routes to an underlying ILogger
*/
class Log {

    /*
    * Instance of an ILogger that all logs (ex: Log.debug) will be routed to
    */
    public static var Logger:ILogger = new TraceLogger();

    /*
    * Use this to pass in a Logger implementation that only wants to deal with the strings of the incoming logs
    * (ie, not worry aabout haxe's PosInfos)
    */
    public static function useStringLogger(stringLogger:IStringLogger) {
        Logger = new StringLogWrapper(stringLogger);
    }

    public static function useLogger(logger:ILogger){
        Logger = logger;
    }

    public static inline function debug (?message :Dynamic, ?extra :Array<Dynamic>, ?pos :haxe.PosInfos):Void{
        Logger.debug(message, extra, pos);
    }

    public static inline function info (?message :Dynamic, ?extra :Array<Dynamic>, ?pos :haxe.PosInfos):Void{
        Logger.info(message, extra, pos);
    }

    public static inline function warn (?message :Dynamic, ?extra :Array<Dynamic>, ?pos :haxe.PosInfos):Void{
        Logger.warn(message, extra, pos);
    }

    public static inline function error (?message :Dynamic, ?extra :Array<Dynamic>, ?pos :haxe.PosInfos):Void{
        Logger.error(message, extra, pos);
    }

    public static inline function critical (?message :Dynamic, ?extra :Array<Dynamic>, ?pos :haxe.PosInfos):Void{
        Logger.critical(message, extra, pos);
    }
}