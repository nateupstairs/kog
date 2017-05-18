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

class Project {
	var scene:kog.Scene;
	var timer:kog.Timer;

	public function new() {
		timer = new kog.Timer();
		scene = new kog.Scene();
		
		// An array of 3 vectors representing 3 vertices to form a triangle
		var vertices:Array<Float> = [
			-1.0, -1.0, 0.0, // Bottom-left
			1.0, -1.0, 0.0, // Bottom-right
			0.0,  1.0, 0.0  // Top
		];
		// Indices for our triangle, these will point to vertices above
		var indices:Array<Int> = [
			0, // Bottom-left
			1, // Bottom-right
			2  // Top
		];

		var mesh = new kog.Mesh(vertices, indices);
		var material = new kog.Material(Shaders.simple_vert, Shaders.simple_frag);
		var model = new kog.Model(mesh, material);

		scene.register(model);

		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
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