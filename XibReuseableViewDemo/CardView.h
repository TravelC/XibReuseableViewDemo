//
//  CardView.h
//  CitizenCardPlartform
//
//  Created by Travel Chu on 15/12/22.
//  Copyright © 2015年 TravelChu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView
@property (strong, nonatomic) IBOutlet UIView *view;

@property (weak, nonatomic) IBOutlet UILabel *cardTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardNoLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardMoneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *numOfOpenedProductLabel;
@property (weak, nonatomic) IBOutlet UILabel *awardRecordLabel;
@property (weak, nonatomic) IBOutlet UIImageView *certificatedImageView;
@property (weak, nonatomic) IBOutlet UILabel *certificatedLabel;
@property (weak, nonatomic) IBOutlet UIButton *certificateButton;
@property (weak, nonatomic) IBOutlet UIButton *modifyCardInfoButton;
@property (weak, nonatomic) IBOutlet UIView *cardTypeBgView;

@end
