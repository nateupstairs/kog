package kog;

import kog.Timer;
import kog.Entity;
import kog.Model;
import kog.Camera;

class Controller {
    public var timer:Timer;
    public var models:Map<String, Model> = new Map<String, Model>();
    public var cameras:Map<String, Camera> = new Map<String, Camera>();

	public function new() {
        
	}

    public function registerTimer(t:Timer) {
        timer = t;
    }

    public function registerCamera(name:String, c:Camera) {
        cameras[name] = c;
    }

    public function registerModel(name:String, m:Model) {
        models[name] = m;
    }

    public function update() {

    }

}