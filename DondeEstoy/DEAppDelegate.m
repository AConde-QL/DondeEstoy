//
//  DEAppDelegate.m
//  DondeEstoy
//
//  Created by Antonio Conde on 2/18/13.
//  Copyright (c) 2013 com.conde. All rights reserved.
//

#import "DEAppDelegate.h"

#import "DEViewController.h"

@implementation DEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[DEViewController alloc] initWithNibName:@"DEViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
