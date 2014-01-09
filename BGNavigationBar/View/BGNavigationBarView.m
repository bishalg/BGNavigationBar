//
//  BGNavigationBar.m
//
//
//  Created by Bishal Ghimire on 8/21/13.
//  Copyright (c) 2013 . All rights reserved.
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

@interface BGNavigationBarView ()

@property (nonatomic)           CGFloat     height;
@property (nonatomic)           BOOL        isRightToggle;

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

- (void)buttonLeftAction:(UIButton *)sender{
    if (DELEGATE_OK(bgNavigationBarButtonLocation:ofButtonType:)) {
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
        if (DELEGATE_OK(bgNavigationBarButtonLocation:ofButtonType:)) {
            [delegate bgNavigationBarButtonLocation:UIButtonNavBarLocationRight ofButtonType:sender.tag];
        }
    }
}

- (void)buttonExtraAction:(UIButton *)sender{
    if (isAlterExtraButton) {
        
    }
}

- (UILabel *)titleLabel {
    // CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    UILabel *labelTitle = [[UILabel alloc] init];
    labelTitle.frame = CGRectMake(width / 2 - 100 / 2, height - 35, 100, 25);
    labelTitle.font = [UIFont systemFontOfSize:18];
    labelTitle.textColor  = [UIColor whiteColor];
    labelTitle.backgroundColor = [UIColor clearColor];
    labelTitle.font=[UIFont fontWithName:@"Helvetica-Bold" size:16.0];
    labelTitle.text = self.title;
    labelTitle.textAlignment = ALIGN_CENTER;
    [labelTitle sizeToFit];
    CGFloat textWidth = labelTitle.frame.size.width;
    labelTitle.frame = CGRectMake(width / 2 - textWidth / 2, height - 35, 160, 25);
    labelTitle.textColor = [UIColor yellowColor];
    // [UIColor colorWithRed:(115.0/255.0) green:(52.0/255.0) blue:(0.0/255.0) alpha:1.0];
    labelTitle.shadowColor = [UIColor colorWithRed:230.0/255.0 green:156.0/255.0 blue:0.0/255.0 alpha:1.0];
    labelTitle.shadowOffset = CGSizeMake(0.0, 1.0);

    [labelTitle sizeToFit];
    return labelTitle;
}

- (void)baseInit {
    height = self.bounds.size.height;
    isDynamic = YES;
    UIView *barBGView = [[UIView alloc] initWithFrame:self.bounds];
    // barBGView.backgroundColor = [UIColor yellowColor];
    
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
    UILabel *labelTitle = [self titleLabel];
    [barBGView addSubview:labelTitle];
    
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
    if (buttonLeftType != -1) {
        [barBGView addSubview:leftButton];
    }
    
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
    
    if (buttonRightType != -1) {
        [barBGView addSubview:rightButton];
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
        case UIButtonNavBarRightTypeEditBtn:
            [rightButton setImage:[UIImage imageNamed:@"ic_edit.png"] forState:UIControlStateNormal];
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
        case UIButtonNavBarRightTypeLocation:
            [rightButton setImage:[UIImage imageNamed:@"ic_action_mapview"] forState:UIControlStateNormal];
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
    if (buttonRightType != -1) {
        [barBGView addSubview:rightButton];
    }
    
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
    
    if (buttonExtraType != -1) {
        extraButton.frame = CGRectMake(230, height - 44, 40, 40);
        extraButton.backgroundColor  = [UIColor clearColor];
        [barBGView addSubview:extraButton];
    }
    
    CGRect newFrame     = labelTitle.frame;
    newFrame.origin.x   = leftButton.frame.origin.x + leftButton.frame.size.width;
    newFrame.size.width = self.frame.size.width - 2 * (leftButton.frame.origin.x + leftButton.frame.size.width);
    
    if (buttonRightType != -1) {
        newFrame.size.width = self.frame.size.width - 2 * (leftButton.frame.size.width + leftButton.frame.origin.x);
    }
    if (buttonExtraType != -1) {
        newFrame.size.width = extraButton.frame.origin.x - leftButton.frame.origin.x - leftButton.frame.size.width;
    }

    labelTitle.frame = newFrame;
    [self addSubview:barBGView];
}

- (UIButton *)textButtonWithTitle:(NSString *)title {
    UIButton *textButton = [[UIButton alloc] init];
    textButton.frame = CGRectMake(240, height - 40, 60, 40);
    [textButton setTitle:title forState:UIControlStateNormal];
    textButton.titleLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:16.0];
    textButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [textButton addTarget:self
                   action:@selector(buttonRightAction:)
         forControlEvents:UIControlEventTouchUpInside];
    return textButton;
}

- (void)drawRect:(CGRect)rect {
    [self setClipsToBounds:YES];

    [self baseInit];
}

@end
