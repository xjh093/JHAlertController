//
//  UIAlertController+JHCategory.m
//  JHKit
//
//  Created by Lightech on 14-10-16.
//  Copyright (c) 2014年 Lightech. All rights reserved.
//
//  MIT License
//
//  Copyright (c) 2017 xjh093
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "UIAlertController+JHCategory.h"

@implementation UIAlertController (JHCategory)

+ (UIAlertController *(^)(id,id,id))jh_alertCtrl{
    return ^id(id title,id message,id type){
        if ([type integerValue] == 0 || [type integerValue] == 1) {
            UIAlertController *jhAlert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:[type integerValue]];
            return jhAlert;
        }
        return nil;
    };
}

- (UIAlertController *(^)(id,jhAlertAction))jh_addNormalAction{
    return ^id(id title,jhAlertAction jhBlock){
        UIAlertAction *jhAction = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (jhBlock) {
                jhBlock();
            }
        }];
        [self addAction:jhAction];
        return self;
    };
}

- (UIAlertController *(^)(id,jhAlertAction))jh_addCancelAction{
    return ^id(id title,jhAlertAction jhBlock){
        UIAlertAction *jhAction = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (jhBlock) {
                jhBlock();
            }
        }];
        [self addAction:jhAction];
        return self;
    };
}

- (UIAlertController *(^)(id,jhAlertAction))jh_addDestructAction{
    return ^id(id title,jhAlertAction jhBlock){
        UIAlertAction *jhAction = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            if (jhBlock) {
                jhBlock();
            }
        }];
        [self addAction:jhAction];
        return self;
    };
}

- (UIAlertController *(^)(id))jh_addTextField{
    return ^id(id title){
        [self addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = title;
            textField.leftViewMode = UITextFieldViewModeAlways;
            textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
        }];
        return self;
    };
}

- (UIAlertController *(^)(id))jh_show{
    return ^id(id vc){
        if ([vc isKindOfClass:[UIViewController class]]) {
            [vc presentViewController:self animated:YES completion:nil];
        }
        return self;
    };
}

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title image:(NSString *)image imageSize:(CGSize)imageSize preferredStyle:(UIAlertControllerStyle)preferredStyle
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:image];
    
    UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:title customView:imageView viewSize:imageSize preferredStyle:preferredStyle];
    
    return alertCtrl;
}

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title customView:(UIView *)customView viewSize:(CGSize)viewSize preferredStyle:(UIAlertControllerStyle)preferredStyle
{
    /*
     6p - scale: 3
     \n       - 31.67
     \n\n     - 47.67 (16)
     \n\n\n   - 63.67 (16)
     
     x - scale: 3
     \n       - 31.67
     \n\n     - 47.67 (16)
     \n\n\n   - 63.67 (16)
     
     xr - scale: 2
     \n       - 36
     \n\n     - 54 (18)
     \n\n\n   - 72 (18)
     */
    
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat lineHeight = scale == 2 ? 18 : 16;
    
    NSInteger count = ceilf(viewSize.height / lineHeight);
    NSMutableString *msg = @"".mutableCopy;
    for (NSInteger i = 0; i < count; i++) {
        [msg appendString:@"\n"];
    }

    UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    customView.translatesAutoresizingMaskIntoConstraints = NO;
    [alertCtrl.view addSubview:customView];
    
    [customView.centerXAnchor constraintEqualToAnchor:alertCtrl.view.centerXAnchor].active = YES;
    [customView.centerYAnchor constraintEqualToAnchor:alertCtrl.view.centerYAnchor].active = YES;
    [customView.widthAnchor constraintEqualToConstant:viewSize.width].active = YES;
    [customView.heightAnchor constraintEqualToConstant:viewSize.height].active = YES;
    
    return alertCtrl;
}

@end
