package zenlog;

typedef ILogger = {
    function debug (?message :Dynamic, ?extra :Array<Dynamic>, ?pos :haxe.PosInfos):Void;
    function info (?message :Dynamic, ?extra :Array<Dynamic>, ?pos :haxe.PosInfos):Void;
    function warn (?message :Dynamic, ?extra :Array<Dynamic>, ?pos :haxe.PosInfos):Void;
    function error (?message :Dynamic, ?extra :Array<Dynamic>, ?pos :haxe.PosInfos):Void;
    function critical (?message :Dynamic, ?extra :Array<Dynamic>, ?pos :haxe.PosInfos):Void;
}