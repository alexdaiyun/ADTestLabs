//
//  CardButton.h
//  ADTestLabs
//
//  Created by dai yun on 12-10-22.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface CardButton : UIButton {
    UILabel *_cardTitleLabel; //标题 UILabel
    NSString *_cardTitleText; //标题文字
    UIColor *_cardTitleColor; //标题颜色
    
    UILabel *_cardSubTitleLabel; //副标题 UILabel
    NSString *_cardSubTitleText; //副标题文字
    UIColor *_cardSubTitleColor; //副标题颜色
    
    UILabel *_scopeLabel; //范围 UILabel
    NSString *_scopeText; //范围文字
    UIColor *_scopeColor; //范围颜色
    
    UILabel *_itemTotalLabel; //项目数 UILabel
    NSString *_itemTotalText; //项目数文字
    UIColor *_itemTotalColor; //项目数颜色
    
    NSUInteger _cardType; //类型
    
}

@property (nonatomic, strong) UILabel *cardTitleLabel;
@property (nonatomic, strong) NSString *cardTitleText;
@property (nonatomic, strong) UIColor *cardTitleColor;

@property (nonatomic, strong) UILabel *cardSubTitleLabel;
@property (nonatomic, strong) NSString *cardSubTitleText;
@property (nonatomic, strong) UIColor *cardSubTitleColor;

@property (nonatomic, strong) UILabel *scopeLabel;
@property (nonatomic, strong) NSString *scopeText;
@property (nonatomic, strong) UIColor *scopeColor;

@property (nonatomic, strong) UILabel *itemTotalLabel;
@property (nonatomic, strong) NSString *itemTotalText;
@property (nonatomic, strong) UIColor *itemTotalColor;

@property (nonatomic) NSUInteger cardType;

@end
