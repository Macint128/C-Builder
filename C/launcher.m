#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (strong) NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // 윈도우 생성
    self.window = [[NSWindow alloc] initWithContentRect:NSMakeRect(0, 0, 300, 200)
                                              styleMask:(NSWindowStyleMaskTitled |
                                                         NSWindowStyleMaskClosable |
                                                         NSWindowStyleMaskResizable)
                                                backing:NSBackingStoreBuffered
                                                  defer:NO];
    [self.window setTitle:@"Hello Cocoa"];
    [self.window center];

    // 버튼 생성
    NSButton *button = [[NSButton alloc] initWithFrame:NSMakeRect(100, 80, 100, 40)];
    [button setTitle:@"Click Me"];
    [button setButtonType:NSButtonTypeMomentaryPushIn];
    [button setBezelStyle:NSBezelStyleRounded];

    // 버튼 액션
    [button setTarget:self];
    [button setAction:@selector(buttonClicked:)];

    [self.window.contentView addSubview:button];
    [self.window makeKeyAndOrderFront:nil];
}

// 버튼 클릭 시 호출
- (void)buttonClicked:(id)sender {
    NSLog(@"🎉 Hello, Cocoa World!");
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        AppDelegate *delegate = [[AppDelegate alloc] init];
        NSApplication *app = [NSApplication sharedApplication];
        [app setDelegate:delegate];
        [app run];
    }
    return 0;
}