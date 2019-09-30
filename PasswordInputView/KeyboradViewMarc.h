//
//  KeyboradViewMarc.h
//  OttoKeyboardViewDemo
//
//  Created by yujianMac on 2019/9/30.
//  Copyright © 2019 otto. All rights reserved.
//

#ifndef KeyboradViewMarc_h
#define KeyboradViewMarc_h

#import "GKCover.h"

#define UIColorFromHexA(hexValue, a)     [UIColor colorWithRed:(((hexValue & 0xFF0000) >> 16))/255.0f green:(((hexValue & 0xFF00) >> 8))/255.0f blue:((hexValue & 0xFF))/255.0f alpha:a]
#define UIColorFromHex(hexValue)        UIColorFromHexA(hexValue, 1.0f)
#define UIColorFrom255RGBA(r, g, b, a)  ([UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a])
#define UIColorFrom255RGB(r, g, b)      UIColorFrom255RGBA(r,g,b,1.0f)

#define KWidth  [UIScreen mainScreen].bounds.size.width
#define KHeight [UIScreen mainScreen].bounds.size.height

#define SafeAreaBottomHeight (KHeight == 812.0 ? 34 : 0)

#endif /* KeyboradViewMarc_h */
