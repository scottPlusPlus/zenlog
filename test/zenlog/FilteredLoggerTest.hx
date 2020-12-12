package test.zenlog;

import zenlog.FilteredLogger;
import utest.ITest;
import utest.Assert;
import zenlog.Log;

class FilteredLoggerTest extends utest.Test {

	private var _testLogger: TestLogger;
	private var _filteredLogger:FilteredLogger;

	function setup(){
		_testLogger = new TestLogger();
		_filteredLogger = new FilteredLogger(_testLogger);
		_filteredLogger.indentStackStart = 999;
		Log.Logger = _filteredLogger;
	}

	function testLevels() {
		var msg = "test message";
		var ext = ["test extra"];
		Log.info(msg, ext);
		Assert.equals(1, _testLogger.infoData.length);
		Assert.equals(msg, _testLogger.infoData[0].message);

		_filteredLogger.enableInfo = false;
		Log.info(msg, ext);
		Assert.equals(1, _testLogger.infoData.length);
	}

	function testHides() {
		var msg = "test message";
		var ext = ["test extra"];
		Log.info(msg, ext);
		Assert.equals(1, _testLogger.infoData.length);

		_filteredLogger.hideList.push("test");
		Log.info(msg, ext);
		Assert.equals(1, _testLogger.infoData.length);

		var msg_two = "not a t e s t";
		Log.info(msg_two, ext);
		Assert.equals(2, _testLogger.infoData.length);
		Assert.equals(msg_two, _testLogger.infoData[1].message);
	}

	function testShow() {
		var msg = "test message";
		var ext = ["test extra"];
		_filteredLogger.enableInfo = false;

		Log.info(msg, ext);
		Assert.equals(0, _testLogger.infoData.length);
		_filteredLogger.showList.push("mess");

		Log.info(msg, ext);
		Assert.equals(1, _testLogger.infoData.length);
		Assert.equals(msg, _testLogger.infoData[0].message);
	}

	function testHighlight(){
		_filteredLogger.highlightList.push("foo");
		_filteredLogger.highlight = function(str:String):String{
			return "***"+str+"***";
		}
		_filteredLogger.info("foobar");
		Assert.equals("***foobar***", _testLogger.infoData[0].message);
	}
}
