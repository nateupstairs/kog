package;

import kog.Controller;

class CameraController extends Controller {

	public override function update() {
		cameras["camera"].pos.z = 5.0;
		cameras["camera"].pos.y = Math.sin(timer.runTime) * 10.0;
		cameras["camera"].pos.x = Math.cos(timer.runTime) * 10.0;
		cameras["camera"].needsUpdate = true;
	}

}