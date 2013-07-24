#import "GameLayer.h"
#import "MainMenuLayer.h"

@implementation GameLayer

+ (CCScene *) scene
{	
	CCScene *scene = [CCScene node];
	
	GameLayer *layer = [GameLayer node];
	
	[scene addChild:layer];
	
	return scene;
}

- (id) init
{
	if ((self = [super init]))
	{
		// menu
        CCMenuItemImage *backButton = [CCMenuItemImage itemFromNormalImage : @"back.png" selectedImage : @"back.png" target : self selector : @selector(goBack:)];
        CCMenu *gameMenu = [CCMenu menuWithItems:backButton, nil];

		gameMenu.position = ccp(0, 0);
        backButton.position = ccp(0 + backButton.contentSize.width, 320 - backButton.contentSize.height);

        [self addChild:gameMenu];
		
		// tilemap
		tilemapPath = @"piano-roll_test.tmx";
		tilemapNode = [CCTMXTiledMap tiledMapWithTMXFile:tilemapPath];
		tilemapNode.anchorPoint = ccp(0, 0);
		
		for (CCTMXLayer *child in [tilemapNode children]) 
        {
			[[child texture] setAntiAliasTexParameters];
		}
		
		platformLayer = [tilemapNode layerNamed:@"Platform Layer"];
				
		[self addChild:tilemapNode];
		
		// game info
		gravityAcceleration = makeVector(0, 0);
		tilemapVelocity = makeVector(-256, 0);									// init from tilemap file
		startPos = makeVector(0, 700);											// init from tilemap file
		tilemapPos = makeVector(-startPos.x + 240, -startPos.y);				// init from startPoint
		
		// user
		user = [[Player alloc] init];
		[user setPlayerPos:startPos];
		[user setPlayerVel:makeVector(0, 0)];
		
		// update function
		[self schedule:@selector(update:) interval:1.0/60];
	}
	
	return self;
}

- (void) update:(ccTime)delta
{
	// tilemap
	tilemapPos.y = -[user playerPos].y;
	tilemapPos = addVectors(tilemapPos, makeVector(tilemapVelocity.x * delta, tilemapVelocity.y * delta));
	[tilemapNode setPosition:vectorToCGPoint(tilemapPos)];
	
	// user
	[user setPlayerVel:addVectors([user playerVel], multiplyVectorByScaler(gravityAcceleration, delta))];
	[user setPlayerPos:addVectors([user playerPos], makeVector([user playerVel].x * delta, [user playerVel].y * delta))];
	
	// finished level
	if (tilemapNode.contentSize.width < -tilemapPos.x)
	{
		[self transitionToScoreScene];
	}
}

- (void) goBack:(id)sender 
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[MainMenuLayer scene]]];
	[self unschedule : @selector(update:)];
}

- (void) transitionToScoreScene
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[MainMenuLayer scene]]];
	[self unschedule : @selector(update:)];
}

- (void) dealloc
{
	[super dealloc];
}

@end
