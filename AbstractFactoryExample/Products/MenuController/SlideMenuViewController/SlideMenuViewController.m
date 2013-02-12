//
//  SlideMenuViewController.m
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import "SlideMenuViewController.h"

@interface SlideMenuViewController ()

@end

@implementation SlideMenuViewController

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
            int runningHeight = 0;
            for (int index = 0; index < [self.dataSource numberOfMenuItems]; index++) {
                MenuItem *menuItem = [self.dataSource menuItemForIndex:index];
                menuItem.frame = CGRectMake(-CGRectGetWidth(menuItem.frame), runningHeight, CGRectGetWidth(menuItem.frame), CGRectGetHeight(menuItem.frame));
                runningHeight +=CGRectGetHeight(menuItem.frame);
                [self.view addSubview:menuItem];
                [self.rows addObject:menuItem];
                [UIView animateWithDuration:0.5 delay:index*0.1 options:UIViewAnimationCurveEaseIn animations:^{
                    menuItem.frame = CGRectMake(0, CGRectGetMinY(menuItem.frame), CGRectGetWidth(menuItem.frame), CGRectGetHeight(menuItem.frame));
                } completion:^(BOOL finished) {
                    
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
                    menuItem.frame = CGRectMake(-CGRectGetWidth(menuItem.frame), CGRectGetMinY(menuItem.frame), CGRectGetWidth(menuItem.frame), CGRectGetHeight(menuItem.frame));
                } completion:^(BOOL finished) {
                    [menuItem removeFromSuperview];
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
