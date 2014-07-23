//
//  SocNetworkApi.h
//  SocNetworksApiResearch
//
//  Created by Mars on 7/23/14.
//  Copyright (c) 2014 C-Mars. All rights reserved.
//

#import <Foundation/Foundation.h>

// This is common social network protocol to perform base operations with social networks api

typedef enum {ESUCCESS = 0, EERROR = 1, EUNKNOWN = 2} AuthResult;

@protocol SocNetworkApi

- (NSString*) startAuthURL;
- (BOOL) authResult:(NSString*)resultURL;

- (NSMutableArray*) getFriends;
- (BOOL) wallPost:(NSString*)title :(NSString*)message :(UIImage*)image;
- (NSInteger) getLikesForWallPost:(NSInteger) postId;

@end
