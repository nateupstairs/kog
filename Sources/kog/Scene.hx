package kog;

import kha.Framebuffer;
import kha.Color;
import kog.Camera;
import kog.Material;
import kog.Timer;

class Scene {
	public var camera:Camera;
	public var materials:Array<Material> = [];
	public var timer:Timer = new Timer();
	
	public function new() {
		camera = new Camera();
	}
	
	public function register(m:Material) {
		materials.push(m);
	}

	public function update() {
        timer.update();
		camera.update();
		for (m in materials) {
			m.update();
		}
	}
	
	public function render(frame:Framebuffer) {
		var g = frame.g4;

		g.begin();
		g.clear(Color.fromFloats(0.0, 0.0, 0.0), 1.0);
		for (m in materials) {
			m.render(g, camera.vp);
		}
		g.end();
	}

}