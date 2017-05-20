package kog;

import kha.graphics4.Graphics;
import kha.graphics4.TextureUnit;
import kha.Image;

class Texture {
	public var name:String;
	public var textureLocation:TextureUnit;
	public var img:Image;
	public var needsUpdate:Bool;

	public function new(_name:String) {
		name = _name;
		needsUpdate = false;
	}

	public function setImage(i:Image) {
		img = i;
		needsUpdate = true;
	}

	public function setTextureLocation(_loc:TextureUnit) {
		textureLocation = _loc;
	}

	public function update(g:Graphics) {
		if (!needsUpdate) {
			return;
		}
		needsUpdate = false;
		g.setTexture(textureLocation, img);
	}

}