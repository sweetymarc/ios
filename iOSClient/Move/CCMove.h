//
//  CCMove.h
//  Crypto Cloud Technology Nextcloud
//
//  Created by Marino Faggiana on 04/09/14.
//  Copyright (c) 2014 TWS. All rights reserved.
//
//  Author Marino Faggiana <m.faggiana@twsweb.it>
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

#import <UIKit/UIKit.h>

#import "TWMessageBarManager.h"
#import "CCBKPasscode.h"
#import "CCUtility.h"
#import "CCCoreData.h"
#import "OCNetworking.h"
#import "CCHud.h"

#ifdef CC
#import "DBnetworking.h"

@protocol CCMoveDelegate;

@interface CCMove : UITableViewController <UIAlertViewDelegate, UITableViewDelegate, OCNetworkingDelegate, DBnetworkingDelegate, BKPasscodeViewControllerDelegate>
#endif

#ifdef NC
@protocol CCMoveDelegate;

@interface CCMove : UITableViewController <UIAlertViewDelegate, UITableViewDelegate, OCNetworkingDelegate, BKPasscodeViewControllerDelegate>
#endif

@property (nonatomic, weak) id <CCMoveDelegate> delegate;
@property (nonatomic, strong) NSOperationQueue *networkingOperationQueue;
@property (nonatomic, strong) NSArray *selectedMetadatas;
@property BOOL onlyClearDirectory;

@property (nonatomic, strong) NSString *localServerUrl;
@property (nonatomic, strong) CCMetadata *passMetadata;

//BKPasscodeViewController
@property (nonatomic) NSUInteger failedAttempts;
@property (nonatomic, strong) NSDate *lockUntilDate;

// Color
@property (nonatomic, strong) UIColor *barTintColor;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *tintColorTitle;

@property (nonatomic, weak) UIBarButtonItem *cancel;
@property (nonatomic, weak) UIBarButtonItem *move;

@end

@protocol CCMoveDelegate <NSObject>

@optional

- (void)move:(NSString *)serverUrlTo title:(NSString *)title selectedMetadatas:(NSArray *)selectedMetadatas;

@end
