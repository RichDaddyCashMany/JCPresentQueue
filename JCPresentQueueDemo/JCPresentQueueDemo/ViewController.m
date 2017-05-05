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

    // JCPresentTypeLIFO: alert3 >> alert2 >> alert1 (same with UIAlertView)
    // JCPresentTypeFIFO: alert1 >> alert2 >> alert3
    
    for (int i = 1; i<4; i++) {
        NSString *title = [NSString stringWithFormat:@"alert%zi", i];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:alertAction1];
        [self jc_presentViewController:alert presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];
    }
    
}


@end
