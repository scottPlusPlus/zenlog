package zenlog;

/*
* Static Log service, which routes to an underlying ILogger
*/
class Log {
    public static var Logger:ILogger = new TraceLogger();

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