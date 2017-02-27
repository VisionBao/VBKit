//
//  VBAlertBaseView.m
//  VBKitExample
//
//  Created by Vision on 2017/2/27.
//  Copyright © 2017年 VisionBao. All rights reserved.
//

#import "VBProgressComponent.h"

@interface VBProgressComponent ()

@end

@implementation VBProgressComponent

+ (instancetype)showHUDAddedTo:(UIView *)view animated:(BOOL)animated {
    VBProgressComponent *AlertView = [[self alloc] initWithView:view];
    [view addSubview:AlertView];
    return AlertView;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        [self setupBaseView];
    }
    return self;
}

- (void)hideWithAnimated:(BOOL)animated {
    
    [self removeFromSuperview];
}

- (void)hideWithAnimated:(BOOL)animated
              afterDelay:(NSTimeInterval)delay {
    
    [self removeFromSuperview];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupBaseView];
    }
    return self;
}


- (_Nonnull instancetype)initWithView:(UIView * _Nonnull)view {
    
    return [self initWithFrame:view.bounds];
}

- (void)setupBaseView {
    
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.backgroundColor = [UIColor yellowColor];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event {
    
    [self hideWithAnimated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
