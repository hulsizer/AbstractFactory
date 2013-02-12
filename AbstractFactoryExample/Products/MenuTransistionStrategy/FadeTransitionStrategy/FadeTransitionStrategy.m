//
//  FadeTransitionStrategy.m
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import "FadeTransitionStrategy.h"

@implementation FadeTransitionStrategy

- (void)animateFromView:(UIView*)firstView toView:(UIView*)secondView
{
    [UIView animateWithDuration:0.5 animations:^{
        firstView.alpha = 0;
        secondView.alpha = 1;
    } completion:^(BOOL finished) {
    }];
    
}

@end
