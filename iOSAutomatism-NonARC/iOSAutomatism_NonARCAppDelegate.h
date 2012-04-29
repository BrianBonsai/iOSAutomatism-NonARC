//
//  iOSAutomatism_NonARCAppDelegate.h
//  iOSAutomatism-NonARC
//
//  Created by  on 12/04/29.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iOSAutomatism_NonARCViewController;

@interface iOSAutomatism_NonARCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) iOSAutomatism_NonARCViewController *viewController;

@end
