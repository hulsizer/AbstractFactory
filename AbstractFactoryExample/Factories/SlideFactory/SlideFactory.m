//
//  SlideFactory.m
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import "SlideFactory.h"
#import "SlideMenuButton.h"
#import "SlideMenuItemCreator.h"
#import "FadeTransitionStrategy.h"
#import "SlideMenuViewController.h"
@implementation SlideFactory

- (SlideMenuItemCreator*)createMenuItemCreator
{
    return [[SlideMenuItemCreator alloc] init];
}

- (SlideMenuButton*)createMenuButton
{
    return [[SlideMenuButton alloc] init];
}

- (FadeTransitionStrategy*)createTransitionStrategy
{
    return [[FadeTransitionStrategy alloc] init];
}

- (SlideMenuViewController*)createMenuViewController
{
    return [[SlideMenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
}
@end
