//
//  VKApi.h
//  SocNetworksApiResearch
//
//  Created by Mars on 7/23/14.
//  Copyright (c) 2014 C-Mars. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SocNetworkApi.h"
#import "SocNetworkApiImpl.h"

@interface VKApi : SocNetworkApiImpl<SocNetworkApi>

//- (NSString*) startAuthURL;
@property (readonly, getter = startAuthURL) NSString* startAuthURL;
- (AuthResult) authResult:(NSString*)resultURL;

// Base operations
- (void) sendMessage:(NSString*) message;
- (void) sendToWall:(NSInteger)friendId :(NSString*)message :(NSString*)imageURL;
- (void) sendToMyWall:(NSString*)message :(NSString*)imageURL;
- (NSMutableArray*) getFriends;

// Additional
- (NSInteger) getLikesCountForWallPost:(NSInteger) postId;

@end
