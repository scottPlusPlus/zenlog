package test.zenlog;

import zenlog.LogTester;
import zenlog.FilteredLogger;
import utest.Assert;
import zenlog.Log;

class FilteredLoggerTest extends utest.Test {

	private var _testLogger: LogTester;
	private var _filteredLogger:FilteredLogger;

	function setup(){
		_testLogger = new LogTester();
		_filteredLogger = new FilteredLogger(_testLogger);
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
		var msg = "foo message";
		Log.info(msg);
		Assert.equals(1, _testLogger.infoData.length);

		_filteredLogger.hideList.push("foo");
		Log.info(msg);
		Assert.equals(1, _testLogger.infoData.length);

		var msg_two = "no f-word";
		Log.info(msg_two);
		Assert.equals(2, _testLogger.infoData.length);
		Assert.equals(msg_two, _testLogger.infoData[1].message);

		_filteredLogger.hideList.push("test");
		Log.info(msg_two);
		//log was hidden because its origin method / class contains "test"
		Assert.equals(2, _testLogger.infoData.length);
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
