//
//  CodeTextDemo
//
//  Created by 小侯爷 on 2018/9/20.
//  Copyright © 2018年 小侯爷. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * 基础版 - 方块
 */
@interface HWTFCodeBView : UIView

/// 当前输入的内容
@property (nonatomic, copy, readonly) NSString *code;
@property (nonatomic, weak) UITextField *textField;
@property (nonatomic, strong) NSMutableArray<UILabel *> *labels;
@property (copy,nonatomic) void (^returnBlock)(NSString *code);
@property (nonatomic, copy) NSString *inpuCode;

- (instancetype)initWithCount:(NSInteger)count margin:(CGFloat)margin;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;


@end

NS_ASSUME_NONNULL_END
