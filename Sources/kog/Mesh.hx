package kog;

import kha.graphics4.VertexStructure;
import kha.graphics4.VertexBuffer;
import kha.graphics4.IndexBuffer;
import kha.graphics4.VertexData;
import kha.graphics4.Usage;

class Mesh {
	private var vertices:Array<Float>;
	private var uvs:Array<Float>;
	
	public var vertexBuffer:VertexBuffer;
	public var indexBuffer:IndexBuffer;
	public var structure:VertexStructure;

	public function new(_vertices:Array<Float>, _uvs:Array<Float>) {
		vertices = _vertices;
		uvs = _uvs;
		
		// Define vertex structure
		structure = new VertexStructure();
		structure.add("pos", VertexData.Float3);
		structure.add("uv", VertexData.Float2);
        
		// Save length - we store position and uv data
		var structureLength = 5;

		// Create vertex buffer
		vertexBuffer = new VertexBuffer(
			Std.int(vertices.length / 3), // Vertex count - 3 floats per vertex
			structure, // Vertex structure
			Usage.StaticUsage // Vertex data will stay the same
		);
		
		// Copy vertices and uvs to vertex buffer
		var vbData = vertexBuffer.lock();
		for (i in 0...Std.int(vbData.length / structureLength)) {
			vbData.set(i * structureLength, vertices[i * 3]);
			vbData.set(i * structureLength + 1, vertices[i * 3 + 1]);
			vbData.set(i * structureLength + 2, vertices[i * 3 + 2]);
			vbData.set(i * structureLength + 3, uvs[i * 2]);
			vbData.set(i * structureLength + 4, uvs[i * 2 + 1]);
		}
		vertexBuffer.unlock();

		// A 'trick' to create indices for a non-indexed vertex data
		var indices:Array<Int> = [];
		for (i in 0...Std.int(vertices.length / 3)) {
			indices.push(i);
		}

		// Create index buffer
		indexBuffer = new IndexBuffer(
			indices.length, // Number of indices for our cube
			Usage.StaticUsage // Index data will stay the same
		);
		
		// Copy indices to index buffer
		var iData = indexBuffer.lock();
		for (i in 0...iData.length) {
			iData[i] = indices[i];
		}
		indexBuffer.unlock();
	}

}