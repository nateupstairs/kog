package kog;

import kha.graphics4.VertexStructure;
import kha.graphics4.VertexBuffer;
import kha.graphics4.IndexBuffer;
import kha.graphics4.VertexData;
import kha.graphics4.Usage;
import kha.Blob;

import kog.FileLoader;

class Mesh {
	private var vertices:Array<Float>;
	private var normals:Array<Float>;
	private var colors:Array<Float>;
	private var uvs:Array<Float>;
	private var indices:Array<Int>;
	
	public var vertexBuffer:VertexBuffer;
	public var indexBuffer:IndexBuffer;
	public var structure:VertexStructure;

	public function new(_blob:Blob) {
		var loader = new FileLoader(_blob);
		var data = loader.parseOpenGEX();

		// Define vertex structure
		structure = new VertexStructure();
		structure.add("pos", VertexData.Float3);
		structure.add("normal", VertexData.Float3);
		//structure.add("color", VertexData.Float3);
		structure.add("uv", VertexData.Float2);

		var structureLength = 8; // 11

		for (vertexData in data.geometryObjects[0].mesh.vertexArrays) {
			switch vertexData.attrib {
				case "position": vertices = vertexData.values;
				case "normal": normals = vertexData.values;
				case "color": colors = vertexData.values;
				case "texcoord": uvs = vertexData.values;
			}
		}
		
		indices = data.geometryObjects[0].mesh.indexArray.values;
        
		vertexBuffer = new VertexBuffer(vertices.length, structure, Usage.StaticUsage);
		var buffer = vertexBuffer.lock();
		for (i in 0...Std.int(vertices.length / 3)) {
			buffer.set(i * structureLength + 0, vertices[i * 3 + 0]);
			buffer.set(i * structureLength + 1, vertices[i * 3 + 1]);
			buffer.set(i * structureLength + 2, vertices[i * 3 + 2]);
			buffer.set(i * structureLength + 3, normals[i * 3 + 0]);
			buffer.set(i * structureLength + 4, normals[i * 3 + 1]);
			buffer.set(i * structureLength + 5, normals[i * 3 + 2]);
			// buffer.set(i * structureLength + 6, colors[i * 3 + 0]);
			// buffer.set(i * structureLength + 7, colors[i * 3 + 1]);
			// buffer.set(i * structureLength + 8, colors[i * 3 + 2]);
			buffer.set(i * structureLength + 6, uvs[i * 2 + 0]);
			buffer.set(i * structureLength + 7, uvs[i * 2 + 1]);
		}
		vertexBuffer.unlock();
		
		indexBuffer = new IndexBuffer(indices.length, Usage.StaticUsage);
		var ibuffer = indexBuffer.lock();
		for (i in 0...indices.length) {
			ibuffer[i] = indices[i];
		}
		indexBuffer.unlock();
	}

}