#import "cocos2d.h"
#import "Vector.h"

@interface Player:NSObject 
{
	Vector playerSiz;
	Vector playerPos;
	Vector playerVel;
}

-(id)initWithSpritesheet:(NSString *)spritesheetPath andPosition:(Vector)pos;

-(void)updateWithGravityAcceleration:(Vector)g andDelta:(ccTime)dt;

@property(assign) Vector playerSiz;
@property(assign) Vector playerPos;
@property(assign) Vector playerVel;

@end
