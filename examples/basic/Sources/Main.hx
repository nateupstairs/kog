package;

import kha.System;

class Main {
	public static function main() {
		System.init({
			title: "Kog Testing",
			width: 1024,
			height: 768,
			samplesPerPixel: 4
		}, function () {
			new Project();
		});
	}
}
