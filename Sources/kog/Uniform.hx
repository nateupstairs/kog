package kog;

import kha.graphics4.Graphics;
import kha.graphics4.ConstantLocation;

class Uniform {
	public var type:String;
	public var name:String;
	public var uniformLocation:ConstantLocation;
	public var valFloat:Float;
	public var needsUpdate:Bool;

	public function new(_type:String, _name:String) {
		type = _type;
		name = _name;
		needsUpdate = false;
	}

	public function setFloat(val:Float) {
		valFloat = val;
		needsUpdate = true;
	}

	public function setUniformLocation(_loc:ConstantLocation) {
		uniformLocation = _loc;
	}

	public function update(g:Graphics) {
		if (!needsUpdate) {
			return;
		}
		needsUpdate = false;
		switch type {
			case 'Float':
				g.setFloat(uniformLocation, valFloat);
			default:
				return;
		}
	}

}