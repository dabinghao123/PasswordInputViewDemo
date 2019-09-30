//
//  CodeTextDemo
//
//  Created by 小侯爷 on 2018/9/20.
//  Copyright © 2018年 小侯爷. All rights reserved.
//

#import "HWTFCodeBView.h"

@interface HWTFCodeBView ()

@property (nonatomic, assign) NSInteger itemCount;

@property (nonatomic, assign) CGFloat itemMargin;



@property (nonatomic, weak) UIControl *maskView;



@end

@implementation HWTFCodeBView

#pragma mark - 初始化
- (instancetype)initWithCount:(NSInteger)count margin:(CGFloat)margin
{
    if (self = [super init]) {
        
        self.itemCount = count;
        self.itemMargin = margin;
        
        [self configTextField];
    }
    return self;
}

- (void)configTextField
{
    self.backgroundColor = [UIColor whiteColor];
    
    self.labels = @[].mutableCopy;
    
    UITextField *textField = [[UITextField alloc] init];
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    [textField addTarget:self action:@selector(tfEditingChanged:) forControlEvents:(UIControlEventEditingChanged)];
    
    [self addSubview:textField];
    self.textField = textField;
    
    UIButton *maskView = [UIButton new];
    maskView.backgroundColor = [UIColor whiteColor];
    [maskView addTarget:self action:@selector(clickMaskView) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:maskView];
    self.maskView = maskView;
    
    for (NSInteger i = 0; i < self.itemCount; i++)
    {
        UILabel *label = [UILabel new];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = [UIColor darkTextColor];
        label.font = [UIFont systemFontOfSize:14];
        label.layer.borderColor = [[UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1.0] CGColor];
        label.layer.borderWidth = 1;
        [self addSubview:label];
        [self.labels addObject:label];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.labels.count != self.itemCount) return;
    CGFloat temp = self.bounds.size.width - (self.itemMargin * (self.itemCount - 1));
    CGFloat w = temp / self.itemCount;
    CGFloat x = 1;
    
    for (NSInteger i = 0; i < self.labels.count; i++)
    {
        x = i * (w + self.itemMargin);
        UILabel *label = self.labels[i];
        label.frame = CGRectMake(x, 0, w, w);
    }
    self.textField.frame = self.bounds;
    self.maskView.frame = self.bounds;
}

#pragma mark - 编辑改变
- (void)tfEditingChanged:(UITextField *)textField
{
    if (textField.text.length > self.itemCount) {
        textField.text = [textField.text substringWithRange:NSMakeRange(0, self.itemCount)];
    }
    for (int i = 0; i < self.itemCount; i++)
    {
        UILabel *label = [self.labels objectAtIndex:i];
        if (i < textField.text.length) {
            label.text = @"●";
        } else {
            label.text = nil;
        }
    }
    // 输入完毕后，自动隐藏键盘
    if (textField.text.length >= self.itemCount) {
        
    }
    if (self.returnBlock) {
        self.returnBlock(textField.text);
    }
}



- (void)clickMaskView
{
    [self.textField becomeFirstResponder];
}

- (BOOL)endEditing:(BOOL)force
{
    [self.textField endEditing:force];
    return [super endEditing:force];
}

- (NSString *)code
{
    return self.textField.text;
}

- (void)setInpuCode:(NSString *)inpuCode{
    
    _inpuCode = inpuCode;
    
    if (inpuCode.length > self.itemCount) {
        inpuCode = [inpuCode substringWithRange:NSMakeRange(0, self.itemCount)];
    }
    for (int i = 0; i < self.itemCount; i++)
    {
        UILabel *label = [self.labels objectAtIndex:i];
        if (i < inpuCode.length) {
            label.text = @"●";
        } else {
            label.text = nil;
        }
    }
    // 输入完毕后，自动隐藏键盘
    if (inpuCode.length >= self.itemCount) {
        
    }
    if (self.returnBlock) {
        self.returnBlock(inpuCode);
    }
    
}

@end
