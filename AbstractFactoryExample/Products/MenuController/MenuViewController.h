//
//  MenuViewController.h
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"
#import "MenuButton.h"
typedef enum
{
    MenuAnimationStateIn = 0,
    MenuAnimationStateOut = 1,
    MenuAnimationStateCount,
} MenuAnimationState;

@protocol MenuViewControllerDelegate;
@protocol MenuViewControllerDataSource;

@interface MenuViewController : UIViewController

@property (nonatomic, assign) IBOutlet MenuButton *menuButton;
@property (nonatomic, assign) MenuAnimationState state;
@property (nonatomic, assign) NSUInteger activeIndex;
@property (nonatomic, strong) NSMutableArray *rows;

- (void)animateMenu:(MenuAnimationState)animationState;
- (void)switchMenuState:(BOOL)animated;

- (void)reloadMenu;

@property (nonatomic, assign) id<MenuViewControllerDataSource> dataSource;
@property (nonatomic, assign) id<MenuViewControllerDelegate> delegate;
@end

@protocol MenuViewControllerDelegate <NSObject>

- (void)menuItemSelectedAtIndex:(NSUInteger)index;

@end

@protocol MenuViewControllerDataSource <NSObject>

- (NSUInteger)numberOfMenuItems;
- (MenuItem*)menuItemForIndex:(NSUInteger)index;

@end
