//
//  MainViewController.h
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeFactory.h"
@interface MainViewController : UIViewController
@property (nonatomic, strong) ThemeFactory *themeFactory;
@end
