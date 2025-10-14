#import <Cocoa/Cocoa.h>

@interface CalcApp : NSObject
@property (strong) NSTextField *display;
@property double currentValue;
@property double storedValue;
@property NSString *currentOp;
@end

@implementation CalcApp

- (void)numberPressed:(NSButton *)sender {
    NSString *num = sender.title;
    if ([self.display.stringValue isEqualToString:@"0"]) {
        [self.display setStringValue:num];
    } else {
        [self.display setStringValue:[self.display.stringValue stringByAppendingString:num]];
    }
}

- (void)operationPressed:(NSButton *)sender {
    self.storedValue = [self.display.stringValue doubleValue];
    self.currentOp = sender.title;
    [self.display setStringValue:@"0"];
}

- (void)equalsPressed:(NSButton *)sender {
    double val = [self.display.stringValue doubleValue];
    double result = 0;
    
    if ([self.currentOp isEqualToString:@"+"]) result = self.storedValue + val;
    else if ([self.currentOp isEqualToString:@"-"]) result = self.storedValue - val;
    else if ([self.currentOp isEqualToString:@"×"]) result = self.storedValue * val;
    else if ([self.currentOp isEqualToString:@"÷"]) result = self.storedValue / val;
    
    [self.display setStringValue:[NSString stringWithFormat:@"%g", result]];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSApplication *app = [NSApplication sharedApplication];

        // 메뉴바 Cmd+Q
        NSMenu *mainMenu = [[NSMenu alloc] init];
        NSMenuItem *appMenuItem = [[NSMenuItem alloc] init];
        [mainMenu addItem:appMenuItem];
        [app setMainMenu:mainMenu];
        NSMenu *appMenu = [[NSMenu alloc] init];
        NSString *appName = [[NSProcessInfo processInfo] processName];
        NSMenuItem *quitItem = [[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:@"Quit %@", appName]
                                                          action:@selector(terminate:)
                                                   keyEquivalent:@"q"];
        [appMenu addItem:quitItem];
        [appMenuItem setSubmenu:appMenu];

        // 윈도우
        NSWindow *window = [[NSWindow alloc] initWithContentRect:NSMakeRect(0,0,250,300)
                                                       styleMask:(NSWindowStyleMaskTitled |
                                                                  NSWindowStyleMaskClosable)
                                                         backing:NSBackingStoreBuffered
                                                           defer:NO];
        [window setTitle:@"준호 계산기"];
        [window center];

        CalcApp *calc = [[CalcApp alloc] init];

        // 디스플레이
        calc.display = [[NSTextField alloc] initWithFrame:NSMakeRect(20, 240, 210, 40)];
        [calc.display setStringValue:@"0"];
        [calc.display setEditable:NO];
        [calc.display setBezeled:YES];
        [calc.display setAlignment:NSTextAlignmentRight];
        [[window contentView] addSubview:calc.display];

        NSArray *nums = @[@"7",@"8",@"9",@"4",@"5",@"6",@"1",@"2",@"3",@"0"];
        NSArray *ops = @[@"+",@"-",@"×",@"÷"];
        int x=20, y=200;
        
        // 숫자 버튼
        for (int i=0; i<nums.count; i++) {
            NSButton *btn = [[NSButton alloc] initWithFrame:NSMakeRect(x, y, 50, 30)];
            [btn setTitle:nums[i]];
            [btn setButtonType:NSButtonTypeMomentaryPushIn];
            [btn setBezelStyle:NSBezelStyleRounded];
            [btn setTarget:calc];
            [btn setAction:@selector(numberPressed:)];
            [[window contentView] addSubview:btn];
            
            x += 60;
            if ((i+1)%3 == 0) { x=20; y -= 40; }
        }

        // 연산 버튼
        x=200; y=200;
        for (NSString *op in ops) {
            NSButton *btn = [[NSButton alloc] initWithFrame:NSMakeRect(x, y, 40, 30)];
            [btn setTitle:op];
            [btn setButtonType:NSButtonTypeMomentaryPushIn];
            [btn setBezelStyle:NSBezelStyleRounded];
            [btn setTarget:calc];
            [btn setAction:@selector(operationPressed:)];
            [[window contentView] addSubview:btn];
            y -= 40;
        }

        // "=" 버튼
        NSButton *eqBtn = [[NSButton alloc] initWithFrame:NSMakeRect(130, 20, 100, 30)];
        [eqBtn setTitle:@"="];
        [eqBtn setButtonType:NSButtonTypeMomentaryPushIn];
        [eqBtn setBezelStyle:NSBezelStyleRounded];
        [eqBtn setTarget:calc];
        [eqBtn setAction:@selector(equalsPressed:)];
        [[window contentView] addSubview:eqBtn];

        [window makeKeyAndOrderFront:nil];
        [app run];
    }
    return 0;
}
