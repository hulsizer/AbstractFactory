//
//  SlideMenuItemCreator.m
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import "SlideMenuItemCreator.h"

@implementation SlideMenuItemCreator

- (MenuItem*)createMenuItem
{
    return [[[NSBundle mainBundle] loadNibNamed:@"SlideMenuItem" owner:self options:nil] objectAtIndex:0];
}
@end
