//
//  Piano_RollAppDelegate.h
//  Piano Roll
//
//  Created by Nikola Whallon on 7/19/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface Piano_RollAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
