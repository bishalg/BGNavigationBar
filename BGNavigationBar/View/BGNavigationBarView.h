//
//  BGNavigationBar.h
//
//
//  Created by Bishal Ghimire on 8/21/13.
//  Copyright (c) 2013 . All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//



#import <UIKit/UIKit.h>

@class BGNavigationBarView;

@protocol BGNavigationBarViewDelegate <NSObject>
@required
- (void)bgNavigationBarButtonLocation:(NSUInteger)buttonLocation ofButtonType:(NSUInteger)buttonType;
@optional
@end

@interface BGNavigationBarView : UIView

typedef NS_ENUM(NSInteger, UINavBarButtonLocation) {
    UIButtonNavBarLocationLeft = 0,
    UIButtonNavBarLocationRight,
    UIButtonNavBarLocationExtra
};

typedef NS_ENUM(NSInteger, UIButtonNavBarLeft) {
    UIButtonNavBarLeftTypeBack = 0,                                 // Arrow Back Button Type
    UIButtonNavBarLeftTypeSideMenu = 1,                             // Side View Menu Button Type
    UIButtonNavBarLeftTypeCancel,                                   // Cancel Button For Modal View Type
    UIButtonNavBarLeftCustomText,                                   // Custom Text
    UIButtonNavBarLeftCustomImage                                   // Custom Image
};

typedef NS_ENUM(NSInteger, UIButtonNavBarRight) {
    UIButtonNavBarRightTypeSideMenu = 0,                            // Side View Menu Button Type
    UIButtonNavBarRightTypeGPS,                                     // GPS Icon
    UIButtonNavBarRightTypeDone,                                    // Done Button For Modal View Type
    UIButtonNavBarRightTypeEdit,
    UIButtonNavBarRightTypeSearch,                                  // Search Ads
    UIButtonNavBarRightTypeAdd2Cart,                                // Invoice Add 2 Carts
    UIButtonNavBarRightTypeShare,                                   // Ads Share to facebook twitter
    UIButtonNavBarRightCustomText,                                  // Custom Text
    UIButtonNavBarRightCustomImage,
};

typedef NS_ENUM(NSInteger, UIButtonNavBarExtra) {
    UIButtonNavBarExtraTypeLocation = 0,                            // Side View Menu Button Type
    UIButtonNavBarExtraTypeSearch,                                  // Done Button For Modal VIew Type
    UIButtonNavBarExtraTypeAdd2Cart,                                //
    UIButtonNavBarExtraTypeShare,
    UIButtonNavBarExtraTypeFlag,
    UIButtonNavBarExtraCustomText,                                  // Custom Text
    UIButtonNavBarExtraCustomImage                                  // Custom Image
};

- (void)showHideNavBar:(BOOL)isToShow;
- (BOOL)isiOSVerGreaterThen7;

@property (nonatomic) int buttonLeftType;
@property (nonatomic) int buttonRightType;
@property (nonatomic) int buttonExtraType;


@property (nonatomic, strong)   UIColor     *blurTintColor;

@property (nonatomic, strong)   NSString    *title;
@property (nonatomic, strong)   UIButton    *rightButton;

/**
 Custom Text For Buttons
 */
@property (nonatomic, strong)   NSString    *buttonLeftCustomText;
@property (nonatomic, strong)   NSString    *buttonRightCustomText;
@property (nonatomic, strong)   NSString    *buttonExtraCustomText;

/**
 Custom Images For Buttons
 */
@property (nonatomic, strong)   NSString    *leftCustomImage;
@property (nonatomic, strong)   NSString    *rightCustomImage;
@property (nonatomic, strong)   NSString    *extraCustomImage;


// Flag for button of alternating type which changes in click event
@property (nonatomic, assign)   BOOL        isAlterRightButton;
@property (nonatomic, assign)   BOOL        isAlterLeftButton;
@property (nonatomic, assign)   BOOL        isAlterExtraButton;
@property (nonatomic, assign)   BOOL        isDynamic;


/* Delegate */
@property (assign) id <BGNavigationBarViewDelegate> delegate;

@end
