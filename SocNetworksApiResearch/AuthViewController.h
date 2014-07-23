//
//  AuthViewController.h
//  SocNetworksApiResearch
//
//  Created by Mars on 7/23/14.
//  Copyright (c) 2014 C-Mars. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VKApi.h"
@interface AuthViewController : UIViewController<UIWebViewDelegate> {
    UIWebView *authView;
    UIActivityIndicatorView *indicator;
    UITextView* textError;
}

@property (nonatomic, retain) IBOutlet UIWebView *authView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *indicator;
@property (nonatomic, retain) IBOutlet UITextView* textError;

@end
