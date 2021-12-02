package zenlog;

typedef LogData = {
	?message:Dynamic,
	?extra:Array<Dynamic>,
	?pos:haxe.PosInfos,
}