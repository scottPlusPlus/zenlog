package test;

import haxe.Json;
import utest.ui.Report;
import utest.Assert;
import utest.Async;
import utest.Runner;

class Test {

	public static function main() {
		Run();
		trace("testing zenlog");
	}

	public static function Run() {
		// the long way
		var runner = new Runner();

		runner.addCases(test.zenlog);
		Report.create(runner);
		runner.run();
	}
}
