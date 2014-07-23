//
//  VKApi.m
//  SocNetworksApiResearch
//
//  Created by Mars on 7/23/14.
//  Copyright (c) 2014 C-Mars. All rights reserved.
//

#import "VKApi.h"
#import "SocNetworkApi.h"
@implementation VKApi

NSString* CLIENT_ID = @"4472085";
NSString* SCOPE = @"friends,wall,messages,audio";
NSString* AUTH_URL_TEMPLATE = @"https://api.vkontakte.ru/oauth/authorize?client_id=%@&scope=%@&redirect_uri=blank.html&response_type=token";

@synthesize token, error;

- (id)init
{
    self = [super init];
    if (self)
    {
        authString = [NSString stringWithFormat:AUTH_URL_TEMPLATE, CLIENT_ID, SCOPE];
        token = nil;
        error = nil;
    }
    return self;
}

// Authorization process start routine. Displays WebView (authView) to user to provide authorization
- (NSString*) startAuth {
    return authString;
}

// Callback that is called on auth url load finished
- (NSInteger) authResult:(NSString*)resultURL;
    if ([resultURL rangeOfString:@"access_token"].location != NSNotFound) {
        token = [resultURL getStringBetweenString:@"access_token" andString:@"&"]; //извлекаем из ответа token
        return ESUCCESS;
    } else if ([resultURL rangeOfString:@"error"].location != NSNotFound) {
        error = resultURL;
        return EERROR;
    };
    return EUNKNOWN;
}

@end
