#import "cocos2d.h"

typedef struct {
    float x;
    float y;
} Vector;

Vector makeVector(float x, float y);
Vector addVectors(Vector v, Vector w);
Vector multiplyVectorByScaler(Vector v, float s);
CGPoint vectorToCGPoint(Vector v);