//
//  SocNetworkApiImpl.h
//  SocNetworksApiResearch
//
//  Created by Mars on 7/24/14.
//  Copyright (c) 2014 C-Mars. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocNetworkApiImpl : NSObject {
    NSString* authURL;
    NSString* token;
    NSString* error;
}

@property (readonly) NSString* token;
@property (readonly) NSString* error;
@property (readwrite) NSString* authURL;

@end
