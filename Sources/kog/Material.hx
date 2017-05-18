package kog;

class Material {
	public var vert:kha.graphics4.VertexShader;
	public var frag:kha.graphics4.FragmentShader;

	public function new(_vert:kha.graphics4.VertexShader, _frag:kha.graphics4.FragmentShader) {
		vert = _vert;
		frag = _frag;
	}

}