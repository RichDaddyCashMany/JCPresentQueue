//
//  ViewController.m
//  JCPresentQueueDemo
//
//  Created by HJaycee on 2017/4/11.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import "ViewController.h"
#import "JCPresentController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self show];
    });
}

- (void)show {
    // JCPresentTypeLIFO: alert3 >> alert2 >> alert1
    // JCPresentTypeFIFO: alert1 >> alert2 >> alert3
    
    for (int i = 0; i<3; i++) {
        UIAlertController *alert = ({
            NSString *title = [NSString stringWithFormat:@"alert%i", i + 1];
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:alertAction];
            alert;
        });
        [JCPresentController presentViewControllerLIFO:alert presentCompletion:nil dismissCompletion:nil];
    }
}

@end
