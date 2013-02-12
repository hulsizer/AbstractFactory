//
//  MenuViewController.m
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import "MenuViewController.h"
#import "ThemeFactory.h"
#import "MenuItem.h"
@interface MenuViewController ()
@property (nonatomic, strong) ThemeFactory *themeFactory;

@end

@implementation MenuViewController

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
    // Do any additional setup after loading the view from its nib.
    
    self.activeIndex = 0;
    self.rows = [[NSMutableArray alloc] init];
    self.state = MenuAnimationStateOut;
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
            int runningHeight = 0;
            int index = 0;
            for (MenuItem *menuItem in self.rows) {
                menuItem.frame = CGRectMake(0, runningHeight, CGRectGetWidth(menuItem.frame), CGRectGetHeight(menuItem.frame));
                runningHeight +=CGRectGetHeight(menuItem.frame);
                [self.view addSubview:menuItem];
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

- (void)switchMenuState:(BOOL)animated
{
    switch (self.state) {
        case MenuAnimationStateIn:
            //animate out
            NSLog(@"Animate Out");
            [self animateMenu:MenuAnimationStateOut];
            self.state = MenuAnimationStateOut;
            break;
        case MenuAnimationStateOut:
            //animate in
            NSLog(@"Animate In");
            [self animateMenu:MenuAnimationStateIn];
            self.state = MenuAnimationStateIn;
            break;
        default:
            break;
    }
}

- (void)reloadMenu
{
    
}

#pragma mark - IBActions

- (IBAction)menuButtonPressed:(id)sender
{
    [self switchMenuState:YES];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSArray *touchesArray = [touches allObjects];
    UITouch *touch = (UITouch *)[touchesArray objectAtIndex:0];
    CGPoint point = [touch locationInView:self.view];
    
    for (int index = 0; index< [self.rows count]; index++) {
        
        MenuItem *menuItem = [self.rows objectAtIndex:index];
        if (CGRectContainsPoint(menuItem.frame, point))
        {
            [self.delegate menuItemSelectedAtIndex:index];
            self.activeIndex = index;
            [self switchMenuState:YES];
            return;
        }
    }

    [self.nextResponder touchesBegan:touches withEvent:event];
}

@end
