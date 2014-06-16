//
//  SImpleTableCell.h
//  SimpleTable
//
//  Created by Manohar on 11/06/14.
//  Copyright (c) 2014 Manohar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SImpleTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *prepTimeLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;


@end
