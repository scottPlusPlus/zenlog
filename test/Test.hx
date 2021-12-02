package test;

import utest.ui.Report;
import utest.Runner;

class Test {
	public static function main() {
		var runner = new Runner();
		runner.addCases(test.zenlog);
		Report.create(runner);
		runner.run();
	}
}
