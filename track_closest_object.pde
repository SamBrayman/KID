//adapted from Greg Borenstein's "Making Things See"

import SimpleOpenNI.*;

SimpleOpenNI kinect;

int closestValue;
int closestX;
int closestY;
int closestZ;

void setup() {
    size(640, 480);
    kinect = new SimpleOpenNI(this);
    kinect.enableDepth();
}

void draw() {
    closestValue = 8000;
    kinect.update();
    
    int[] depthValues = kinect.depthMap();
    
    for (int y = 0; y < 480; y++) {
        for (int x = 0; x < 640; x++) {
            int i = x + y * 640;
            int currentDepthValue = depthValues[i];
            
             if (currentDepthValue > 0 && currentDepthValue < closestValue) {
                 closestX = x;
                 closestY = Y;
             }
        }
    }
    
    image(kinect.depthImage(), 0, 0);
    fill(255, 0, 0);
    ellipse(closestX, closestY, 25, 25);
}