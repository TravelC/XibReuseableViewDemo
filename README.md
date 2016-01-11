
StoryBoard和Interface Builder为iOS开发带来了极大的便利，今天就给大家介绍一个使用Interface Builder的技巧：
使用xib创建可复用View。
截图：

![](http://7xpujh.com1.z0.glb.clouddn.com/static/images/20160107/cardView.gif)

[http://travelchu.com](http://travelchu.com)

在项目开发中，我们经常需要创建一些可复用的view，比较简单的话代码写写也是很快，但如果比较复杂的话，使用Interface Builder创建一个xib文件来制作就快捷很多，但是传统的方法生成的view只属于xib的File's Owner, 没有办法复用。

举个例子，项目有多个页面需要使用一个控件（UIView）来展示一张公交卡的信息, 界面如下：
<!-- more -->
![](http://7xpujh.com1.z0.glb.clouddn.com/static/images/20160107/cardView.png)

可以看到这个界面如果用代码写的话还是要花不少功夫的，而且要支持AutoLayout的话，即使有Masonry，代码的长度也可想而知。而使用xib来创建的话相对会容易很多。用xib创建一个这样的页面，相信大家都会，下面我们来看如何让创建的view既支持通过init方法使用，又支持直接在其他xib或者storyboard文件使用。我们给这个view取个名字，就叫“CardView”吧。
(示例代码: https://github.com/TravelC/XibReuseableViewDemo)

## 1. 创建CardView.xib文件，并创建好页面，设置好约束

![](http://7xpujh.com1.z0.glb.clouddn.com/static/images/20160107/cardView_xib.png)

## 2. 创建UIView的子类CardView，设置CardView.xib的File's Owner为CardView

注意这里的CardView是UIView的子类，并不是UIViewController的子类。

![](http://7xpujh.com1.z0.glb.clouddn.com/static/images/20160107/cardView_owner.png)

## 3. 设置我们的cardView为CardView类的一个IBOutlet，这里取名为view

![](http://7xpujh.com1.z0.glb.clouddn.com/static/images/20160107/cardView_outlet.png)

## 4. 打开CardView.m，重写初始化方法
这里重写了从代码创建会使用init、initWithFrame方法，以及在xib或者storyboard用到的initWithCoder方法。下面的示例代码封装了一个loadCardViewFromNib方法，用来从xib加载view以及做一些初始化操作(增加了一个灰色的边框并设置圆角)。

CardView.h

```objc
#import <UIKit/UIKit.h>

@interface CardView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;

@property (weak, nonatomic) IBOutlet UILabel *cardTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardNoLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardMoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *numOfOpenedProductLabel;
@property (weak, nonatomic) IBOutlet UILabel *awardRecordLabel;
@property (weak, nonatomic) IBOutlet UIImageView *certificatedImageView;
@property (weak, nonatomic) IBOutlet UILabel *certificatedLabel;
@property (weak, nonatomic) IBOutlet UIButton *certificateButton;
@property (weak, nonatomic) IBOutlet UIButton *modifyCardInfoButton;
@property (weak, nonatomic) IBOutlet UIView *cardTypeBgView;

@end
```


CardView.m

```objc
#import "CardView.h"

@interface CardView ()
@property BOOL isCardViewLoadedFromNib;
@end

@implementation CardView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)loadCardViewFromNib {
    if (!self.isCardViewLoadedFromNib) {
        [[NSBundle mainBundle] loadNibNamed:@"CardView" owner:self options:nil];
        [self addSubview:self.view];
        self.view.layer.borderWidth = 0.5;
        self.view.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.view.layer.cornerRadius = 5.0;

        self.isCardViewLoadedFromNib = YES;
    }
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadCardViewFromNib];
    }
    return self;
}

//
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadCardViewFromNib];
        CGRect viewFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        self.view.frame = viewFrame;
    }
    return self;
}

//
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self loadCardViewFromNib];
    }
    return self;
}

```


可以看到，在loadCardViewFromNib里面，我们事实上从CardView.xib初始化了一个view（IBOutlet那个），并把它当做subView加到了CardView的实例上面。同时，在CardView.h里面我们设置了一系列的IBOutlet，以方便CardView的后续使用。


## 5. 在代码中使用CardView

在代码中使用CardView，相当方便，像你使用UIView一样来使用即可，这里给出一个通过initWithFrame方法创建的例子：

```objc
CardView *cardView = [[CardView alloc] initWithFrame:CGRectMake(10.0, 70.0, 300.0, 186.0)];
[self.view addSubview:cardView];
```
## 6. 在xib或者storyboard中使用CardView

拖拽一个UIView，将它的类改成CardView即可，唯一的缺点就是不能在xib或者storyboard中预览CardView，现实的实际是空白的UIView，但在程序运行时是CardView真实的样子。

![](http://7xpujh.com1.z0.glb.clouddn.com/static/images/20160107/cardView_storyboard.png)



LICENSE
---
Distributed under the MIT License.

Author
---
If you wish to contact me, email at: chuchuanming@gmail.com

Blog
---
[http://travelchu.com](http://travelchu.com)