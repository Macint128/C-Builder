#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (strong) NSWindow *window;
@property (strong) NSTextField *label;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // 1. 윈도우 생성
    self.window = [[NSWindow alloc] initWithContentRect:NSMakeRect(0, 0, 400, 200)
                                              styleMask:(NSWindowStyleMaskTitled |
                                                         NSWindowStyleMaskClosable |
                                                         NSWindowStyleMaskResizable)
                                                backing:NSBackingStoreBuffered
                                                  defer:NO];
    [self.window setTitle:@"Cocoa Example"];
    [self.window center];
    
    // 2. 버튼 생성
    NSButton *button = [[NSButton alloc] initWithFrame:NSMakeRect(150, 100, 100, 30)];
    [button setTitle:@"Click Me"];
    [button setButtonType:NSButtonTypeMomentaryPushIn];
    [button setBezelStyle:NSBezelStyleRounded];
    [button setTarget:self];
    [button setAction:@selector(buttonClicked:)];
    [self.window.contentView addSubview:button];
    
    // 3. 라벨 생성
    self.label = [[NSTextField alloc] initWithFrame:NSMakeRect(100, 50, 200, 30)];
    [self.label setStringValue:@""];
    [self.label setBezeled:NO];
    [self.label setDrawsBackground:NO];
    [self.label setEditable:NO];
    [self.label setSelectable:NO];
    [self.label setAlignment:NSTextAlignmentCenter];
    [self.window.contentView addSubview:self.label];
    
    [self.window makeKeyAndOrderFront:nil];
}

// 버튼 클릭 시 동작
- (void)buttonClicked:(id)sender {
    [self.label setStringValue:@"Hello, World!"];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSApplication *app = [NSApplication sharedApplication];
        AppDelegate *delegate = [[AppDelegate alloc] init];
        [app setDelegate:delegate];
        [app run];
    }
    return 0;
}