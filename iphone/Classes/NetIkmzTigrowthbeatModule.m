/**
 * TiGrowthbeat
 *
 * Created by Your Name
 * Copyright (c) 2016 Your Company. All rights reserved.
 */

#import "NetIkmzTigrowthbeatModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "Growthbeat.h"

@implementation NetIkmzTigrowthbeatModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"d47182a8-6a49-43f3-b0fc-beb499cdec71";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"net.ikmz.tigrowthbeat";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)example:(id)args
{
	// example method
	return @"hello world";
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)setExampleProp:(id)value
{

	// example property setter
}

-(void)init:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary)
    NSString * applicationId = [TiUtils stringValue:@"applicationId" properties:args def:nil];
    NSString * credentialId = [TiUtils stringValue:@"credentialId" properties:args def:nil];
    NSLog(@"[INFO] Init Growthbeat: %@,%@", applicationId, credentialId);

    // Growthbeat SDKの初期化
    [[GrowthPush sharedInstance] initializeWithApplicationId:applicationId credentialId:credentialId environment:kGrowthPushEnvironment];

    // deviceTagの取得
    [[GrowthPush sharedInstance] setDeviceTags];

    // Launchイベントの取得
    NSLog(@"[INFO] %@ Track Launch event",self);
    [[GrowthPush sharedInstance] trackEvent:@"Launch"];
}

-(void)setDeviceToken:(id)args
{
    NSString * deviceToken = [TiUtils stringValue:@"deviceToken" properties:args def:nil];

    NSLog(@"[INFO] Send GrowthPush token", self);
    [[GrowthPush sharedInstance] setDeviceToken:deviceToken];
}

@end
