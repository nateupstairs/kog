package kog;

import kha.Framebuffer;
import kha.Color;
import kog.Camera;
import kog.Material;

class Scene {
	public var camera:Camera;
	public var materials:Array<Material> = [];
	
	public function new() {
		camera = new Camera();
	}
	
	public function register(m:Material) {
		materials.push(m);
	}

	public function update(delta:Float) {
		for (m in materials) {
			m.update(delta);
		}
	}
	
	public function render(frame:Framebuffer) {
		var g = frame.g4;

		g.begin();
		g.clear(Color.Black);
		for (m in materials) {
			m.render(g, camera.vp);
		}
		g.end();
	}

}