//
//  JCPresentController.m
//  JCPresentController
//
//  Created by HJaycee on 2018/5/3.
//  Copyright © 2018年 HJaycee. All rights reserved.
//

#import "JCPresentController.h"
#import "UIViewController+JCPresentQueue.h"

@interface UIApplication (JCPresentWindow)

- (UIWindow*)mainApplicationWindowIgnoringWindow:(UIWindow*)ignoringWindow;

@end

@implementation UIApplication (JCPresentWindow)

- (UIWindow*)mainApplicationWindowIgnoringWindow:(UIWindow *)ignoringWindow {
    for (UIWindow *window in [[UIApplication sharedApplication] windows]) {
        if (!window.hidden && window != ignoringWindow) {
            return window;
        }
    }
    return nil;
}

@end

@interface JCPresentWindow : UIWindow
@end

@implementation JCPresentWindow
@end

@interface JCPresentRootController : UIViewController

@end

@implementation JCPresentRootController

- (UIViewController*)mainController {
    UIWindow *mainAppWindow = [[UIApplication sharedApplication] mainApplicationWindowIgnoringWindow:self.view.window];
    UIViewController *topController = mainAppWindow.rootViewController;
    
    while(topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    return topController;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return [[self mainController] shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

- (BOOL)shouldAutorotate {
    return [[self mainController] shouldAutorotate];
}

@end

@interface JCPresentQueueManager : NSObject

@property (nonatomic) UIWindow *overlayWindow;
+ (instancetype)shareManager;

@end

@implementation JCPresentQueueManager

+ (instancetype)shareManager {
    static JCPresentQueueManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [JCPresentQueueManager new];
    });
    return manager;
}

- (UIWindow *)overlayWindow {
    if (!_overlayWindow) {
        JCPresentRootController *rootViewController = [JCPresentRootController new];
        rootViewController.view.backgroundColor = [UIColor clearColor];
        _overlayWindow = [[JCPresentWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _overlayWindow.backgroundColor = [UIColor clearColor];
        _overlayWindow.windowLevel = UIWindowLevelNormal;
        _overlayWindow.rootViewController = rootViewController;
        _overlayWindow.hidden = NO;
    }
    return _overlayWindow;
}

@end

@implementation JCPresentController

+ (void)presentViewControllerLIFO:(UIViewController *)viewController presentCompletion:(void (^)(void))presentCompletion dismissCompletion:(void (^)(void))dismissCompletion {
[self presentViewController:viewController presentType:JCPresentTypeLIFO presentCompletion:presentCompletion dismissCompletion:dismissCompletion];
}

+ (void)presentViewControllerFIFO:(UIViewController *)viewController presentCompletion:(void (^)(void))presentCompletion dismissCompletion:(void (^)(void))dismissCompletion {
    [self presentViewController:viewController presentType:JCPresentTypeFIFO presentCompletion:presentCompletion dismissCompletion:dismissCompletion];
}

+ (void)presentViewController:(UIViewController *)viewController presentType:(JCPresentType)presentType presentCompletion:(void (^)(void))presentCompletion dismissCompletion:(void (^)(void))dismissCompletion {
    JCPresentQueueManager *manager = [JCPresentQueueManager shareManager];
    [manager.overlayWindow.rootViewController jc_presentViewController:viewController presentType:presentType presentCompletion:^{
        if (presentCompletion) {
            presentCompletion();
        }
    } dismissCompletion:^{
        if (manager.overlayWindow.rootViewController.presentViewControllers.count <= 1) {
            manager.overlayWindow.hidden = YES;
            manager.overlayWindow = nil;
        }
        if (dismissCompletion) {
            dismissCompletion();
        }
    }];
}

@end
