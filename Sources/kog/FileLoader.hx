package kog;

import kha.Blob;
import kog.loaders.OgexData;

class FileLoader {
    private var blob:Blob;

    public function new(_blob:Blob) {
       blob = _blob; 
    }

    public function parseOpenGEX() {
        var data = new OgexData(blob.toString());

        return data;
    }

}