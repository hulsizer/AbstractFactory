//
//  MenuRow.h
//  AbstractFactoryExample
//
//  Created by Andrew Hulsizer on 1/9/13.
//  Copyright (c) 2013 Andrew Hulsizer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuItem : UIView

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UIImageView  *backgroundImage;
@end
