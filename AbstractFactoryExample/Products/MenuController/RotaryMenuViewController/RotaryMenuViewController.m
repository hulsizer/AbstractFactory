//
//  RotaryMenuViewController.m
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import "RotaryMenuViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface RotaryMenuViewController ()
@property (nonatomic, strong) CABasicAnimation* rotationAnimation;
@end

@implementation RotaryMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    self.rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * 2 * 1 ];
    self.rotationAnimation.duration = 1;
    self.rotationAnimation.cumulative = YES;
    self.rotationAnimation.repeatCount = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animateMenu:(MenuAnimationState)animationState
{
    if (self.state == animationState) {
        return;
    }
    switch (animationState) {
        case MenuAnimationStateIn:
        {
            //animate in
            int totalItems = [self.dataSource numberOfMenuItems];
			if (totalItems == 1) {
				totalItems = 2;
			}
            float anglePerElement = M_PI_2/(totalItems-1);
            
            for (int index = 0; index < [self.dataSource numberOfMenuItems]; index++) {
                MenuItem *menuItem = [self.dataSource menuItemForIndex:index];
                menuItem.center = self.menuButton.center;
                [self.view addSubview:menuItem];
                [self.rows addObject:menuItem];
                [UIView animateWithDuration:0.5 delay:index*0.1 options:UIViewAnimationCurveEaseIn animations:^{
                    menuItem.center = CGPointMake(self.menuButton.center.x + cosf(anglePerElement*index)*100, self.menuButton.center.y - sinf(anglePerElement*index)*100);
                    //[menuItem.layer addAnimation:self.rotationAnimation forKey:@"rotationAnimation"];
                } completion:^(BOOL finished) {
                    [menuItem.layer removeAllAnimations];
                }];
            }
        }
            break;
        case MenuAnimationStateOut:
        {
            //animate out
            int index = 0;
            for (MenuItem *menuItem in self.rows) {
                [UIView animateWithDuration:0.35 delay:abs(self.activeIndex-index)*0.1 options:UIViewAnimationCurveEaseIn animations:^{
                    menuItem.center = self.menuButton.center;
                    //[menuItem.layer addAnimation:self.rotationAnimation forKey:@"rotationAnimation"];
                } completion:^(BOOL finished) {
                    [menuItem removeFromSuperview];
                    [menuItem.layer removeAllAnimations];
                }];
                index++;
            }
            [self.rows removeAllObjects];
        }
            break;
        default:
            break;
    }
}
@end
