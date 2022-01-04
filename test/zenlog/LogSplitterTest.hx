package test.zenlog;

import zenlog.LogSplitter;
import zenlog.LogTester;
import utest.Assert;
import zenlog.Log;

class LogSplitterTest extends utest.Test {
	function testLogSplitter() {

		var testLoggerA = new LogTester();
        var testLoggerB = new LogTester();
        var splitter = new LogSplitter();
        splitter.loggers = [testLoggerA, testLoggerB];
		Log.Logger = splitter;

		var msg = "test message";
		Log.debug(msg);
		Assert.equals(1, testLoggerA.debugData.length);
		Assert.equals(msg, testLoggerA.debugData[0].message);
		Assert.equals(1, testLoggerB.debugData.length);
		Assert.equals(msg, testLoggerB.debugData[0].message);

		Log.info(msg);
		Assert.equals(1, testLoggerA.infoData.length);
		Assert.equals(msg, testLoggerA.infoData[0].message);
		Assert.equals(1, testLoggerB.infoData.length);
		Assert.equals(msg, testLoggerB.infoData[0].message);

		Log.warn(msg);
		Assert.equals(1, testLoggerA.warnData.length);
		Assert.equals(msg, testLoggerA.warnData[0].message);
		Assert.equals(1, testLoggerB.warnData.length);
		Assert.equals(msg, testLoggerB.warnData[0].message);

		Log.error(msg);
		Assert.equals(1, testLoggerA.warnData.length);
		Assert.equals(msg, testLoggerA.warnData[0].message);
		Assert.equals(1, testLoggerB.warnData.length);
		Assert.equals(msg, testLoggerB.warnData[0].message);

		Log.critical(msg);
		Assert.equals(1, testLoggerA.criticalData.length);
		Assert.equals(msg, testLoggerA.criticalData[0].message);
		Assert.equals(1, testLoggerB.criticalData.length);
		Assert.equals(msg, testLoggerB.criticalData[0].message);
	}

}
