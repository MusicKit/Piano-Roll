#import "cocos2d.h"
#import "Globals.h"
#import "Vector.h"
#import "Player.h"
#import "MainMenuLayer.h"
#import "HighScoresLayer.h"

@interface GameLayer:CCLayer
{
	CCTMXTiledMap *tilemapNode;
	Vector tilemapPos;
	Vector tilemapVelocity;

	Vector startPos;
	Vector gravityAcceleration;

	BOOL paused;
	int score;
	
	Player *user;
}

+(CCScene *)scene;

-(void)transitionToHighScoresScene;

@end
