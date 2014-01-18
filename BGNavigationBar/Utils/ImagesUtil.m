//
//  ImagesUtil.m
//  MyClap
//
//  Created by Bishal Ghimire on 8/15/13.
//  Copyright (c) 2013 MyCalpTV. All rights reserved.
//

#import "ImagesUtil.h"


@implementation ImagesUtil

//+ (UIImage *)applyBlurOnImage:(UIImage *)imageToBlur withRadius: (NSInteger)blurRadius {
//    GPUImageiOSBlurFilter *iosBlurFilter = [[GPUImageiOSBlurFilter alloc] init];
//    iosBlurFilter.blurRadiusInPixels = blurRadius;
//    return [iosBlurFilter imageByFilteringImage:imageToBlur];
//}
//
//+ (NSString *)imageVisit {
//   return  @"http://khabarsanchar.com/Templates/Nepal-Khabar/images/view_icon.png";
//}
//
//+ (NSString *)imageTimeIcon {
//    return @"http://khabarsanchar.com/Templates/Nepal-Khabar/images/time_icon.png";
//}

//+ (NSString *)imageNameForNewsPortalName:(NSString *)newsPortalName {
//    NSString *imageName;
//    if ([newsPortalName isEqualToString:@"Republica"]) {
//        imageName = @"/NK_Image/republica_eng.png";
//    }
//    else  if ([newsPortalName isEqualToString:@"eKantipur"]) {
//        imageName = @"/NK_Image/theKathmanduPost_eng.png";
//    }
//    else  if ([newsPortalName isEqualToString:@"nepalTimes"]) {
//        imageName = @"/NK_Image/nepaliTimes_eng.png";
//    }
//    else  if ([newsPortalName isEqualToString:@"हिमाल खबर"]) {
//        imageName = @"/NK_Image/himalKhabar_nep.png";
//    }
//    else  if ([newsPortalName isEqualToString:@"अन्लाईन खबर"]) {
//        imageName = @"/NK_Image/onlineKhabar_nep.png";
//    }
//    else  if ([newsPortalName isEqualToString:@"कान्तिपुर"]) {
//        imageName = @"/NK_Image/kantipur_nep.png";
//    }
//    else  if ([newsPortalName isEqualToString:@"इमेज च्यानल"]) {
//        imageName = @"/NK_Image/imageChannel_nep.png";
//    }
//    else  if ([newsPortalName isEqualToString:@"हाम्रा कुरा"]) {
//        imageName = @"/NK_Image/hamrakura_eng.png";
//    }
//    //    else  if ([newsPortalName isEqualToString:@""]) {
//    //        imageName = @"";
//    //    }
//
//    imageName = [NSString stringWithFormat:@"%@%@", kMainURL, imageName];
//
//    return imageName;
//}

+ (BOOL)isiOS7 {
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        return NO; // DLog(@"< iOS6");
    } else { // DLog(@"iOS 7");
        return YES;
    }
}


+ (UIImage *) buttonImageBlueBackground
{
    UIImage *originalImage = [UIImage imageNamed:@"btn-bg"];
    UIEdgeInsets insets = UIEdgeInsetsMake(5, 5, 5, 5);
    UIImage *imageButtonStretchable = [originalImage resizableImageWithCapInsets:insets];
    return imageButtonStretchable;
}

+ (CGRect) locateHorizontal:(int)xLocation
                 andVertical:(int)yLocation
                    forFrame:(CGRect)frame
                      inView:(UIView *)view
                 withPadding:(CGFloat)padding; {
    
     CGFloat ptX = frame.origin.x;
     CGFloat ptY = frame.origin.y;
    
    switch (xLocation) {
        case kHLeft:
            ptX = 0 + padding;
            break;
        case kHRight:
            ptX = view.frame.size.width - frame.size.width - padding;
            break;
        case kHCenter:
            ptX = view.frame.size.width / 2 - frame.size.width / 2;
            break;
        default:
            break;
    }
    
    switch (yLocation) {
        case kVTop:
            ptY = 0 + padding;
            break;
        case kVBottom:
            ptY = view.frame.size.height - frame.size.height - padding;
            break;
        case kVCenter:
            ptY = view.frame.size.height / 2 - frame.size.height / 2;
            break;
        default:
            break;
    }
    
    return CGRectMake(ptX, ptY,  frame.size.width, frame.size.height);
}

+ (CGPoint) cgPointAtHorizontal:(int)xLocation
                    andVertical:(int)yLocation
                       forFrame:(CGRect)frame
                relativeToFrame:(CGRect)view
                    withPadding:(CGFloat)padding; {
    
   // DLog(@"%@", NSStringFromCGRect(view));
    
    CGFloat ptX = frame.origin.x;
    CGFloat ptY = frame.origin.y;
    
    switch (xLocation) {
        case kHLeft:
            ptX = view.origin.x  + padding;
            break;
        case kHRight:
            ptX = view.origin.x - frame.origin.x - padding;
            break;
        case kHCenter:
            ptX = view.origin.x  + view.size.width / 2 - frame.size.width / 2;
            break;
        default:
            break;
    }
    
    switch (yLocation) {
        case kVTop:
            ptY = view.origin.y + padding;
            break;
        case kVBottom:
            ptY = view.origin.y + view.size.height - frame.size.height - padding;
            break;
        case kVCenter:
            ptY = view.origin.y  + view.size.height / 2  - frame.size.height / 2;
            break;
        default:
            break;
    }
    
    return CGPointMake(ptX, ptY);
    
}


@end
