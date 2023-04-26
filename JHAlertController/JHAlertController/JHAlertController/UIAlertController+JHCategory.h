//
//  UIAlertController+JHCategory.h
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

#import <UIKit/UIKit.h>

#define jhAlertCtrl(title,message,type)     jh_alertCtrl(title,message,type)

typedef void(^jhAlertAction)(void);

@interface UIAlertController (JHCategory)

+ (UIAlertController *_Nonnull(^_Nullable)(id _Nullable ,id _Nullable ,id _Nonnull))jh_alertCtrl;
- (UIAlertController *_Nonnull(^_Nullable)(id _Nullable, jhAlertAction _Nullable))jh_addNormalAction;
- (UIAlertController *_Nonnull(^_Nullable)(id _Nullable, jhAlertAction _Nullable))jh_addCancelAction;
- (UIAlertController *_Nonnull(^_Nullable)(id _Nullable, jhAlertAction _Nullable))jh_addDestructAction;
- (UIAlertController *_Nonnull(^_Nullable)(id _Nullable))jh_addTextField;
- (UIAlertController *_Nonnull(^_Nullable)(id _Nullable))jh_show;

/// 只展示图片的
+ (instancetype _Nonnull)alertControllerWithTitle:(nullable NSString *)title image:(NSString *_Nonnull)image imageSize:(CGSize)imageSize preferredStyle:(UIAlertControllerStyle)preferredStyle;

/// 展示自定义视图
+ (instancetype _Nonnull)alertControllerWithTitle:(nullable NSString *)title customView:(UIView *_Nonnull)customView viewSize:(CGSize)viewSize preferredStyle:(UIAlertControllerStyle)preferredStyle;

@end

/**<
 
 UIAlertController
 .jh_alertCtrl(@"Title", @"message", @(1))
 .jh_addNormalAction(@"确定",^{
    //code
 })
 .jh_addCancelAction(@"取消",^{
    //code
 })
 .jh_addDestructAction(@"删除",^{
    //code
 })
 .jh_show(self);
 
 */

