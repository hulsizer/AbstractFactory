//
//  RotaryMenuItemCreator.m
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import "RotaryMenuItemCreator.h"
#import "RotaryMenuItem.h"
@implementation RotaryMenuItemCreator

- (MenuItem*)createMenuItem
{
    return [[[NSBundle mainBundle] loadNibNamed:@"RotaryMenuItem" owner:self options:nil] objectAtIndex:0];
}
@end
