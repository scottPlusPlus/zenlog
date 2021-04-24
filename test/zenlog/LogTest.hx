package test.zenlog;

import zenlog.LogTester;
import utest.Assert;
import zenlog.Log;

class LogTest extends utest.Test {
	function testLogsToLogger() {
		var testLogger = new LogTester();
		Log.Logger = testLogger;

		var msg = "test message";
		var ext = ["test extra"];
		Log.debug(msg, ext);
		Assert.equals(1, testLogger.debugData.length);
		Assert.equals(msg, testLogger.debugData[0].message);
		Assert.equals(ext, testLogger.debugData[0].extra);

		Log.info(msg, ext);
		Assert.equals(1, testLogger.infoData.length);
		Assert.equals(msg, testLogger.infoData[0].message);
		Assert.equals(ext, testLogger.infoData[0].extra);

		Log.warn(msg, ext);
		Assert.equals(1, testLogger.warnData.length);
		Assert.equals(msg, testLogger.warnData[0].message);
		Assert.equals(ext, testLogger.warnData[0].extra);

		Log.error(msg, ext);
		Assert.equals(1, testLogger.warnData.length);
		Assert.equals(msg, testLogger.warnData[0].message);
		Assert.equals(ext, testLogger.warnData[0].extra);

		Log.critical(msg, ext);
		Assert.equals(1, testLogger.criticalData.length);
		Assert.equals(msg, testLogger.criticalData[0].message);
		Assert.equals(ext, testLogger.criticalData[0].extra);
	}

}
