//
//  MainViewController.m
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import "MainViewController.h"
#import "MenuViewController.h"
#import "MenuItem.h"
#import "MenuTransitionStrategy.h"
#import "SettingsViewController.h"

@interface MainViewController () <MenuViewControllerDataSource, MenuViewControllerDelegate>

@property (nonatomic, strong) MenuViewController *menuViewController;
@property (nonatomic, strong) MenuTransitionStrategy *animator;
@property (nonatomic, strong) MenuItemCreator *menuItemCreator;
@property (nonatomic, strong) NSMutableArray *viewControllers;
@property (nonatomic, strong) UIViewController *activeViewController;
@property (nonatomic, strong) UIViewController *tempActiveViewController;

@end

@implementation MainViewController

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
    
    self.viewControllers = [[NSMutableArray alloc] init];
    
    for (int index = 0; index < 4; index++) {
        UIViewController *temp = [[UIViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
        temp.title = [NSString stringWithFormat:@"Hello %d",index];
        
        [self.viewControllers addObject:temp];
        temp.view.alpha = 0;
		temp.view.backgroundColor = [UIColor colorWithRed:((rand()%255)/255.0f) green:((rand()%255)/255.0f) blue:((rand()%255)/255.0f) alpha:1];
        [self.view addSubview:temp.view];
        [self addChildViewController:temp];
        [temp didMoveToParentViewController:self];
    }
	
	SettingsViewController *settings = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    settings.title = @"Settings";
    settings.view.alpha = 0;
    [self.viewControllers addObject:settings];
    [self addChildViewController:settings];
	[self.view addSubview:settings.view];
    [settings didMoveToParentViewController:self];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setThemeFactory:(ThemeFactory *)themeFactory
{
    _themeFactory = themeFactory;
	
	[self.menuViewController.view removeFromSuperview];
	
    self.animator = [self.themeFactory createTransitionStrategy];
    self.menuItemCreator = [self.themeFactory createMenuItemCreator];
    self.menuViewController = [self.themeFactory createMenuViewController];
    self.menuViewController.dataSource = self;
    self.menuViewController.delegate = self;
	
	[self.menuViewController.view setFrame:self.view.bounds];
	[self addChildViewController:self.menuViewController];
	[self.view addSubview:self.menuViewController.view];
	[self.menuViewController didMoveToParentViewController:self];
	
	[self.view bringSubviewToFront:self.menuViewController.view];
}

#pragma mark - MenuViewControllerDataSource

- (NSUInteger)numberOfMenuItems
{
    return [self.viewControllers count];
}

- (MenuItem*)menuItemForIndex:(NSUInteger)index
{
    MenuItem *menuItem = [self.menuItemCreator createMenuItem];
    UIViewController *temp = [self.viewControllers objectAtIndex:index];
    menuItem.titleLabel.text = temp.title;
	menuItem.backgroundColor = temp.view.backgroundColor;
    
    return menuItem;
}

#pragma mark - MenuViewCOntrollerDelegate
- (void)menuItemSelectedAtIndex:(NSUInteger)index
{
    self.tempActiveViewController = [self.viewControllers objectAtIndex:index];
	if (self.tempActiveViewController == self.activeViewController) {
		return;
	}
    NSLog(@"Index %d was selected", index);
    [self.animator animateFromView:self.activeViewController.view toView:self.tempActiveViewController.view];
    self.activeViewController = self.tempActiveViewController;
//    [self.view bringSubviewToFront:self.activeViewController.view];
//    [self.view bringSubviewToFront:self.menuViewController.view];
    [self.view insertSubview:self.activeViewController.view belowSubview:self.menuViewController.view];
}

@end
