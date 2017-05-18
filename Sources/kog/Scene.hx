package kog;

import kha.Framebuffer;
import kha.Color;

class Scene {
	var models:Array<Model>;
	
	public function new() {
		models = [];
	}
	
	public function register(m:Model) {
		models.push(m);
	}

	public function update(delta:Float) {
		for (m in models) {
			m.update(delta);
		}
	}
	
	public function render(frame:Framebuffer) {
		var g = frame.g4;

		g.begin();
		g.clear(Color.Black);
		for (m in models) {
			m.render(frame);
		}
		g.end();
	}

}