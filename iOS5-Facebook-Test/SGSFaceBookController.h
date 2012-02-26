//
//  SGSFaceBookController.h
//  iOS5-Facebook-Test
//
//  Created by Todd Marshall on 2/25/12.
//  Copyright (c) 2012 SunGard Global Services. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <dispatch/dispatch.h>
#import "FBConnect.h"

typedef void (^SGSFBFailureBlock)(NSError * error);
typedef void (^SGSFBLoginSuccessBlock)(NSString * token);
typedef void (^SGSFBLogoutSuccessBlock)(void);
typedef void (^SGSFBFriendRequestSuccessBlock)(NSArray * friends);

@interface SGSFaceBookController : NSObject <FBSessionDelegate, FBRequestDelegate> {
    
    SGSFBFailureBlock loginFailureBlock;
    SGSFBFailureBlock logoutFailureBlock;
    SGSFBFailureBlock friendRequestFailureBlock;
    
    SGSFBLoginSuccessBlock loginSuccessBlock;
    SGSFBLogoutSuccessBlock logoutSuccessBlock;
    SGSFBFriendRequestSuccessBlock friendRequestSuccessBlock;

}

@property (nonatomic, strong) Facebook *facebook;

- (id) initWithAppId:(NSString *) appId;
- (void) loginWithSuccessBlock:(SGSFBLoginSuccessBlock) successBlock withFailureBlock:(SGSFBFailureBlock) failureBlock;
- (void) logoutWithSuccessBlock:(SGSFBLogoutSuccessBlock)successBlock withFailureBlock:(SGSFBFailureBlock) failureBlock;
- (void) requestFriendsWithSuccessBlock:(SGSFBFriendRequestSuccessBlock) successBlock withFailureBlock:(SGSFBFailureBlock) failureBlock;
@end