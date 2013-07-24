#import <Foundation/Foundation.h>
#import "Vector.h"

@interface Player : NSObject 
{
	Vector playerPos;
	Vector playerVel;
}

@property(assign) Vector playerPos;
@property(assign) Vector playerVel;

@end
