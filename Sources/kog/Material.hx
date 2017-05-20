package kog;

import kha.graphics4.Graphics;
import kha.graphics4.PipelineState;
import kha.math.FastMatrix4;
import kha.graphics4.VertexShader;
import kha.graphics4.FragmentShader;
import kha.graphics4.VertexStructure;
import kog.Model;

class Material {

	public var vert:VertexShader;
	public var frag:FragmentShader;

	private var pipeline:PipelineState;
	private var mvpUniform:kha.graphics4.ConstantLocation;
	private var models:Array<Model> = [];

	public function new(_vert:VertexShader, _frag:FragmentShader, structure:VertexStructure) {
		vert = _vert;
		frag = _frag;
		
		pipeline = new PipelineState();
		pipeline.inputLayout = [structure];
		pipeline.vertexShader = vert;
		pipeline.fragmentShader = frag;
		pipeline.compile();
		
		mvpUniform = pipeline.getConstantLocation('MVP');
	}

	public function register(m:Model) {
		models.push(m);
	}
	
	private function updateMVP(g:Graphics, vp:FastMatrix4) {
		var model = FastMatrix4.identity();
		var mvp:FastMatrix4 = vp.multmat(model);
		
		g.setMatrix(mvpUniform, mvp);
	}
	
	public function update(delta:Float) {
		for (m in models) {
			m.update(delta);
		}
	}

	public function render(g:Graphics, vp:FastMatrix4) {
		g.setPipeline(pipeline);
		for (m in models) {
			updateMVP(g, vp);
			g.setVertexBuffer(m.mesh.vertexBuffer);
			g.setIndexBuffer(m.mesh.indexBuffer);
			g.drawIndexedVertices();
		}
	}

}