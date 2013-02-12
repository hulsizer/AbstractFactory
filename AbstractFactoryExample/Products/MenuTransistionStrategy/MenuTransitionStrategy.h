//
//  MenuAnimator.h
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuTransitionStrategy : NSObject

- (void)animateFromView:(UIView*)firstView toView:(UIView*)secondView;

@end
