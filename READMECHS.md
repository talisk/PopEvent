# PopEvent

[English](/README.md) | 中文版

迄今处理右滑手势最优雅的方式。

## 为什么选择PopEvent?

你是否遇到过以下需求： 

* 当你自定义了`leftNavigationItem`后，屏幕边缘的右滑pop手势失效了。
* 当你想让用户确认是否返回需要弹出alert的时候，你需要拦截用户右滑pop手势。

现在你可以用一行代码来实现你的需求。

## 栗子

### 自定义按钮后的右滑手势

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

### 右滑手势拦截

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

## 集成

### CocoaPods

你可以通过[CocoaPods](http://cocoapods.org)来集成PopEvent。

	pod 'PopEvent'

### 手动方式

把`PopEvent`文件夹拖到你的项目中。

## 用法

PopEvent有两种功能，首先一定是在需要的地方`#import "PopEvent.h"`。

### 自定义按钮后的右滑手势

仅需要在`AppDelegate`的`-application: didFinishLaunchingWithOptions:`方法里添加一行代码即可。

**如果你不是用storyboard初始化的ViewController，一定要确保这行代码在RootViewController初始化之前执行。**

``` objc
[PopEvent restorePopGestureRecognizer];
```

### 右滑手势拦截

仅需要在你想拦截手势的那个ViewController里添加一行代码即可。

``` objc
[self addPopEventSelectorString:@"popEvent" viewControllerNamed:NSStringFromClass([self class])];
```

**第一个参数是拦截后需要执行的方法名称字符串，根据需要替换。如果没有需要执行的方法，可以传入空字符串。**

Example里有详细的使用样例。

## 贡献

[@talisk](mailto:talisk@talisk.cn)

## 有问题？

欢迎给我发邮件，或者提issue。

本项目遵循MIT协议，欢迎为开源作出贡献。
