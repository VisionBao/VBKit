//
//  VBAlertBaseView.h
//  VBKitExample
//
//  Created by Vision on 2017/2/27.
//  Copyright © 2017年 VisionBao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VBProgressComponent : UIView

+ (instancetype _Nonnull)showHUDAddedTo:( UIView * _Nonnull)view
                               animated:(BOOL)animated;

+ (BOOL)hideHUDForView:(UIView * _Nonnull)view
              animated:(BOOL)animated;

+ (UIView * _Nonnull )HUDForView:(UIView * _Nonnull)view;

- (void)showWithAnimated:(BOOL)animated;

- (void)hideWithAnimated:(BOOL)animated;

- (void)hideWithAnimated:(BOOL)animated
              afterDelay:(NSTimeInterval)delay;

- (instancetype _Nonnull)initWithView:(UIView * _Nonnull)view;
@end
