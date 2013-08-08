#import "HighScoresLayer.h"
#import "MainMenuLayer.h"

@implementation HighScoresLayer

+(CCScene *)scene
{
	CCScene *scene = [CCScene node];
	
	HighScoresLayer *layer = [HighScoresLayer node];
	
	[scene addChild:layer];
	
	return scene;
}

-(id)init
{
	if ((self = [super init]))
	{
        CCMenuItem *miM = [CCMenuItemFont itemFromString:@"M" target:self selector:@selector(M:)];
        
        CCMenu *m = [CCMenu menuWithItems:miM, nil];
        
        [m alignItemsVertically];
        
        [self addChild:m];
	}
	
	return self;
}

-(void)M:(id)sender 
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.5f scene:[MainMenuLayer scene]]];
}

-(void)dealloc
{
	[super dealloc];
}

@end
