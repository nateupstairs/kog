package kog;

import kha.graphics4.Graphics;
import kha.graphics4.PipelineState;
import kha.math.FastMatrix4;
import kha.graphics4.VertexShader;
import kha.graphics4.FragmentShader;
import kha.graphics4.VertexStructure;
import kha.graphics4.CompareMode;
import kha.Assets;
import kog.Model;

class Material {

	public var vert:VertexShader;
	public var frag:FragmentShader;
	public var pipeline:PipelineState;
	public var uniforms:Array<Uniform> = [];
	public var textures:Array<Texture> = [];
	
	private var mvpUniform:kha.graphics4.ConstantLocation;
	private var models:Array<Model> = [];

	public function new(_vert:VertexShader, _frag:FragmentShader, structure:VertexStructure) {
		vert = _vert;
		frag = _frag;
		
		pipeline = new PipelineState();
		pipeline.inputLayout = [structure];
		pipeline.vertexShader = vert;
		pipeline.fragmentShader = frag;
		pipeline.depthWrite = true;
		pipeline.depthMode = CompareMode.Less;
		pipeline.compile();
		
		mvpUniform = pipeline.getConstantLocation('MVP');
	}

	public function register(m:Model) {
		models.push(m);
	}
	
	public function addUniform(u:Uniform) {
		u.setUniformLocation(pipeline.getConstantLocation(u.name));
		uniforms.push(u);
	}

	public function addTexture(t:Texture) {
		t.setTextureLocation(pipeline.getTextureUnit(t.name));
		textures.push(t);
	}
	
	private function updateMVP(g:Graphics, vp:FastMatrix4, model:Model) {
		g.setMatrix(mvpUniform, vp.multmat(model.m));
	}
	
	public function update() {
		for (m in models) {
			m.update();
		}
	}

	public function render(g:Graphics, vp:FastMatrix4) {
		g.setPipeline(pipeline);
		for (u in uniforms) {
			u.update(g);
		}
		for (t in textures) {
			t.update(g);
		}
		for (m in models) {
			updateMVP(g, vp, m);
			g.setVertexBuffer(m.mesh.vertexBuffer);
			g.setIndexBuffer(m.mesh.indexBuffer);
			g.drawIndexedVertices();
		}
	}

}