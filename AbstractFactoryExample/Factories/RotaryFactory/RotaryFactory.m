//
//  RotaryFactory.m
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import "RotaryFactory.h"
#import "RotaryMenuButton.h"
#import "RotaryMenuItemCreator.h"
#import "SlideTransitionStrategy.h"
#import "RotaryMenuViewController.h"
#import "SlideMenuViewController.h"
@implementation RotaryFactory

- (RotaryMenuItemCreator*)createMenuItemCreator
{
    return [[RotaryMenuItemCreator alloc] init];
}

- (RotaryMenuButton*)createMenuButton
{
    return [[RotaryMenuButton alloc] init];
}

- (SlideTransitionStrategy*)createTransitionStrategy
{
    return [[SlideTransitionStrategy alloc] init];
}

- (MenuViewController*)createMenuViewController
{
    return [[RotaryMenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
}

@end
