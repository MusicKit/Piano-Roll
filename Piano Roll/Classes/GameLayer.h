#import "cocos2d.h"
#import "Vector.h"
#import "Player.h"

@interface GameLayer : CCLayer
{
	// tilemap
	NSString *tilemapPath;
	CCTMXTiledMap *tilemapNode;
	CCTMXLayer *platformLayer;
	
	// game info
	Vector gravityAcceleration;
	Vector tilemapVelocity;
	Vector startPos;
	Vector tilemapPos;
	
	// user
	Player *user;
}

+ (CCScene *) scene;

- (void) transitionToScoreScene;

@end
