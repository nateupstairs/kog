package kog;

import kha.math.FastMatrix4;
import kog.Mesh;
import kog.Timer;

class Model {
	public var mesh:kog.Mesh;
	public var m:FastMatrix4;
	public var needsUpdate:Bool = false;

	public function new(_mesh:kog.Mesh) {
		mesh = _mesh;
		updateM();
	}

	public function updateM() {
		m = FastMatrix4.identity();
	}

	public function update() {
		if (needsUpdate) {
			updateM();
			needsUpdate = false;
		}
	}

}