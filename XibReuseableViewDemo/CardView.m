//
//  CardView.m
//  CitizenCardPlartform
//
//  Created by Travel Chu on 15/12/22.
//  Copyright © 2015年 TravelChu. All rights reserved.
//

#import "CardView.h"

@interface CardView ()
@property BOOL isCardViewLoadedFromNib;
@end

@implementation CardView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)loadCardViewFromNib {
    if (!self.isCardViewLoadedFromNib) {
        [[NSBundle mainBundle] loadNibNamed:@"CardView" owner:self options:nil];
        [self addSubview:self.view];
        self.view.layer.borderWidth = 0.5;
        self.view.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.view.layer.cornerRadius = 5.0;

        self.isCardViewLoadedFromNib = YES;
    }
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self loadCardViewFromNib];
    }
    return self;
}

//
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadCardViewFromNib];
    }
    return self;
}

//
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self loadCardViewFromNib];
    }
    return self;
}

@end
