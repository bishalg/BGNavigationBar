//
//  BGMainViewController.m
//  BGNavigationBar
//
//  Created by Bishal Ghimire on 1/8/14.
//  Copyright (c) 2014 Big B Soft. All rights reserved.
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


#import "BGMainViewController.h"
#import "BGNavigationBarView.h"

@interface BGMainViewController ()
<UITableViewDataSource, UITableViewDelegate, BGNavigationBarViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) BGNavigationBarView *bgNavigationBarView;
@property (nonatomic, strong) UITableView *aTableView;
@property (nonatomic) CGFloat navBarHt;
@property (nonatomic) CGFloat previousY;
@property (nonatomic) BOOL isNavBarToShow;

@end

@implementation BGMainViewController

@synthesize bgNavigationBarView;
@synthesize aTableView;
@synthesize navBarHt;
@synthesize isNavBarToShow;

- (void)bgNavigationBarButtonLocation:(NSUInteger)buttonLocation ofButtonType:(NSUInteger)buttonType {

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offSet = scrollView.contentOffset.y;
    if (offSet-self.previousY < 0) {
        // Scrolling up
        isNavBarToShow = YES;
    } else {
        // Scrolling down
        isNavBarToShow = NO;
    }
    self.previousY = offSet;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    [self.bgNavigationBarView showHideNavBar:isNavBarToShow];
}

#pragma mark - Table View

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 99;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    // [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    UILabel *labelOne       = [[UILabel alloc]initWithFrame:CGRectMake(30, 15, 140, 20)];
    labelOne.textAlignment  = ALIGN_LEFT;
    labelOne.text           = [NSString stringWithFormat:@"Row No %d", (int)indexPath.row ];
    [labelOne setBackgroundColor:[UIColor clearColor]];
    [labelOne setTextColor:[UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:1.000]];
    [cell.contentView addSubview:labelOne];
    return cell;
}

- (void)addTableView {
    // Make TableView
    aTableView              = [[UITableView alloc] initWithFrame:self.view.bounds];
    aTableView.dataSource   = self;
    aTableView.delegate     = self;
    aTableView.bounces      = NO;
    aTableView.contentInset = UIEdgeInsetsMake(navBarHt, 0, 0, 0);
    [aTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [aTableView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:aTableView];
}

- (void)addNavBar {
    bgNavigationBarView                 = [[BGNavigationBarView alloc] init];
    if ([bgNavigationBarView isiOSVerGreaterThen7]) {
        navBarHt = 66;
    }else {
        navBarHt = 44;
    }
    bgNavigationBarView.frame           = CGRectMake(0, 0, 320, navBarHt);
    bgNavigationBarView.delegate        = self;
    bgNavigationBarView.buttonLeftType  = UIButtonNavBarLeftTypeBack;
    bgNavigationBarView.buttonRightType = -1; //// Hide Right Button
    //bgNavigationBarView.isAlterRightButton=YES;
    bgNavigationBarView.buttonExtraType = -1; // Hide Extra Button
    bgNavigationBarView.backgroundColor = [UIColor colorWithRed:0.400 green:0.800 blue:1.000 alpha:1.000];
    bgNavigationBarView.title           = @"BG Navigation Bar";
    bgNavigationBarView.alpha           = 0.95;
    bgNavigationBarView.layer.zPosition = 100;
    bgNavigationBarView.tintColor       = [UIColor colorWithRed:0.400 green:0.800 blue:1.000 alpha:1.000];
    [self.view  addSubview:bgNavigationBarView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavBar];
    [self addTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
