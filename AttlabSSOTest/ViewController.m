//
//  ViewController.m
//  AttlabSSOTest
//
//  Created by David Arnold on 08/12/2017.
//  Copyright © 2017 David Arnold. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBAction Methods

- (IBAction)makeNetworkRequest:(id)sender {
    
    NSOperationQueue *operationQueue = [NSOperationQueue mainQueue];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:operationQueue];
    
    //perhaps generate a guid and append to the URL to prevent caching ?
    NSUUID *uuid = [[NSUUID alloc]init];
    
    NSString *urlString = [NSString stringWithFormat:@"http://attts-sql2008.attlab.sw.rim.net/Test/userinfo.aspx?randomGuid=%@",[uuid UUIDString]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      NSLog(@"Asynchronous NSURLSessionDataTask completionHandler");
                                  }];
    
    [task resume];
}

#pragma mark - Instance Methods

- (void)displayAlert:(NSString*)message {
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Alert"
                                 message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* dismissButton = [UIAlertAction
                                    actionWithTitle:@"Dismiss"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                        //Handle your yes please button action here
                                    }];
    
    [alert addAction:dismissButton];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - NSURLSession Delegate Methods

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler {
    NSLog(@"task challenge");
}

- (void) URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler {
    NSLog(@"Session challenge");
}




@end
