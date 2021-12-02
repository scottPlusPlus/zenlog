package test.zenlog;

import utest.Assert;
import zenlog.*;

class StringLoggerTest extends utest.Test {
	private var _logger:DummyStringLogger;

	function setup() {
		_logger = new DummyStringLogger();
		Log.useStringLogger(_logger);
	}

	function testWorks() {
		var msg = "test message";
		var extra = [123];
		var expected = "test message [123]";
		var tester = _logger.logTester;
		Log.debug(msg, extra);
		Assert.equals(expected, tester.debugData[0].message);

		Log.info(msg, extra);
		Assert.equals(expected, tester.infoData[0].message);

		Log.warn(msg, extra);
		Assert.equals(expected, tester.warnData[0].message);

		Log.error(msg, extra);
		Assert.equals(expected, tester.errorData[0].message);

		Log.critical(msg, extra);
		Assert.equals(expected, tester.criticalData[0].message);
	}
}

class DummyStringLogger {
	public var logTester = new LogTester();

	public function new() {}

	public function debug(msg:String) {
		logTester.debug(msg);
	}

	public function info(msg:String) {
		logTester.info(msg);
	}

	public function warn(msg:String) {
		logTester.warn(msg);
	}

	public function error(msg:String) {
		logTester.error(msg);
	}

	public function critical(msg:String) {
		logTester.critical(msg);
	}
}
