# TimeEngine-iOS
This is time listener demo for clock application.

I use <a href="https://github.com/belkevich/nsdate-calendar">NSDate(Categories) from Alexey Belkevich</a>. Thank you!

<h2>Usage</h2>
#### Include header at top.
```objective-c
#import "TimeEngine.h"
```

#### Set up and start timer.
```objective-c
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [TimeEngine shared].changeType = tType_second;      // 초 단위로 호출      timeChanged:changeType: 호출
    [TimeEngine shared].afterInterval = .1f;            // 시간이 바뀌기 직전에  timeWillChange:changeType:afterInterval: 를 호출
    [TimeEngine shared].delegate = self;                // delegate를 설정
    [[TimeEngine shared] MAKE_TIMER];                   // 타이머 시작
}
```

#### Implement delegate.
```objective-c
#pragma mark - Time Engine Delegate
- (void) timeWillChange:(NSDate *)date changeType:(enum TimeChangeType)type afterInterval:(float)afterT {
    NSLog(@"time will change after %f", afterT);
}
- (void) timeChanged:(NSDate *)date changeType:(enum TimeChangeType)type {
    NSLog(@"current time is %@, change type : %zd", date, type);
}
```
