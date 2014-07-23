//
//  VKApi.m
//  SocNetworksApiResearch
//
//  Created by Mars on 7/23/14.
//  Copyright (c) 2014 C-Mars. All rights reserved.
//

#import "VKApi.h"

@implementation VKApi

NSString* CLIENT_ID = @"4472085";
NSString* SCOPE = @"friends,wall,messages,audio";
NSString* AUTH_URL_TEMPLATE = @"https://api.vkontakte.ru/oauth/authorize?client_id=%@&scope=%@&redirect_uri=blank.html&response_type=token";


- (id)init
{
    self = [super init];
    if (self)
    {
        authString = [NSString stringWithFormat:AUTH_URL_TEMPLATE, CLIENT_ID, SCOPE];
    }
    return self;
}

- (BOOL) startAuth:(UIWebView*) authView :(UITextView*)textError {
    authView.hidden = YES;
    textError.hidden = YES;
    
    NSURL *authURL = [[NSURL alloc] initWithString:authString];
    NSURLRequest *authRequest = [[NSURLRequest alloc] initWithURL:authURL];
    [authView loadRequest:authRequest];
}

@end
