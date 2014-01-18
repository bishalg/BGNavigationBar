//
//  BGNavigationBar.m
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


/*
 // Change the appearance of back button
 UIImage *backButtonImage = [[UIImage imageNamed:@"button_back"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 6)];
 [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
 
 // Change the appearance of other navigation button
 UIImage *barButtonImage = [[UIImage imageNamed:@"button_normal"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 6, 0, 6)];
 [[UIBarButtonItem appearance] setBackgroundImage:barButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
 */

#import "BGNavigationBarView.h"
#import <QuartzCore/QuartzCore.h>


@interface BGNavigationBarView ()

@property (nonatomic)           CGFloat     height;
@property (nonatomic)           BOOL        isRightToggle;
@property (nonatomic, strong)   UIToolbar   *toolbar;
@property (nonatomic, strong)   UILabel     *labelTitle;

@end

@implementation BGNavigationBarView

@synthesize buttonLeftType;
@synthesize buttonExtraType;
@synthesize buttonRightType;
@synthesize delegate;
@synthesize isAlterExtraButton,isAlterLeftButton,isAlterRightButton;
@synthesize height;
@synthesize isRightToggle;
@synthesize rightButton;
@synthesize isDynamic;

- (void)showHideNavBar:(BOOL)isToShow {
    height = self.bounds.size.height;
//    self.frame = CGRectMake(10, 10, 50, 54);
    CGRect frameNavBar = self.frame;
    if (isToShow) {
        if ([self isiOSVerGreaterThen7]) {
            frameNavBar.size.height = 66;
        } else {
            frameNavBar.size.height = 44;
        }
    }
    else {
        if ([self isiOSVerGreaterThen7]) {
            frameNavBar.size.height = 22;
        } else {
            frameNavBar.size.height = 0.1;
        }
    }
    [UIView animateWithDuration:0.35
                          delay:0.05
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^ {
                         self.frame  = frameNavBar;
                     }
                     completion:nil
     ];
}

- (BOOL)isiOSVerGreaterThen7 {
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        return NO;
    } else {
        // DLog(@"iOS 7");
        return YES;
    }
}


- (void)buttonLeftAction:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(bgNavigationBarButtonLocation:ofButtonType:)]) {
        [delegate bgNavigationBarButtonLocation:UIButtonNavBarLocationLeft ofButtonType:sender.tag];
    }
}

- (void)buttonRightAction:(UIButton *)sender {
    if (isDynamic) {
        if (isAlterRightButton) {
            if (isRightToggle) {
                [rightButton setTitle:@"Edit" forState:UIControlStateNormal];
            }
            else {
                [rightButton setTitle:@"Done" forState:UIControlStateNormal];
            }
            isRightToggle = !isRightToggle;
        }
        if ([self.delegate respondsToSelector:@selector(bgNavigationBarButtonLocation:ofButtonType:) ]) {
            [delegate bgNavigationBarButtonLocation:UIButtonNavBarLocationRight ofButtonType:sender.tag];
        }
    }
}

- (void)buttonExtraAction:(UIButton *)sender{
    if (isAlterExtraButton) {
        
    }
}

- (UILabel *)titleLabel {
    CGFloat width               = self.bounds.size.width;
    UILabel *labelTitle         = [[UILabel alloc] init];
    labelTitle.frame            = CGRectMake(width / 2 - 100 / 2, height - 35, 100, 25);
    labelTitle.font             = [UIFont systemFontOfSize:18];
    labelTitle.textColor        = [UIColor whiteColor];
    labelTitle.backgroundColor  = [UIColor clearColor];
    labelTitle.font             = [UIFont fontWithName:@"Helvetica-Bold" size:16.0];
    labelTitle.textAlignment    = NSTextAlignmentCenter;
    labelTitle.text             = self.title;
    [labelTitle sizeToFit];
    
    CGFloat textWidth           = labelTitle.frame.size.width;
    labelTitle.frame            = CGRectMake(width / 2 - textWidth / 2, height - 35, 160, 25);
    labelTitle.textColor        = [UIColor colorWithWhite:0.298 alpha:1.000];
    labelTitle.shadowColor      = [UIColor colorWithWhite:0.902 alpha:1.000];
    labelTitle.shadowOffset     = CGSizeMake(0.0, 1.0);

    [labelTitle sizeToFit];
    return labelTitle;
}

- (void)setup {
    [self setClipsToBounds:YES];
//    if (![self toolbar]) {
//        [self setToolbar:[[UIToolbar alloc] initWithFrame:[self bounds]]];
//        [self.layer insertSublayer:[self.toolbar layer] atIndex:0];
//    }
    
    self.toolbar                = [[UIToolbar alloc] initWithFrame:self.bounds];
    UIView      *barBGView      = [[UIView alloc] initWithFrame:self.bounds];
    if ([self isiOSVerGreaterThen7]) {
        height = 66;
    } else {
        height = 44;
    }
    self.frame = CGRectMake(0, 0, 320, height);
    
    height = self.bounds.size.height;
    isDynamic = YES;
//    UIView *barBGView = [[UIView alloc] initWithFrame:self.bounds];
    
//    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
//        //DLog(@"< iOS6");
//        UIImage *barBGImage = [[UIImage imageNamed:@"action_bar_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 6, 0, 6)];
//        [barBGView setBackgroundColor:[UIColor colorWithPatternImage:barBGImage]];
//    }
//    else {
//        //DLog(@"iOS7");
//        UIImage *barBGImage = [[UIImage imageNamed:@"action_bar_bg7"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 6, 0, 6)];
//        [barBGView setBackgroundColor:[UIColor colorWithPatternImage:barBGImage]];
//    }
    
    /* UIEdgeInsetsMake ( TOP , LEFT, BOTTOM. RIGHT ) */
    
    /* Title */
    self.labelTitle = [self titleLabel];
    self.labelTitle.text = self.title;
    
    /*       Left Button        */
    UIButton *leftButton = [[UIButton alloc] init];
    switch (buttonLeftType) {
        case UIButtonNavBarLeftTypeBack:
            [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
            break;
        case UIButtonNavBarLeftTypeSideMenu:
            [leftButton setImage:[UIImage imageNamed:@"ic_sandwich"] forState:UIControlStateNormal];
            break;
        case UIButtonNavBarLeftTypeCancel:
            [leftButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    [leftButton addTarget:self
                   action:@selector(buttonLeftAction:)
         forControlEvents:UIControlEventTouchUpInside];
    leftButton.tag = buttonLeftType;
    leftButton.frame = CGRectMake(5, height - 35, 25, 25);
    // leftButton.backgroundColor = [UIColor redColor];
    
    /*       Right Button       */
    if (buttonRightType == UIButtonNavBarRightTypeEdit) {
        rightButton = [self textButtonWithTitle:@"Edit"];
    }
    else if (buttonRightType == UIButtonNavBarRightTypeDone) {
        rightButton = [self textButtonWithTitle:@"Done"];
    }
    else if (buttonRightType == UIButtonNavBarRightCustomText) {
        rightButton = [self textButtonWithTitle:_buttonRightCustomText];
    }
    else {
        rightButton = [[UIButton alloc] init];
        rightButton.frame = CGRectMake(275, height - 44, 40, 40);
        rightButton.backgroundColor = [UIColor clearColor];
    }
    
    switch (buttonRightType) {
        case UIButtonNavBarRightTypeGPS:
            [rightButton setImage:[UIImage imageNamed:@"ic_action_location"] forState:UIControlStateNormal];
            break;
        case UIButtonNavBarRightTypeSideMenu:
            [rightButton setImage:[UIImage imageNamed:@"ic_sandwich"] forState:UIControlStateNormal];
            break;
        case UIButtonNavBarRightTypeDone:
            //rightButton = [self textButtonWithTitle:@"Done"];
            break;
        case UIButtonNavBarRightTypeEdit:
            break;
        case UIButtonNavBarRightTypeSearch:
            [rightButton setImage:[UIImage imageNamed:@"ic_action_search"] forState:UIControlStateNormal];
            break;
        case UIButtonNavBarRightTypeAdd2Cart:
            [rightButton setImage:[UIImage imageNamed:@"ic_action_cart"] forState:UIControlStateNormal];
            break;
        case UIButtonNavBarRightTypeShare:
            [rightButton setImage:[UIImage imageNamed:@"ic_action_share"] forState:UIControlStateNormal];
            break;
        case UIButtonNavBarRightCustomText:
            break;
        default:
            break;
    }
    [rightButton addTarget:self
                    action:@selector(buttonRightAction:)
          forControlEvents:UIControlEventTouchUpInside];
    rightButton.tag = buttonRightType;
    
    
    /*       Extra Buttons       */
    UIButton *extraButton  = [[UIButton alloc] init];
    switch (buttonExtraType) {
        case UIButtonNavBarExtraTypeLocation:
            [extraButton setImage:[UIImage imageNamed:@"ic_action_mapview"] forState:UIControlStateNormal];
            break;
        case UIButtonNavBarExtraTypeSearch:
            [extraButton setImage:[UIImage imageNamed:@"ic_action_search"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    [extraButton addTarget:self
                    action:@selector(buttonExtraAction:)
          forControlEvents:UIControlEventTouchUpInside];
    extraButton.tag = buttonExtraType;
    
    
    CGRect newFrame     = self.labelTitle.frame;
    newFrame.origin.x   = leftButton.frame.origin.x + leftButton.frame.size.width;
    newFrame.size.width = self.frame.size.width - 2 * (leftButton.frame.origin.x + leftButton.frame.size.width);
    
    if (buttonRightType != -1) {
        newFrame.size.width = self.frame.size.width - 2 * (leftButton.frame.size.width + leftButton.frame.origin.x);
    }
    if (buttonExtraType != -1) {
        newFrame.size.width = extraButton.frame.origin.x - leftButton.frame.origin.x - leftButton.frame.size.width;
    }
    self.labelTitle.frame = newFrame;
    extraButton.frame = CGRectMake(230, height - 44, 40, 40);
    extraButton.backgroundColor  = [UIColor clearColor];
    
    if ([self isiOSVerGreaterThen7]) {
        [self setToolbar:[[UIToolbar alloc] initWithFrame:[self bounds]]];
        self.toolbar.translucent =  YES;
        [self.toolbar setBarTintColor:self.blurTintColor];
        [self.layer insertSublayer:[self.toolbar layer] atIndex:0];
        [self.toolbar addSubview:self.labelTitle];
        if (buttonLeftType  != -1)  [self.toolbar addSubview:leftButton];
        if (buttonRightType != -1) [self.toolbar addSubview:rightButton];
        if (buttonExtraType != -1) [self.toolbar addSubview:extraButton];
        
        [self addSubview:self.toolbar];
    } else {
        [barBGView addSubview:self.labelTitle];
        if (buttonLeftType  != -1) [barBGView addSubview:leftButton];
        if (buttonRightType != -1) [barBGView addSubview:rightButton];
        if (buttonExtraType != -1) [barBGView addSubview:extraButton];
        
        [self addSubview:barBGView];
    }
}

- (UIButton *)textButtonWithTitle:(NSString *)title {
    UIButton *textButton                    = [[UIButton alloc] init];
    textButton.frame                        = CGRectMake(240, height - 40, 60, 40);
    textButton.titleLabel.font              = [UIFont fontWithName:@"Helvetica-Bold" size:16.0];
    textButton.contentHorizontalAlignment   = UIControlContentHorizontalAlignmentRight;
    [textButton setTitle:title forState:UIControlStateNormal];
    [textButton addTarget:self
                   action:@selector(buttonRightAction:)
         forControlEvents:UIControlEventTouchUpInside];
    return textButton;
}

- (void) setBlurTintColor:(UIColor *)blurTintColor {
    [self.toolbar setBarTintColor:blurTintColor];
}

- (void)drawRect:(CGRect)rect {
    [self setup];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.toolbar setFrame:[self bounds]];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}


@end
