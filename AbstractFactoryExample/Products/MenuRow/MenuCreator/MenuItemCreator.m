//
//  MenuItemCreator.m
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import "MenuItemCreator.h"
#import "MenuItem.h"

@implementation MenuItemCreator

- (MenuItem*)createMenuItem
{
    return [[MenuItem alloc] init];
}
@end
