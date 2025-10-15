#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSApplication *app = [NSApplication sharedApplication];

        // 윈도우 생성
        NSRect frame = NSMakeRect(100, 100, 400, 200);
        NSWindow *window = [[NSWindow alloc]
            initWithContentRect:frame
                      styleMask:(NSWindowStyleMaskTitled |
                                 NSWindowStyleMaskClosable |
                                 NSWindowStyleMaskResizable)
                        backing:NSBackingStoreBuffered
                          defer:NO];
        [window setTitle:@"☕️ Hello Cocoa!"];
        [window makeKeyAndOrderFront:nil];

        // 라벨 추가
        NSTextField *label = [[NSTextField alloc] initWithFrame:NSMakeRect(130, 80, 140, 40)];
        [label setStringValue:@"Hello, Cocoa!"];
        [label setBezeled:NO];
        [label setDrawsBackground:NO];
        [label setEditable:NO];
        [label setSelectable:NO];
        [[window contentView] addSubview:label];

        // 종료 단축키 Command + Q 동작 활성화
        [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
        [NSApp activateIgnoringOtherApps:YES];
        [app run];
    }
    return 0;
}