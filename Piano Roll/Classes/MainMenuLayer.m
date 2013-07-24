#import "MainMenuLayer.h"
#import "GameLayer.h"

@implementation MainMenuLayer

+ (CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
	MainMenuLayer *layer = [MainMenuLayer node];
	
	[scene addChild:layer];
	
	return scene;
}

- (id) init
{
	if ((self = [super init]))
	{
        CCMenuItem *testButton = [CCMenuItemFont itemFromString:@"test" target:self selector:@selector(playTest:)];
        
        CCMenu *mainMenu = [CCMenu menuWithItems:testButton, nil];
        
        [mainMenu alignItemsVertically];
        
        [self addChild:mainMenu];
	}
	
	return self;
}

- (void) playTest : (id) sender 
{
    [[CCDirector sharedDirector] replaceScene:
	 [CCTransitionFade transitionWithDuration:0.5f scene:[GameLayer scene]]];
}

- (void) dealloc
{
	[super dealloc];
}

@end
