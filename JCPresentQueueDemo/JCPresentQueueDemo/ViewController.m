//
//  ViewController.m
//  JCPresentQueueDemo
//
//  Created by HJaycee on 2017/4/11.
//  Copyright © 2017年 HJaycee. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+JCPresentQueue.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    JCPresentType presentType = JCPresentTypeLIFO;
    
    // alert1
    UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"alert1" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    [alert1 addAction:alertAction1];
    [self jc_presentViewController:alert1 presentType:presentType presentCompletion:nil dismissCompletion:nil];
    
    // alert2
    UIAlertController *alert2 = [UIAlertController alertControllerWithTitle:@"alert2" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // alert4
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"alert4" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:alertAction];
        [self jc_presentViewController:alert presentType:presentType presentCompletion:nil dismissCompletion:nil];
    }];
    [alert2 addAction:alertAction2];
    [self jc_presentViewController:alert2 presentType:presentType presentCompletion:nil dismissCompletion:nil];
    
    // alert3
    UIAlertController *alert3 = [UIAlertController alertControllerWithTitle:@"alert3" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertAction3 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
    [alert3 addAction:alertAction3];
    [self jc_presentViewController:alert3 presentType:presentType presentCompletion:nil dismissCompletion:nil];
}


@end
