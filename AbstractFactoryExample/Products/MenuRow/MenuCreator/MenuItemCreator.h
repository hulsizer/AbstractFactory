//
//  MenuItemCreator.h
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MenuItem;
@interface MenuItemCreator : NSObject

- (MenuItem*)createMenuItem;
@end
