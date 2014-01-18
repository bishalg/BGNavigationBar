//
//  ImagesUtil.h
//  MyClap
//
//  Created by Bishal Ghimire on 8/15/13.
//  Copyright (c) 2013 MyCalpTV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImagesUtil : NSObject

enum {
    kHLeft = 1,
    kHCenter,
    kHRight
};

enum {
    kVTop = 1,
    kVCenter,
    kVBottom
};


//+ (UIImage *)applyBlurOnImage:(UIImage *)imageToBlur withRadius: (NSInteger)blurRadius;
//
//+ (NSString *)imageVisit;
//+ (NSString *)imageTimeIcon;
//+ (NSString *)imageNameForNewsPortalName:(NSString *)newsPortalName;


+ (BOOL)isiOS7;
+ (UIImage *) buttonImageBlueBackground;

+ (CGRect) locateHorizontal:(int)xLocation
                 andVertical:(int)yLocation
                    forFrame:(CGRect)frame
                      inView:(UIView *)view
                 withPadding:(CGFloat)padding;

+ (CGPoint) cgPointAtHorizontal:(int)xLocation
                    andVertical:(int)yLocation
                       forFrame:(CGRect)frame
                relativeToFrame:(CGRect)view
                    withPadding:(CGFloat)padding;

@end
