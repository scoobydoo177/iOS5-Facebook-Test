//
//  SGSAppDelegate.m
//  iOS5-Facebook-Test
//
//  Created by Todd Marshall on 2/25/12.
//  Copyright (c) 2012 SunGard Global Services. All rights reserved.
//

#import "SGSAppDelegate.h"

@implementation SGSAppDelegate

@synthesize window = _window, serviceController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    /*
    // get the main view controller from the story board and register for the notification below
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard"
                                                             bundle: nil];
    SGSViewController * controller = (SGSViewController *) [mainStoryboard 
                                                            instantiateViewControllerWithIdentifier: @"first"];
    [[NSNotificationCenter defaultCenter] addObserver:controller selector:@selector(updateFriendList:) name:@"UpdateFBFriends" object:nil];
    NSLog(@"registered for update notification");
    
    
    // initialize our facebook connection
    self.facebookController = [[SGSFaceBookController alloc] initWithAppId:@"161472237304575"];
    [facebookController loginWithSuccessBlock:(SGSFBLoginSuccessBlock)^(NSString *token) 
    {
        NSLog(@"facebook login succeded.  token = [%@]", token);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateFBFriends" object:self];
    } 
    withFailureBlock:(SGSFBFailureBlock)^(NSError *error) 
    {
        NSLog(@"facebook login failed with error = [%@]", error);
    }];
     */
    
    serviceController = [ExternalServiceController sharedInstance];
    
    /*
    [serviceController 
     updateFacebookFriendsWithSuccessBlock:^(int total, int added, int removed) 
     {
         NSLog(@"facebook friend update successful");
     } 
     withProgressBlock:^(NSString *progressText, BOOL finished) 
     {
         NSLog(@"%@", progressText);
     } 
     withFailureBlock:^(NSError *error) 
     {
         NSLog(@"facebook friend update failed with error = [%@]", error);
     }];
     */
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL) application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"sourceApplication = %@", sourceApplication);
    return [self.serviceController.facebookController.facebook handleOpenURL:url];
}
@end
