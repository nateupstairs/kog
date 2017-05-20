package kog;

import kha.math.FastVector3;
import kha.math.FastMatrix4;

class Camera {
	public var vp:FastMatrix4;
	
	private var view:FastMatrix4;
	private var projection:FastMatrix4;
	private var pos:FastVector3;
	private var pov:Float;
	private var aspect:Float;
	private var near:Float;
	private var far:Float;
	
	public function new() {
		// Projection matrix: 45° Field of View, 4:3 ratio, display range : 0.1 unit <-> 100 units
		projection = FastMatrix4.perspectiveProjection(45.0, 4.0 / 3.0, 0.1, 100.0);
		// Or, for an ortho camera
		//var projection = FastMatrix4.orthogonalProjection(-10.0, 10.0, -10.0, 10.0, 0.0, 100.0); // In world coordinates
		
		// Camera matrix
		view = FastMatrix4.lookAt(new FastVector3(4, 3, 3), // Camera is at (4, 3, 3), in World Space
								  new FastVector3(0, 0, 0), // and looks at the origin
								  new FastVector3(0, 1, 0) // Head is up (set to (0, -1, 0) to look upside-down)
		);
		
		vp = FastMatrix4.identity();
		vp = vp.multmat(projection);
		vp = vp.multmat(view);
	}

}