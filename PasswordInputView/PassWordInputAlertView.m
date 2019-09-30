//
//  PassWordInputAlertView.m
//  com.yjwh.yj
//
//  Created by yujianMac on 2019/9/30.
//  Copyright © 2019 ferver7. All rights reserved.
//

#import "PassWordInputAlertView.h"
#import "HWTFCodeBView.h"
#import "KeyboardView.h"
#import "KeyboradViewMarc.h"

@interface PassWordInputAlertView()<KeyboardViewDelegate>

@property(nonatomic,strong) HWTFCodeBView *codeBView;
@property(nonatomic,strong) KeyboardView *keybordView;


@end

@implementation PassWordInputAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = CGRectMake(0,0,KWidth, 216+10+35+40+35 + SafeAreaBottomHeight);
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,KWidth,35)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font  = [UIFont systemFontOfSize:14];
        titleLabel.text     = @"请输入支付密码";
        [self addSubview:titleLabel];
//密码输入框
        self.codeBView = [[HWTFCodeBView alloc] initWithCount:6 margin:-1];
        self.codeBView.backgroundColor = [UIColor whiteColor];
        self.codeBView.frame = CGRectMake(50, 35, KWidth-100, 40);
        __weak typeof(self) weakSelf = self;
        self.codeBView.returnBlock = ^(NSString * _Nonnull code) {
            if (code.length == 6) {
                if (weakSelf.PassWordBlock) {
                    weakSelf.PassWordBlock(code);
                    [GKCover hide];
                }
            }
        };
        [self addSubview:self.codeBView];
        
        UIButton *loseSecretBtn = [[UIButton alloc]initWithFrame:CGRectMake(KWidth-145, CGRectGetMaxY(self.codeBView.frame)+10, 100, 35)];
        loseSecretBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        loseSecretBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        [loseSecretBtn setTitle:@"忘记支付密码" forState:UIControlStateNormal];
        [loseSecretBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [loseSecretBtn addTarget:self action:@selector(loseSecretBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:loseSecretBtn];
// 结束密码输入框
//        密码键盘
         self.keybordView = [[KeyboardView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(loseSecretBtn.frame),KWidth,216)];
         self.keybordView.delegate = self;
        [self.keybordView createdKeyboard];
        [self addSubview:self.keybordView];
        
        
    
    }
    return self;
}

+ (instancetype)PassWordInputAlertView:(void (^)(NSString * _Nonnull))PassWordBlock loseSecretBlock:(void (^)(void))loseSecretBlock{
    PassWordInputAlertView *alertView = [[PassWordInputAlertView alloc] initWithFrame:CGRectZero];
    alertView.backgroundColor = [UIColor whiteColor];
    alertView.PassWordBlock = PassWordBlock;
    alertView.loseSecretBlock =  loseSecretBlock;
    return alertView;
}

- (void)showSuperV:(UIView *)superV{
    [GKCover translucentCoverFrom:superV content:self animated:YES notClick:NO];
}

- (void)loseSecretBtnClick:(UIButton *)sender{
    NSLog(@"loseSecretBtnClick");
    if (self.loseSecretBlock) {
        self.loseSecretBlock();
        [GKCover hide];
    }
}

#pragma mark - KeyboardViewDelegate
- (void)numberKeyboard:(KeyboardView *)numberKeyboard replacementString:(NSString *)string {
    if (self.codeBView.inpuCode) {
        self.codeBView.inpuCode = [NSString stringWithFormat:@"%@%@",self.codeBView.inpuCode,string];
    }else{
        self.codeBView.inpuCode = string;
    }
}

- (NumberKeyboardType)numberKeyboardType:(KeyboardView *)numberKeyboard {
    
    return NumberKeyboardTypeNumber;
}

- (BOOL)textFieldShouldClear:(KeyboardView *)numberKeyboard {
    
    NSLog(@"textFieldShouldClear==");
    return YES;
}

- (BOOL)textFieldShouldDelete:(KeyboardView *)numberKeyboard {
    NSLog(@"textFieldShouldDelete=be=%@",self.codeBView.inpuCode);
    if([self.codeBView.inpuCode length] > 0){
        self.codeBView.inpuCode = [self.codeBView.inpuCode substringToIndex:([self.codeBView.inpuCode length]-1)];// 去掉最后一个","
    }
    NSLog(@"textFieldShouldDelete=af=%@",self.codeBView.inpuCode);
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(KeyboardView *)numberKeyboard {
    NSLog(@"textFieldShouldReturn==");
    return YES;
}

- (BOOL)textFieldShouldSpace:(KeyboardView *)numberKeyboard {
    
    return YES;
}
@end
