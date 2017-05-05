# JCPresentQueue

A category automatic manages controller present order.

## Installation with CocoaPods

step 1
```objc
target 'your target' do
pod 'JCPresentQueue'
end
```

step 2
```objc
#import "UIViewController+JCPresentQueue.h"
```

## Usage

```objc
// JCPresentTypeLIFO: alert3 >> alert2 >> alert1 (same with UIAlertView)
// JCPresentTypeFIFO: alert1 >> alert2 >> alert3

for (int i = 1; i<4; i++) {
NSString *title = [NSString stringWithFormat:@"alert%zi", i];
UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
[alert addAction:alertAction1];
[self jc_presentViewController:alert presentType:JCPresentTypeLIFO presentCompletion:nil dismissCompletion:nil];
}
```
