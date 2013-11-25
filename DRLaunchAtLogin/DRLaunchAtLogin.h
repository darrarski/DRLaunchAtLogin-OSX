//
//  DRLaunchAtLogin.h
//  DRLaunchAtLogin
//
//  Created by Dariusz Rybicki on 25.11.2013.
//  Copyright (c) 2013 Darrarski. All rights reserved.
//
//  Based on https://github.com/alexzielenski/StartAtLoginController
//

#import <Foundation/Foundation.h>

@interface DRLaunchAtLogin : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, readwrite) BOOL enabled;

- (id)initWithBundle:(NSBundle *)bundle;
- (id)initWithIdentifier:(NSString *)identifier;
- (void)setBundle:(NSBundle *)bundle;
- (void)setIdentifier:(NSString *)identifier;

@end
