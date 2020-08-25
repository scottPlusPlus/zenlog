package test.zenlog;

import zenlog.FilteredLogger;
import utest.ITest;
import utest.Assert;
import zenlog.Log;

class FilteredLoggerTest extends utest.Test {
	function testLevels() {
		var testLogger = new TestLogger();
		var filteredLogger = new FilteredLogger(testLogger);
		Log.Logger = filteredLogger;

		var msg = "test message";
		var ext = ["test extra"];
		Log.info(msg, ext);
		Assert.equals(1, testLogger.infoData.length);
		Assert.equals(msg, testLogger.infoData[0].message);

		filteredLogger.enableInfo = false;
		Log.info(msg, ext);
		Assert.equals(1, testLogger.infoData.length);
	}

	function testHides() {
		var testLogger = new TestLogger();
		var filteredLogger = new FilteredLogger(testLogger);
		Log.Logger = filteredLogger;

		var msg = "test message";
		var ext = ["test extra"];
		Log.info(msg, ext);
		Assert.equals(1, testLogger.infoData.length);

		filteredLogger.hideList.push("test");
		Log.info(msg, ext);
		Assert.equals(1, testLogger.infoData.length);

		var msg_two = "not a t e s t";
		Log.info(msg_two, ext);
		Assert.equals(2, testLogger.infoData.length);
		Assert.equals(msg_two, testLogger.infoData[1].message);
	}

	function testShow() {
		var testLogger = new TestLogger();
		var filteredLogger = new FilteredLogger(testLogger);
		Log.Logger = filteredLogger;

		var msg = "test message";
		var ext = ["test extra"];
		filteredLogger.enableInfo = false;

		Log.info(msg, ext);
		Assert.equals(0, testLogger.infoData.length);
		filteredLogger.showList.push("mess");

		Log.info(msg, ext);
		Assert.equals(1, testLogger.infoData.length);
		Assert.equals(msg, testLogger.infoData[0].message);
	}
}
