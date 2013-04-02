//
//  CardButton.m
//  ADTestLabs
//
//  Created by dai yun on 12-10-22.
//  Copyright (c) 2012年 alexday. All rights reserved.
//

#import "CardButton.h"

@implementation CardButton

@synthesize cardTitleLabel = _cardTitleLabel;
@synthesize cardTitleText = _cardTitleText;
@synthesize cardTitleColor = _cardTitleColor;

@synthesize cardSubTitleLabel = _cardSubTitleLabel;
@synthesize cardSubTitleText = _cardSubTitleText;
@synthesize cardSubTitleColor = _cardSubTitleColor;


@synthesize scopeLabel = _scopeLabel;
@synthesize scopeText = _scopeText;
@synthesize scopeColor = _scopeColor;
@synthesize itemTotalLabel = _itemTotalLabel;
@synthesize itemTotalText = _itemTotalText;
@synthesize itemTotalColor = _itemTotalColor;

@synthesize cardType = _cardType;

#pragma mark - delloc

/* ARC 不需要显式地调用dealloc 
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
   // [_titleText release], _titleText = nil;
   // [_titleColor release], _titleColor = nil;
   
   //  Custom dealloc methods in ARC do not require a call to [super dealloc]
   // [super dealloc];
}
*/

#pragma mark - Initialization
- (void)setup
{
    // Initialization code
    
    //[self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, 198, 220)];
    
    self.opaque = NO;
 
    self.backgroundColor = [UIColor clearColor];

    [self setBackgroundImage:[UIImage imageNamed:@"notebook-100.png"] forState:UIControlStateNormal];    
    
    //[self setImage:[UIImage imageNamed:@"notebook-100.png"] forState:UIControlStateNormal];
    //self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"notebook-100.png"]];
    
    // NSString *path = [[NSBundle mainBundle] pathForResource:@"icon" ofType:@"png"];
    // myImage = [UIImage imageWithContentsOfFile:path];
 
    
    /* titleLabel */
    self.titleLabel.text = @"";

    /* cardTitleLabel */
    _cardTitleLabel = [[UILabel alloc] init];
    _cardTitleLabel.text = @"";//@"ScaleCard";
    _cardTitleLabel.textColor = UIColorFromRGB(0x3399cc); //[UIColor blackColor];
    _cardTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    _cardTitleLabel.adjustsFontSizeToFitWidth = YES;
    _cardTitleLabel.textAlignment = UITextAlignmentCenter;
    _cardTitleLabel.lineBreakMode = UILineBreakModeWordWrap;
    _cardTitleLabel.numberOfLines = 0;
    _cardTitleLabel.backgroundColor = [UIColor clearColor];
    _cardTitleLabel.frame = CGRectMake(kLeftMargin ,60,160,20);
    [self addSubview:_cardTitleLabel];
    
    /* cardSubTitleLabel */
    _cardSubTitleLabel = [[UILabel alloc] init];
    _cardSubTitleLabel.text = @"";//@"ScaleCard";
    _cardSubTitleLabel.textColor = UIColorFromRGB(0x666666); //[UIColor blackColor];
    _cardSubTitleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:10];
    _cardSubTitleLabel.adjustsFontSizeToFitWidth = YES;
    _cardSubTitleLabel.textAlignment = UITextAlignmentCenter;
    _cardSubTitleLabel.lineBreakMode = UILineBreakModeWordWrap;
    _cardSubTitleLabel.numberOfLines = 0;
    _cardSubTitleLabel.backgroundColor = [UIColor clearColor];
    _cardSubTitleLabel.frame = CGRectMake(kLeftMargin ,85,160,40);
    [self addSubview:_cardSubTitleLabel];
    
    
    
    
    
    
    /* ScopeLabel */
    _scopeLabel = [[UILabel alloc]init];
    _scopeLabel.text = @"";//@"Apply to:";
    _scopeLabel.textColor = UIColorFromRGB(0x666666);
    _scopeLabel.font =  [UIFont fontWithName:@"HelveticaNeue" size:12];
    _scopeLabel.adjustsFontSizeToFitWidth = NO;
    _scopeLabel.textAlignment = UITextAlignmentCenter;
    _scopeLabel.numberOfLines = 1;
    _scopeLabel.backgroundColor = [UIColor clearColor];
    _scopeLabel.frame = CGRectMake(kLeftMargin, 130, 160, 20);
    [self addSubview:_scopeLabel];
    
    /* itemTotalLabel */
    _itemTotalLabel = [[UILabel alloc] init];
    _itemTotalLabel.text = @"";//@"0项";
    _itemTotalLabel.textColor = UIColorFromRGB(0xefefef);
    _itemTotalLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    _itemTotalLabel.adjustsFontSizeToFitWidth = NO;
    _itemTotalLabel.textAlignment = UITextAlignmentCenter;
    _itemTotalLabel.numberOfLines = 1;
    _itemTotalLabel.backgroundColor = [UIColor clearColor];
    _itemTotalLabel.frame = CGRectMake(kLeftMargin, 170, 160, 20);
    [self addSubview:_itemTotalLabel];
    

}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // NSLog(@"initWithFrame");
        [self setup];
    }
    return self;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
     NSLog(@"awakeFromNib");
    [self setup];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super initWithCoder:aDecoder];
    if(self){
        //各种定义，暂时未写
        //NSLog(@"initWithCoder");
        [self setup];
    }
    return self;
    
}

#pragma mark - Set Label Title

 
- (void)setCardTitleText:(NSString *)cardTitleText
{
    /*
    _cardTitleText = cardTitleText;
    _cardTitleLabel.text = _cardTitleText;
    [super setNeedsDisplay];
    */
    [_cardTitleLabel setText:[NSString stringWithFormat:@"%@",cardTitleText]];
    //[super setNeedsDisplay];
}

- (void)setCardTitleColor:(UIColor *)cardTitleColor
{
    _cardTitleLabel.textColor = cardTitleColor;
    
}


- (void)setCardSubTitleText:(NSString *)cardSubTitleText
{
    [_cardSubTitleLabel setText:[NSString stringWithFormat:@"%@",cardSubTitleText]];
}

- (void)setCardSubTitleColor:(UIColor *)cardSubTitleColor
{
    _cardSubTitleLabel.textColor = cardSubTitleColor;
    
}

- (void)setScopeText:(NSString *)scopeText
{
    /*
    _scopeText = scopeText;
    _scopeLabel.text = _scopeText;
    [super setNeedsDisplay];
    */
    
    [_scopeLabel setText:[NSString stringWithFormat:@"级别：%@",scopeText]];
    //[super setNeedsDisplay];
}

- (void)setScopeColor:(UIColor *)scopeColor
{
    _scopeLabel.textColor = scopeColor;
}

- (void)setItemTotalText:(NSString *)itemTotalText
{
    [_itemTotalLabel setText:[NSString stringWithFormat:@"%@项", itemTotalText]];
}

- (void)setItemTotalColor:(UIColor *)itemTotalColor
{
    _itemTotalLabel.textColor = itemTotalColor;
}

- (void)setCardType:(NSUInteger)cardType
{
    switch (cardType) {
        case 0:
            _cardTitleLabel.textColor = UIColorFromRGB(0x3399cc);
            break;
        case 1:
            _cardTitleLabel.textColor = UIColorFromRGB(0x666600);
        default:
            break;
    }
}

#pragma mark - Event

/*
- (void)textChanged:(NSNotification *)notification
{
  
}
*/

#pragma mark - DrawRect

 
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // NSLog(@"drawRect");
    [super drawRect: rect];

}
 

@end
