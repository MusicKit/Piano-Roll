#import "MainMenuLayer.h"

@implementation MainMenuLayer

+ (CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
	MainMenuLayer *layer = [MainMenuLayer node];
	
	[scene addChild: layer];
	
	return scene;
}

- (id) init
{
	if ((self = [super init]))
	{
		
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];
		
		CGSize size = [[CCDirector sharedDirector] winSize];
		
		label.position =  ccp(size.width / 2 , size.height/ 2);
		
		[self addChild:label];
	}
	
	return self;
}

- (void) dealloc
{
	[super dealloc];
}

@end
