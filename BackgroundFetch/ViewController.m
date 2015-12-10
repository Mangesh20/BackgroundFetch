//
//  ViewController.m
//  BackgroundFetch
//
//  Created by Mangesh on 08/12/15.
//  Copyright © 2015 Mangesh  Tekale. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    dispatch_queue_t  bgQueue;
    NSOperationQueue *backgrondQueue;
}

@property (strong, nonatomic) IBOutlet UILabel *label;
@property (assign, nonatomic) UIBackgroundTaskIdentifier task;
@property (strong, nonatomic) IBOutlet UILabel *lbl2;
@property (strong, nonatomic) IBOutlet UILabel *lbl3;
@property (strong, nonatomic) IBOutlet UILabel *lbl4;
@property (strong, nonatomic) IBOutlet UILabel *lbl5;
@property (strong, nonatomic) IBOutlet UILabel *lbl6;
@property (strong, nonatomic) IBOutlet UILabel *lbl7;
@property (strong, nonatomic) IBOutlet UILabel *lbl8;
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

- (IBAction)btnPause:(id)sender {
    if ( backgrondQueue.isSuspended) {
        [backgrondQueue setSuspended:NO];
    } else {
        [backgrondQueue setSuspended:YES];
    }
}

- (IBAction)btnTapped:(id)sender {
  /*
     bgQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(bgQueue, ^{
        [self bgTask1];
    });
    dispatch_async(bgQueue, ^{
        [self bgTask2];
    });
    dispatch_async(bgQueue, ^{
        [self bgTask3];
    });
    dispatch_async(bgQueue, ^{
        [self bgTask4];
    });
    dispatch_async(bgQueue, ^{
        [self bgTask5];
    });
    dispatch_async(bgQueue, ^{
        [self bgTask6];
    });
    dispatch_async(bgQueue, ^{
        [self bgTask7];
    });
    dispatch_async(bgQueue, ^{
        [self bgTask8];
    });
*/
    
    backgrondQueue = [[NSOperationQueue alloc] init];
    NSInvocationOperation *op1 =[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(bgTask1) object:nil];
    
    NSBlockOperation *opBlock = [[NSBlockOperation alloc] init];
    [opBlock addExecutionBlock:^{
        [self bgTask2];
    }];
    
    NSInvocationOperation *op3 =[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(bgTask3) object:nil];
    NSInvocationOperation *op4 =[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(bgTask4) object:nil];
    NSInvocationOperation *op5 =[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(bgTask5) object:nil];
    NSInvocationOperation *op6 =[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(bgTask6) object:nil];
    NSInvocationOperation *op7 =[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(bgTask7) object:nil];
    NSInvocationOperation *op8 =[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(bgTask8) object:nil];
    
    [op1 addDependency:opBlock];
    [op8 addDependency:op1];
    [backgrondQueue addOperation:op1];
    [backgrondQueue addOperation:opBlock];
    [backgrondQueue addOperation:op3];
    [backgrondQueue addOperation:op4];
    [backgrondQueue addOperation:op5];
    [backgrondQueue addOperation:op6];
    [backgrondQueue addOperation:op7];
    [backgrondQueue addOperation:op8];
    
    op1.completionBlock = ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            [[[UIAlertView alloc] initWithTitle:@"Operation 1 Completed!" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];

        });
    };
    
}

- (void)print {
    NSLog(@"");
}
NSInteger loopcount = 50;
CGFloat timeInterval = 0.1;

- (void)bgTask1 {
    
        for (int i = 0; i < loopcount; i++) {
            [NSThread sleepForTimeInterval:timeInterval];
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.label.text = [NSString stringWithFormat:@"%@",@(i)];

            });
       
        }
}
- (void)bgTask2 {
    
    for (int i = 0; i < loopcount; i++) {
        [NSThread sleepForTimeInterval:timeInterval];
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.lbl2.text = [NSString stringWithFormat:@"%@",@(i)];
        });
    }
}
- (void)bgTask3 {
    
    for (int i = 0; i < loopcount; i++) {
        [NSThread sleepForTimeInterval:timeInterval];
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.lbl3.text = [NSString stringWithFormat:@"%@",@(i)];
        });
    }
}
- (void)bgTask4 {
    
    for (int i = 0; i < loopcount; i++) {
        [NSThread sleepForTimeInterval:timeInterval];
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.lbl4.text = [NSString stringWithFormat:@"%@",@(i)];
        });
    }
}
- (void)bgTask5 {
    
    for (int i = 0; i < loopcount; i++) {
        [NSThread sleepForTimeInterval:timeInterval];
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.lbl5.text = [NSString stringWithFormat:@"%@",@(i)];
        });
    }
}
- (void)bgTask6 {
    
    for (int i = 0; i < loopcount; i++) {
        [NSThread sleepForTimeInterval:timeInterval];
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.lbl6.text = [NSString stringWithFormat:@"%@",@(i)];
        });
    }
}
- (void)bgTask7 {
    
    for (int i = 0; i < loopcount; i++) {
        [NSThread sleepForTimeInterval:timeInterval];
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.lbl7.text = [NSString stringWithFormat:@"%@",@(i)];
        });
    }
}
- (void)bgTask8 {
    
    for (int i = 0; i < loopcount; i++) {
        [NSThread sleepForTimeInterval:timeInterval];
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.lbl8.text = [NSString stringWithFormat:@"%@",@(i)];
        });
    }
}
@end
