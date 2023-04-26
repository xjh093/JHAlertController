//
//  ViewController.m
//  JHAlertController
//
//  Created by HaoCold on 2023/4/26.
//

#import "ViewController.h"
#import "UIAlertController+JHCategory.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(0, 0, 100, 61.8);
    button1.backgroundColor = [UIColor lightGrayColor];
    button1.titleLabel.font = [UIFont systemFontOfSize:16];
    [button1 setTitle:@"图片" forState:0];
    [button1 setTitleColor:[UIColor blackColor] forState:0];
    [button1 addTarget:self action:@selector(buttonAction1) forControlEvents:1<<6];
    [self.view addSubview:button1];
    button1.center = self.view.center;
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectOffset(button1.frame, 0, 70);// CGRectMake(0, CGRectGetMaxY(button1.frame) + 10, 100, 61.8);
    button2.backgroundColor = [UIColor lightGrayColor];
    button2.titleLabel.font = [UIFont systemFontOfSize:16];
    [button2 setTitle:@"自定义视图" forState:0];
    [button2 setTitleColor:[UIColor blackColor] forState:0];
    [button2 addTarget:self action:@selector(buttonAction2) forControlEvents:1<<6];
    [self.view addSubview:button2];
    
}

- (void)buttonAction1
{    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请使用微信扫描二维码" image:@"qrxgame" imageSize:CGSizeMake(120, 120) preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)buttonAction2
{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, 200, 150);
    view.backgroundColor = [UIColor orangeColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 0, 180, 30);
    label.text = @"文本文本";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = 1;
    [view addSubview:label];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(50, CGRectGetMaxY(label.frame) + 10, 100, 100);
    imageView.image = [UIImage imageNamed:@"qrxgame"];
    [view addSubview:imageView];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请使用微信扫描二维码" customView:view viewSize:view.frame.size preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

    }]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
