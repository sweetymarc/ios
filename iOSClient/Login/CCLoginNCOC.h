//
//  CCLoginNCOC.h
//  Crypto Cloud Technology Nextcloud
//
//  Created by Marino Faggiana on 09/04/15.
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

#import "UIImage+animatedGIF.h"
#import "CCCertificate.h"
#import "OCNetworking.h"

@interface CCLoginNCOC : UIViewController <UITextFieldDelegate, NSURLSessionTaskDelegate, NSURLSessionDelegate, CCCertificateDelegate, OCNetworkingDelegate>

{
    UIAlertView *alertView;
    UIView *rootView;
}

@property (nonatomic, weak) IBOutlet UITextField *user;
@property (nonatomic, weak) IBOutlet UITextField *password;
@property (nonatomic, weak) IBOutlet UITextField *baseUrl;
@property (nonatomic, weak) IBOutlet UIImageView *loadingBaseUrl;

@property (nonatomic, weak) IBOutlet UIButton *login;
@property (nonatomic, weak) IBOutlet UIButton *annulla;
@property (nonatomic, weak) IBOutlet UIButton *toggleVisiblePassword;

@property BOOL modifyOnlyPassword;
@property (nonatomic, strong) NSString *typeCloud;
@property (nonatomic, strong) UIViewController *viewController;

@end
