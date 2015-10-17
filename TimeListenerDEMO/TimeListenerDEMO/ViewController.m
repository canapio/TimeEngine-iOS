//
//  ViewController.m
//  TimeListenerDEMO
//
//  Created by GwakDoyoung on 2015. 10. 17..
//  Copyright © 2015년 GwakDoyoung. All rights reserved.
//

#import "ViewController.h"
#import "TimeEngine.h"

@interface ViewController () <TimeChangeDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [TimeEngine shared].changeType = tType_second;      // 초 단위로 호출      timeChanged:changeType: 호출
    [TimeEngine shared].afterInterval = .1f;            // 시간이 바뀌기 직전에  timeWillChange:changeType:afterInterval: 를 호출
    [TimeEngine shared].delegate = self;                // delegate를 설정
    [[TimeEngine shared] MAKE_TIMER];                   // 타이머 시작
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Time Engine Delegate
- (void) timeWillChange:(NSDate *)date changeType:(enum TimeChangeType)type afterInterval:(float)afterT {
    NSLog(@"time will change after %f", afterT);
}

- (void) timeChanged:(NSDate *)date changeType:(enum TimeChangeType)type {
    NSLog(@"current time is %@, change type : %zd", date, type);
}

@end
