#import "Player.h"

@implementation Player

-(id)init
{
	self = [super init];

    if (self) 
    {
    }

    return self;
}

-(id)initWithSpritesheet:(NSString *) spritesheetPath andPosition:(Vector)pos
{
	self = [super init];
	
    if (self)
    {
		playerSiz = makeVector(32, 32);
		playerPos = pos;
		playerVel = makeVector(0, 0);
    }
	
    return self;
}

-(void)updateWithGravityAcceleration:(Vector)g andDelta:(ccTime)dt
{
	playerVel = addVectors(playerVel, multiplyVectorByScaler(g, dt));
	playerPos = addVectors(playerPos, multiplyVectorByScaler(playerVel, dt));
}

@synthesize playerSiz;
@synthesize playerPos;
@synthesize playerVel;

@end
