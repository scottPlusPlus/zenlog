package zenlog;

class TraceLogger implements ILogger  {
	
	public function new(){}
	
	public function debug(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
		haxe.Log.trace(message + (extra != null ? " [" + extra.join(", ") + "]" : ""), pos);
	}

	public function info(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
		haxe.Log.trace(message + (extra != null ? " [" + extra.join(", ") + "]" : ""), pos);
	}

	public function warn(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
		haxe.Log.trace(message + (extra != null ? " [" + extra.join(", ") + "]" : ""), pos);
	}

	public function error(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
		haxe.Log.trace(message + (extra != null ? " [" + extra.join(", ") + "]" : ""), pos);
	}

	public function critical(?message:Dynamic, ?extra:Array<Dynamic>, ?pos:haxe.PosInfos):Void {
		haxe.Log.trace(message + (extra != null ? " [" + extra.join(", ") + "]" : ""), pos);
	}
}
