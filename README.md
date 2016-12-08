# PopEvent

English | [中文版](/READMECHS.md)

An elegant way to handle pop gesture recogenizer event.

## Why PopEvent?

Have you ever had such a problem? 

* The screen-edge-pan gesture recognizer is invalid when you custom the `leftNavigationItem`.
* When you want to make user confirm whether to popToSuperViewController or not, you should prevent the pop and present a `UIAlertController'.

Now you can implement them with a little bit of code.

## Example

### Enable ScreenEdgePan for custom-backButton

![](/Screenshots/p02.gif)

`AppDelegate.m`

``` objc
#import "AppDelegate.h"
#import "PopEvent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [PopEvent restorePopGestureRecognizer];
    return YES;
}

@end
```

### Prevent the pop

![](/Screenshots/p01.gif)

`ViewController1.m`

``` objc
#import "ViewController1.h"
#import "PopEvent.h"

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addPopEventSelectorString:@"popEvent" viewControllerNamed:NSStringFromClass([self class])];
}

- (void)popEvent {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"PopEvent!" message:@"do something" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
}
```

## Installation

### CocoaPods

PopEvent is available through [CocoaPods](http://cocoapods.org).

	pod 'PopEvent'

### Manual

Drag the `PopEvent` folder to your project.

## Usage

PopEvent has two functions. First, `#import "PopEvent.h"`.

### Enable ScreenEdgePan for custom-backButton

Add only one line of code into `-application: didFinishLaunchingWithOptions:` in `AppDelegate`.

**Make sure the code runs before the RootViewController's initialization when your app isn't loaded from storyboard.**

``` objc
[PopEvent restorePopGestureRecognizer];
```

### Prevent the pop

Add only one line of code into the ViewController which will be prevented the pop gesture recognizer.

``` objc
[self addPopEventSelectorString:@"popEvent" viewControllerNamed:NSStringFromClass([self class])];
```

**The first parameter need to be replaced by the event function name.**

You can find detail in the Example.

## Contribution

[@talisk](mailto:talisk@talisk.cn)

## Questions

Welcome to send email to me, or open issue on the repository.

The project follow to the MIT license. Welcome contributions.
