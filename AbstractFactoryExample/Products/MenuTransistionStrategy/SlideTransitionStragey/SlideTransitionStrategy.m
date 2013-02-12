//
//  SlideTransitionStrategy.m
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import "SlideTransitionStrategy.h"

@implementation SlideTransitionStrategy

- (void)animateFromView:(UIView*)firstView toView:(UIView*)secondView
{
    secondView.transform = CGAffineTransformMakeTranslation(CGRectGetWidth(secondView.frame), 0);
    secondView.alpha = 1;
    
    [UIView animateWithDuration:0.5 animations:^{
        firstView.transform = CGAffineTransformMakeTranslation(-CGRectGetWidth(firstView.frame), 0);
        secondView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        firstView.alpha = 0;
        firstView.transform = CGAffineTransformIdentity;
    }];
    
}

@end
