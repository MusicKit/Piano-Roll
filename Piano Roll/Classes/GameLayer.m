#import "GameLayer.h"

@implementation GameLayer

+(CCScene *)scene
{	
	CCScene *scene = [CCScene node];
	
	GameLayer *layer = [GameLayer node];
	
	[scene addChild:layer];
	
	return scene;
}

-(id)init
{
	if ((self = [super init]))
	{
		CCMenuItemImage *miGoBack = [CCMenuItemImage itemFromNormalImage:@"back.png" selectedImage:@"back.png" target:self selector:@selector(goBack:)];
		
		CCMenuItem *miPlay = [CCMenuItemImage itemFromNormalImage:@"play.png" selectedImage:@"play.png" target:nil selector:nil];
		CCMenuItem *miPause = [CCMenuItemImage itemFromNormalImage:@"pause.png" selectedImage:@"pause.png" target:nil selector:nil];
		CCMenuItemToggle *miPlayPause; 
		miPlayPause = [CCMenuItemToggle itemWithTarget:self selector:@selector(playPause:) items:miPlay, miPause, nil];		
		
		CCMenu *gameMenu = [CCMenu menuWithItems:miGoBack, miPlayPause, nil];
		
		gameMenu.position = ccp(0, 0);
		miGoBack.position = ccp(0 + miGoBack.contentSize.width, screenHeight - miGoBack.contentSize.height);
		miPlayPause.position = ccp(0 + 2.5 * miPlayPause.contentSize.width, screenHeight - miPlayPause.contentSize.height);
		
		[self addChild:gameMenu];
		
		tilemapNode = [CCTMXTiledMap tiledMapWithTMXFile:tilemapPath];
		tilemapNode.anchorPoint = ccp(0, 0);
		
		for (CCTMXLayer *child in [tilemapNode children]) 
		{
			[[child texture] setAntiAliasTexParameters];
		}
				
		[self addChild:tilemapNode];
				
		startPos = makeVector(0, 700);
		gravityAcceleration = makeVector(0, -2);
		
		tilemapPos = makeVector(-startPos.x + screenWidth / 2, -startPos.y);
		[tilemapNode setPosition:vectorToCGPoint(tilemapPos)];
		tilemapVelocity = makeVector(-256, 0);
		
		paused = 1;
		score = 0;
		
		user = [[Player alloc] initWithSpritesheet:@"user.plist" andPosition:startPos];
				
		[self schedule:@selector(update:) interval:1.0 / 60.0];
	}
	
	return self;
}

-(void)update:(ccTime)delta
{
	if (!paused)
	{
		// user
		[user updateWithGravityAcceleration:gravityAcceleration andDelta:delta];

		// tilemap
		tilemapPos.y = -[user playerPos].y;
		tilemapPos = addVectors(tilemapPos, makeVector(tilemapVelocity.x * delta, tilemapVelocity.y * delta));
		[tilemapNode setPosition:vectorToCGPoint(tilemapPos)];
			
		// finished level
		if (tilemapNode.contentSize.width < -tilemapPos.x)
		{
			[self transitionToHighScoresScene];
		}
	}
}

-(void)goBack:(id)sender 
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[MainMenuLayer scene]]];
	[self unschedule:@selector(update:)];
}

-(void)playPause:(id)sender 
{
	paused ^= 1;
}

-(void)transitionToHighScoresScene
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[HighScoresLayer scene]]];
	[self unschedule:@selector(update:)];
}

-(void)dealloc
{
	[super dealloc];
}

@end
