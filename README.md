# JCPresentQueue

You can present `multiple` alerts like this:

<img style="width:320px" src="http://github-1252137158.file.myqcloud.com/JCPresentQueue/alert_gif.gif"></img>

## Installation with CocoaPods

step 1

```objc
target 'your target' do
pod 'JCPresentQueue'
end
```

step 2

```objc
#import "JCPresentController.h"
```

## Usage

```objc
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
```
