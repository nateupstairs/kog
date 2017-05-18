package kog;

import kha.Framebuffer;
import kha.Color;
import kha.graphics4.PipelineState;
import kha.graphics4.FragmentShader;
import kha.graphics4.VertexShader;


class Model {
	var mesh:kog.Mesh;
	var material:kog.Material;
	var pipeline:PipelineState;

	public function new(_mesh:kog.Mesh, _material:kog.Material) {
		mesh = _mesh;
		material = _material;
	
		pipeline = new PipelineState();
		pipeline.inputLayout = [mesh.structure];
		pipeline.vertexShader = material.vert;
		pipeline.fragmentShader = material.frag;
		pipeline.compile();
	}

	public function update(delta:Float) {
	
	}

	public function render(frame:Framebuffer) {
		var g = frame.g4;
		
		g.setPipeline(pipeline);
		g.setVertexBuffer(mesh.vertexBuffer);
		g.setIndexBuffer(mesh.indexBuffer);
		g.drawIndexedVertices();
	}

}