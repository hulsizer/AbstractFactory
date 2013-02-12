//
//  ThemeFactory.h
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MenuButton.h"
#import "MenuItemCreator.h"
#import "MenuViewController.h"
#import "MenuTransitionStrategy.h"
@interface ThemeFactory : NSObject

- (MenuItemCreator*)createMenuItemCreator;
- (MenuButton*)createMenuButton;
- (MenuTransitionStrategy*)createTransitionStrategy;
- (MenuViewController*)createMenuViewController;
@end
