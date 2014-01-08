//
//  BGNavigationBar.h
//
//
//  Created by Bishal Ghimire on 8/21/13.
//  Copyright (c) 2013 . All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGNavigationBarView;

@protocol BGNavigationBarViewDelegate <NSObject>

@required
- (void)bgNavigationBarButtonLocation:(NSUInteger)buttonLocation ofButtonType:(NSUInteger)buttonType;

//@optional
//- (void)bgNavigationBarLeftButton:(NSUInteger)buttonLeftType;
//- (void)bgNavigationBarRightButton:(NSUInteger)buttonRightType;
//- (void)bgNavigationBarExtraButton:(NSUInteger)buttonExtraType;


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
    UIButtonNavBarRightTypeEditBtn,
    UIButtonNavBarRightTypeSearch,                                  // Search Ads
    UIButtonNavBarRightTypeAdd2Cart,                                // Invoice Add 2 Carts
    UIButtonNavBarRightTypeShare,                                   // Ads Share to facebook twitter
    UIButtonNavBarRightCustomText,                                  // Custom Text
    UIButtonNavBarRightCustomImage,
    UIButtonNavBarRightTypeLocation
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

@property (nonatomic) int buttonLeftType;
@property (nonatomic) int buttonRightType;
@property (nonatomic) int buttonExtraType;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong)   UIButton    *rightButton;

/**
 Custom Text For Buttons
 */
@property (nonatomic, strong) NSString *buttonLeftCustomText;
@property (nonatomic, strong) NSString *buttonRightCustomText;
@property (nonatomic, strong) NSString *buttonExtraCustomText;

/*
 Custom Images For Buttons
 */
@property (nonatomic, strong) NSString *leftCustomImage;
@property (nonatomic, strong) NSString *rightCustomImage;
@property (nonatomic, strong) NSString *extraCustomImage;


// Flag for button of alternating type which changes in click event
@property (nonatomic, assign) BOOL isAlterRightButton;
@property (nonatomic, assign) BOOL isAlterLeftButton;
@property (nonatomic, assign) BOOL isAlterExtraButton;
@property (nonatomic, assign) BOOL isDynamic;


@property (assign) id <BGNavigationBarViewDelegate> delegate;


@end
