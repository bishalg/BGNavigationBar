//
//  BGConstants.h
//  BGNavigationBar
//
//  Created by Bishal Ghimire on 1/8/14.
//  Copyright (c) 2014 Big B Soft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGConstants : NSObject

// DLog is almost a drop-in replacement for NSLog
// DLog(@"value: %d", x);
#ifdef DEBUG
#	define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#	define DLog(...)
#endif

// ALog always displays output regardless of the DEBUG setting
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

// Specifying Simulator Only Code
// NSLog(@"Running on Simulator");
#if TARGET_IPHONE_SIMULATOR
#	define SLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define SLog(...)
#endif



#define SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#define SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)


#define NAVIFY(controller) [[UINavigationController alloc] initWithRootViewController:controller]
#define URLIFY(urlString) [NSURL URLWithString:urlString]
#define F(string, args...) [NSString stringWithFormat:string, args]
#define ALERT(title, msg) [[[UIAlertView alloc]         initWithTitle:title\
message:msg\
delegate:nil\
cancelButtonTitle:@"OK"\
otherButtonTitles:nil] show]

#define GOBACK [self.navigationController  popViewControllerAnimated:YES]

#define DELEGATE_OK(delegateMethod)       [self.delegate respondsToSelector:@selector(delegateMethod)]
#define SELF_DELEGATE_OK(delegateMethod)  [mySelf.delegate respondsToSelector:@selector(delegateMethod)]


#ifdef __IPHONE_6_0
# define ALIGN_CENTER NSTextAlignmentCenter
#else
# define ALIGN_CENTER UITextAlignmentCenter
#endif

#ifdef __IPHONE_6_0
# define ALIGN_RIGHT NSTextAlignmentRight
#else
# define ALIGN_RIGHT UITextAlignmentRight
#endif

#ifdef __IPHONE_6_0
# define ALIGN_LEFT NSTextAlignmentLeft
#else
# define ALIGN_LEFT UITextAlignmentLeft
#endif


@end
