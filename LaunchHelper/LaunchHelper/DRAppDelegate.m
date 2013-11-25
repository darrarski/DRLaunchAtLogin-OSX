//
//  DRAppDelegate.m
//  LaunchHelper
//
//  Created by Dariusz Rybicki on 25.11.2013.
//  Copyright (c) 2013 Darrarski. All rights reserved.
//

#import "DRAppDelegate.h"

static NSString *DRLaunchHelperMainApplicationIdentifier = @"pl.darrarski.MyApp";
static NSString *DRLaunchHelperMainApplicationProductName = @"MyApp";

@implementation DRAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// check if main app is already running
    BOOL alreadyRunning = NO;
    NSArray *running = [[NSWorkspace sharedWorkspace] runningApplications];
    for (NSRunningApplication *app in running)
	{
		if ([[app bundleIdentifier] isEqualToString:DRLaunchHelperMainApplicationIdentifier])
		{
            alreadyRunning = YES;
        }
    }
	
	// if no, start main app
    if (!alreadyRunning)
	{
		NSString *path = [[NSBundle mainBundle] bundlePath];
        NSArray *p = [path pathComponents];
        NSMutableArray *pathComponents = [NSMutableArray arrayWithArray:p];
        [pathComponents removeLastObject];
        [pathComponents removeLastObject];
        [pathComponents removeLastObject];
        [pathComponents addObject:@"MacOS"];
        [pathComponents addObject:DRLaunchHelperMainApplicationProductName];
        NSString *newPath = [NSString pathWithComponents:pathComponents];
        [[NSWorkspace sharedWorkspace] launchApplication:newPath];
    }
	
	// terminate launch helper app
    [NSApp terminate:nil];
}

@end
