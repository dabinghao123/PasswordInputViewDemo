//
//  PassWordInputAlertView.h
//  com.yjwh.yj
//
//  Created by yujianMac on 2019/9/30.
//  Copyright © 2019 ferver7. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PassWordInputAlertView : UIView

@property(nonatomic,copy) void(^PassWordBlock)(NSString * _Nonnull);
@property(nonatomic,copy) void(^loseSecretBlock)(void);


+(instancetype)PassWordInputAlertView:(void (^)(NSString *))PassWordBlock loseSecretBlock:(void (^)(void)) loseSecretBlock;

- (void)showSuperV:(UIView *)superV;

@end

NS_ASSUME_NONNULL_END
