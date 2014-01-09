//
//  BGMainViewController.m
//  BGNavigationBar
//
//  Created by Bishal Ghimire on 1/8/14.
//  Copyright (c) 2014 Big B Soft. All rights reserved.
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
        // DLog(@"-ve"); // Scrolling up
        isNavBarToShow = YES;
       // bgNavigationBarView.hidden = NO;
    } else {
        // DLog(@"+ve"); // Scrolling down
        isNavBarToShow = NO;
        // bgNavigationBarView.hidden = YES;
    }
    self.previousY = offSet;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    CGRect frameNavBar = self.bgNavigationBarView.frame;
    if (isNavBarToShow) {
        frameNavBar.size.height = navBarHt;
    }
    else {
        frameNavBar.size.height = 22;
    }
    [UIView animateWithDuration:0.35
                          delay:0.05
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^ {
                         bgNavigationBarView.frame  = frameNavBar;
                     }
                     completion:NULL
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

#pragma mark - Table View

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    // [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    UILabel *labelOne = [[UILabel alloc]initWithFrame:CGRectMake(30, 15, 140, 20)];
    [labelOne setBackgroundColor:[UIColor clearColor]];
    [labelOne setTextColor:[UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:1.000]];
    labelOne.textAlignment = ALIGN_LEFT;
    labelOne.text = [NSString stringWithFormat:@"Row No %d", indexPath.row ];
    [cell.contentView addSubview:labelOne];
    return cell;
}

- (void)addTableView {
    // Make TableView
    aTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    aTableView.dataSource = self;
    aTableView.delegate = self;
    aTableView.bounces = NO;
    aTableView.contentInset = UIEdgeInsetsMake(navBarHt, 0, 0, 0);
    [aTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    // aTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.bounds.size.width, 0.01f)];
    //[aTableView setBackgroundColor:[UIColor grayColor]];
    
    [aTableView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:aTableView];
}

- (void)addNavBar {
    bgNavigationBarView = [[BGNavigationBarView alloc] init];
    
    bgNavigationBarView.frame = CGRectMake(0, 0, 320, navBarHt);
    bgNavigationBarView.delegate  = self;
    bgNavigationBarView.buttonLeftType = UIButtonNavBarLeftTypeBack;
    bgNavigationBarView.buttonRightType = -1;
    //bgNavigationBarView.isAlterRightButton=YES;
    bgNavigationBarView.buttonExtraType = -1; // Hide Extra Button
    bgNavigationBarView.backgroundColor = [UIColor colorWithRed:0.502 green:0.000 blue:1.000 alpha:1.000];
    bgNavigationBarView.title = @"BG Navigation Bar";
    bgNavigationBarView.alpha = 0.95;
    [self.view  addSubview:bgNavigationBarView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self isiOSVerGreaterThen7]) {
        navBarHt = 66;
    }
    else {
        navBarHt = 44;
    }

    [self addTableView];
    [self addNavBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
