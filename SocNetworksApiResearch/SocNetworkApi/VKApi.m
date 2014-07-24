//
//  VKApi.m
//  SocNetworksApiResearch
//
//  Created by Mars on 7/23/14.
//  Copyright (c) 2014 C-Mars. All rights reserved.
//

#import "VKApi.h"
#import "SocNetworkApi.h"
#import "StringBetween.h"
@implementation VKApi

NSString* CLIENT_ID = @"4472085";
NSString* SCOPE = @"friends,wall,messages,audio";
NSString* AUTH_URL_TEMPLATE = @"https://api.vkontakte.ru/oauth/authorize?client_id=%@&scope=%@&redirect_uri=blank.html&response_type=token";

@synthesize startAuthURL;

- (id)init
{
    self = [super init];
    if (self)
    {
        self.authURL = [NSString stringWithFormat:AUTH_URL_TEMPLATE, CLIENT_ID, SCOPE];
    }
    return self;
}

- (NSString*) startAuthURL {
    return authURL;
}

// Callback that is called on auth url load finished
- (AuthResult) authResult:(NSString*)resultURL {
if ([resultURL rangeOfString:@"access_token"].location != NSNotFound) {
    token = [resultURL getStringBetweenString:@"access_token" andString:@"&"]; //извлекаем из ответа token
    return ESUCCESS;
} else if ([resultURL rangeOfString:@"error"].location != NSNotFound) {
    error = resultURL;
    return EERROR;
};
return EUNKNOWN;
}

// Base operations
//- (void) sendMessage:(NSString*) message;
//- (void) sendToWall:(NSInteger)friendId :(NSString*)message :(NSString*)imageURL;
//- (void) sendToMyWall:(NSString*)message :(NSString*)imageURL;
//- (NSMutableArray*) getFriends;

// Additional
//- (NSInteger) getLikesCountForWallPost:(NSInteger) postId;

@end
