//
//  VKApi.h
//  SocNetworksApiResearch
//
//  Created by Mars on 7/23/14.
//  Copyright (c) 2014 C-Mars. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SocNetworkApi.h"

@interface VKApi : NSObject<SocNetworkApi> {
    NSString* authString;
    NSString* token;
    NSString* error;
}

- (NSString*) startAuthURL;
- (BOOL) authResult:(NSString*)resultURL;
@property (readonly) NSString* token;
@property (readonly) NSString* error;

//- (NSMutableArray*) getFriends;
//- (BOOL) wallPost:(NSString*)title :(NSString*)message :(UIImage*)image;
//- (NSInteger) getLikesForWallPost:(NSInteger) postId;

@end
