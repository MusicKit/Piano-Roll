#import "Vector.h"

Vector makeVector(float x, float y)
{
    Vector v;
    v.x = x;
    v.y = y;
    
    return v;
}

Vector addVectors(Vector v, Vector w)
{
    Vector u;
    
    u.x = v.x + w.x;
    u.y = v.y + w.y;
    
    return u;
}

Vector multiplyVectorByScaler(Vector v, float s)
{
    Vector u;
    
    u.x = v.x * s;
    u.y = v.y * s;
    
    return u;
}

CGPoint vectorToCGPoint(Vector v)
{
    CGPoint p;
    
    p.x = v.x;
    p.y = v.y;
    
    return p;
}