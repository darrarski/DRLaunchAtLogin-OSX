//
//  DRLaunchAtLogin.m
//  DRLaunchAtLogin
//
//  Created by Dariusz Rybicki on 25.11.2013.
//  Copyright (c) 2013 Darrarski. All rights reserved.
//
//  Based on https://github.com/alexzielenski/StartAtLoginController
//

#import "DRLaunchAtLogin.h"
#import <ServiceManagement/ServiceManagement.h>

@implementation DRLaunchAtLogin

- (id)initWithBundle:(NSBundle *)bundle
{
	if (self = [super init])
	{
		[self setBundle:bundle];
	}
	return self;
}

- (id)initWithIdentifier:(NSString *)identifier
{
	if (self = [super init])
	{
		[self setIdentifier:identifier];
	}
	return self;
}

- (void)setBundle:(NSBundle *)bundle
{
	self.identifier = [bundle bundleIdentifier];
}

- (BOOL)enabled
{
	if (!_identifier)
	{
        return NO;
	}
    
    BOOL isEnabled  = NO;
    
    CFArrayRef cfJobDicts = SMCopyAllJobDictionaries(kSMDomainUserLaunchd);
    NSArray* jobDicts = CFBridgingRelease(cfJobDicts);
    
    if (jobDicts && [jobDicts count] > 0)
	{
        for (NSDictionary *job in jobDicts)
		{
            if ([_identifier isEqualToString:[job objectForKey:@"Label"]])
			{
                isEnabled = [[job objectForKey:@"OnDemand"] boolValue];
                break;
            }
        }
    }
	
    return isEnabled;
}

- (void)setEnabled:(BOOL)enabled
{
	if (!_identifier)
	{
        return;
	}
    
    if (!SMLoginItemSetEnabled((__bridge CFStringRef)_identifier, enabled?true:false))
	{
		NSLog(@"Error when calling SMLoginItemSetEnabled");
    }
}

@end
