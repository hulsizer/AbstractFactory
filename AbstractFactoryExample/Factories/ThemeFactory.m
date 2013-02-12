//
//  ThemeFactory.m
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import "ThemeFactory.h"

@implementation ThemeFactory

- (MenuItemCreator*)createMenuItemCreator
{
    return [[MenuItemCreator alloc] init];
}

- (MenuButton*)createMenuButton
{
    return [[MenuButton alloc] init];
}

- (MenuTransitionStrategy*)createTransitionStrategy
{
    return [[MenuTransitionStrategy alloc] init];
}

- (MenuViewController*)createMenuViewController
{
    return [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
}
@end
