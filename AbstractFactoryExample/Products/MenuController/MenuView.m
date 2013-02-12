//
//  MenuView.m
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/10/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    // UIView will be "transparent" for touch events if we return NO
    return NO;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
	for (UIView *view in self.subviews) {
		CGPoint pointInB = [view convertPoint:point fromView:self];
		
		if ([view pointInside:pointInB withEvent:event])
			return view;
	}
	
    return [super hitTest:point withEvent:event];
}

@end
