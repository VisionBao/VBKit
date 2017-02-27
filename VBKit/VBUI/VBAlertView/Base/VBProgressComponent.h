//
//  VBAlertBaseView.h
//  VBKitExample
//
//  Created by Vision on 2017/2/27.
//  Copyright © 2017年 VisionBao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VBProgressComponent : UIView

+ (_Nonnull instancetype)showHUDAddedTo:( UIView * _Nonnull)view
                               animated:(BOOL)animated;

+ (BOOL)hideHUDForView:(UIView * _Nonnull)view
              animated:(BOOL)animated;

+ (nullable VBAlertBaseView *)HUDForView:(UIView * _Nonnull)view;



- (void)showWithAnimated:(BOOL)animated;

- (void)hideWithAnimated:(BOOL)animated;

- (void)hideWithAnimated:(BOOL)animated
              afterDelay:(NSTimeInterval)delay;

- (_Nonnull instancetype)initWithView:(UIView * _Nonnull)view;
@end
