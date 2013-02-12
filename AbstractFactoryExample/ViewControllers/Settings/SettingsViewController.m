//
//  SettingsViewController.m
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import "SettingsViewController.h"
#import "RotaryFactory.h"
#import "SlideFactory.h"
#import "MainViewController.h"
#import "AppDelegate.h"
@interface SettingsViewController ()

@end

@implementation SettingsViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)slideFactoryPressed:(id)sender
{
    MainViewController *mainViewController = (MainViewController*)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    mainViewController.themeFactory = [[SlideFactory alloc] init];
}

- (IBAction)rotaryFactoryPressed:(id)sender
{
    MainViewController *mainViewController = (MainViewController*)[[[[UIApplication sharedApplication] delegate] window] rootViewController];
    mainViewController.themeFactory = [[RotaryFactory alloc] init];
}
@end
