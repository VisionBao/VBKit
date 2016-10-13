//
//  VBBaseViewController.m
//  VBKit
//
//  Created by Vision on 9/23/16.
//  Copyright © 2016 VisionBao. All rights reserved.
//

#import "VBBaseViewController.h"
#import "VBConstants.h"
#import "VBColorManager.h"

@interface VBBaseViewController ()
@property (nonatomic, strong) VBBaseNavigationBar *navBar;
@property (nonatomic, strong) UINavigationItem *navItem;

@property (nonatomic, strong) UIButton *backUpButton;
@property (nonatomic, strong) UIButton *rightMenuButton;
@end

@implementation VBBaseViewController

- (instancetype)init {
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.clipsToBounds = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;

}

#pragma mark -
#pragma mark nav
- (void)initNavBar {
    if (!_navBar) {
        _navBar = [[VBBaseNavigationBar alloc] init];
        _navItem = [[UINavigationItem alloc] init];
        
        [_navBar setFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAVIGATION_BAR_HEIGHT)];
        [_navBar setTranslucent:NO];
        [_navBar pushNavigationItem:_navItem animated:NO];
        [_navBar setBarTintColor:[VBColorManager colorWithHomeColor]];
        [_navBar setTitleTextAttributes:
                                        [NSDictionary dictionaryWithObjectsAndKeys:[VBColorManager colorWithWhiteColor],
                                         NSForegroundColorAttributeName,
                                         [UIFont fontWithName:@"Arial Rounded MT Bold" size:17],
                                         NSFontAttributeName,
                                         nil]];
        
        [self.view addSubview:_navBar];
    }
}

#pragma mark -
#pragma mark title

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    [self initNavBarWithTitle:title];
}

- (void)initNavBarWithTitle:(NSString *)title {
    [self initNavBar];
    _navItem.title = title;
}

- (void)initNavBarWithImageName:(NSString *)imageName {
    [self initNavBar];
    UIImage *image = [UIImage imageNamed:imageName];
    _navItem.titleView = [[UIImageView alloc] initWithImage:image];
    
}

- (void)initNavBarWithCustomView:(UIView *)view {
    [self initNavBar];
    _navItem.titleView = view;
}

#pragma mark -
#pragma mark left
- (void)addBackButtonItem {
    if (!_backUpButton) {
        _backUpButton =[self creatDefaultButtonItemWithImageName:@"VB_Nav_Left"
                                                          Action:@selector(backButtonItemClick)];
    }
    UIBarButtonItem *leftBtnItem = [[UIBarButtonItem alloc] initWithCustomView:_backUpButton];
    _navItem.leftBarButtonItem = leftBtnItem;
}

- (void)addBackButtonItemWithTitle:(NSString *)title
                             backImg:(NSString *)backImg {
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
    if (backImg && [backImg length] > 0) {
        UIImage *image = [UIImage imageNamed:backImg];
        if (image) {
            [backBtn setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
            [backBtn setBackgroundImage:[UIImage imageNamed:backImg] forState:UIControlStateNormal];
        }
    } else if (title.length>0) {
        CGRect frame = backBtn.frame;
        frame.size.width = title.length * 17;
        backBtn.frame = frame;
    }
    [backBtn addTarget:self action:@selector(backButtonItemClick) forControlEvents:UIControlEventTouchUpInside];
    [backBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [backBtn setTitle:title forState:UIControlStateNormal];
    UIBarButtonItem *backBtnItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    _navItem.leftBarButtonItem = backBtnItem;
}
#pragma mark -
#pragma mark right
- (void)addRightButtonItem {
    if (!_rightMenuButton) {
        _rightMenuButton = [self creatDefaultButtonItemWithImageName:@"VB_Nav_Right"
                                                              Action:@selector(rightButtonItemClick)];
    }
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:_rightMenuButton];
    _navItem.rightBarButtonItem = rightBtnItem;
}

- (void)addCheckButtonItem {
    if (!_rightMenuButton) {
        _rightMenuButton = [self creatDefaultButtonItemWithImageName:@"VB_Nav_Check"
                                                              Action:@selector(rightButtonItemClick)];
    }
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:_rightMenuButton];
    _navItem.rightBarButtonItem = rightBtnItem;
}

- (void)addCloseButtonItem {
    if (!_rightMenuButton) {
        _rightMenuButton = [self creatDefaultButtonItemWithImageName:@"VB_Nav_Close"
                                                              Action:@selector(rightButtonItemClick)];
    }
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:_rightMenuButton];
    _navItem.rightBarButtonItem = rightBtnItem;
}

- (void)addRightButtonItemWithTitle:(NSString *)title
                              backImg:(NSString *)backImg {
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
    if (backImg && [backImg length] > 0) {
        UIImage *image = [UIImage imageNamed:backImg];
        if (image) {
            [rightBtn setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
            [rightBtn setBackgroundImage:[UIImage imageNamed:backImg] forState:UIControlStateNormal];
        }
    } else if (title.length>0) {
        CGRect frame = rightBtn.frame;
        frame.size.width = title.length * 17;
        rightBtn.frame = frame;
    }
    [rightBtn addTarget:self action:@selector(rightButtonItemClick) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [rightBtn setTitle:title forState:UIControlStateNormal];
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    _navItem.rightBarButtonItem = rightBtnItem;
}
#pragma mark -
#pragma mark hide
- (void)hideNavigationBar:(BOOL)hide
                 animated:(BOOL)animated
                   finish:(void(^)(void))finishBlock{
    if (animated) {
        [self hideNavigationBarAnimated:YES];
    } else {
        _navBar.hidden = hide;
    }
    if (finishBlock) {
        finishBlock();
    }
}

- (void)hideNavigationBarAnimated:(BOOL)hide {
    [UIView animateWithDuration:0.1 animations:^{
        if (hide) {
            [_navBar setFrame:CGRectMake(0, -NAVIGATION_BAR_HEIGHT, SCREEN_WIDTH, NAVIGATION_BAR_HEIGHT)];
            _navBar.alpha = 0;
        } else {
            _navBar.alpha = 1;
            [_navBar setFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAVIGATION_BAR_HEIGHT)];
        }
    } completion:^(BOOL finished) {
        _navBar.hidden = hide;
        
    }];
}

#pragma mark -
#pragma mark Action
- (void)backButtonItemClick {

}

- (void)rightButtonItemClick {

}
#pragma mark -
#pragma mark Other
- (UIButton *)creatDefaultButtonItemWithImageName:(NSString *)imageNamge
                                                  Action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 44);
    [button setBackgroundColor:[UIColor clearColor]];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [button setImage:[UIImage imageNamed:imageNamge] forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
@end
