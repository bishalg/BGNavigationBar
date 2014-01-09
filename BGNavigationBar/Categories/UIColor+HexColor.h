//
//  UIColor+HexColor.h
//  BGNavigationBar
//
//  Created by Bishal Ghimire on 1/8/14.
//  Copyright (c) 2014 Big B Soft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexValue: (NSInteger)hexValue;
+ (UIColor *)colorWithHex:(uint)hex;

@end
