//
//  ViewController.h
//  AttlabSSOTest
//
//  Created by David Arnold on 08/12/2017.
//  Copyright © 2017 David Arnold. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLSessionDelegate, NSURLSessionTaskDelegate>

-(IBAction)makeNetworkRequest:(id)sender;
- (void)displayAlert:(NSString*)message;

@end

