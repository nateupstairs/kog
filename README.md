# Kog

A kha 3D library. The end goal is simple abstractions for:

- [ ] Scene
- [ ] Camera
- [ ] Mesh
- [ ] Material
- [ ] Model
- [ ] Timer

example:

```
package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.Shaders;
import kha.Assets;

class Project {
	var scene:kog.Scene;
	var timer:kog.Timer;

	public function new() {
		timer = new kog.Timer();
		scene = new kog.Scene();
		
		Assets.loadEverything(displayModel);

		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
	}

	private function displayModel() {
		// An array of vertices to form a cube
		var vertices:Array<Float> = [
			-1.0,-1.0,-1.0,
			-1.0,-1.0, 1.0,
			-1.0, 1.0, 1.0,
			1.0, 1.0,-1.0,
			-1.0,-1.0,-1.0,
			-1.0, 1.0,-1.0,
			1.0,-1.0, 1.0,
			-1.0,-1.0,-1.0,
			1.0,-1.0,-1.0,
			1.0, 1.0,-1.0,
			1.0,-1.0,-1.0,
			-1.0,-1.0,-1.0,
			-1.0,-1.0,-1.0,
			-1.0, 1.0, 1.0,
			-1.0, 1.0,-1.0,
			1.0,-1.0, 1.0,
			-1.0,-1.0, 1.0,
			-1.0,-1.0,-1.0,
			-1.0, 1.0, 1.0,
			-1.0,-1.0, 1.0,
			1.0,-1.0, 1.0,
			1.0, 1.0, 1.0,
			1.0,-1.0,-1.0,
			1.0, 1.0,-1.0,
			1.0,-1.0,-1.0,
			1.0, 1.0, 1.0,
			1.0,-1.0, 1.0,
			1.0, 1.0, 1.0,
			1.0, 1.0,-1.0,
			-1.0, 1.0,-1.0,
			1.0, 1.0, 1.0,
			-1.0, 1.0,-1.0,
			-1.0, 1.0, 1.0,
			1.0, 1.0, 1.0,
			-1.0, 1.0, 1.0,
			1.0,-1.0, 1.0
		];
		// Array of texture coords for each cube vertex
		var uvs:Array<Float> = [
			0.000059, 0.000004, 
			0.000103, 0.336048, 
			0.335973, 0.335903, 
			1.000023, 0.000013, 
			0.667979, 0.335851, 
			0.999958, 0.336064, 
			0.667979, 0.335851, 
			0.336024, 0.671877, 
			0.667969, 0.671889, 
			1.000023, 0.000013, 
			0.668104, 0.000013, 
			0.667979, 0.335851, 
			0.000059, 0.000004, 
			0.335973, 0.335903, 
			0.336098, 0.000071, 
			0.667979, 0.335851, 
			0.335973, 0.335903, 
			0.336024, 0.671877, 
			1.000004, 0.671847, 
			0.999958, 0.336064, 
			0.667979, 0.335851, 
			0.668104, 0.000013, 
			0.335973, 0.335903, 
			0.667979, 0.335851, 
			0.335973, 0.335903,
			0.668104, 0.000013, 
			0.336098, 0.000071, 
			0.000103, 0.336048, 
			0.000004, 0.671870, 
			0.336024, 0.671877, 
			0.000103, 0.336048, 
			0.336024, 0.671877, 
			0.335973, 0.335903, 
			0.667969, 0.671889, 
			1.000004, 0.671847, 
			0.667979, 0.335851
		];

		var mesh = new kog.Mesh(vertices, uvs);
		var structure = mesh.structure;
		var material = new kog.Material(
			Shaders.simple_vert,
			Shaders.simple_frag,
			structure
		);
		var model = new kog.Model(mesh);
		
		var uniformR = new kog.Uniform('Float', 'redColor');
		uniformR.setFloat(1.0);
		material.addUniform(uniformR);

		var tex = new kog.Texture('tex');
		tex.setImage(Assets.images.uvtemplate);
		material.addTexture(tex);
		
		material.register(model);
		scene.register(material);
	}

	function update(): Void {
		timer.update();
		scene.update(timer.deltaTime);
	}

	function render(framebuffer: Framebuffer): Void {
		scene.render(framebuffer);		
	}
}
```