package kog;

import kha.math.FastVector3;
import kha.math.FastMatrix4;
import kog.Timer;

class Camera {
	public var vp:FastMatrix4;
	public var pos:FastVector3 = new FastVector3(0, 0, 0);
	public var pov:Float = 45.0;
	public var aspect:Float = 1.0;
	public var near:Float = 0.1;
	public var far:Float = 100.0;
	public var lookAt:FastVector3 = new FastVector3(0, 0, 0);
	public var up:FastVector3 = new FastVector3(0, 0, 1);
	public var needsUpdate:Bool = false;

	private var view:FastMatrix4;
	private var projection:FastMatrix4;
	
	public function new() {
		updateMV();
	}

	public function update() {
		if (needsUpdate) {
			updateMV();
			needsUpdate = false;
		}
	}

	private function updateMV() {
		projection = FastMatrix4.perspectiveProjection(pov, aspect, near, far);
		// Or, for an ortho camera
		//var projection = FastMatrix4.orthogonalProjection(-10.0, 10.0, -10.0, 10.0, 0.0, 100.0); // In world coordinates
		
		// Camera matrix
		view = FastMatrix4.lookAt(pos, lookAt, up);

		vp = FastMatrix4.identity();
		vp = vp.multmat(projection);
		vp = vp.multmat(view);
	}

}