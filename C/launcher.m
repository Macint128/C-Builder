#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (strong) NSWindow *window;
@property (strong) NSButton *button;
@end

@implementation AppDelegate
- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    NSRect frame = NSMakeRect(0, 0, 300, 200);
    self.window = [[NSWindow alloc] initWithContentRect:frame
                                               styleMask:(NSWindowStyleMaskTitled |
                                                          NSWindowStyleMaskClosable |
                                                          NSWindowStyleMaskResizable)
                                                 backing:NSBackingStoreBuffered
                                                   defer:NO];
    [self.window setTitle:@"Cocoa Demo"];
    [self.window center];

    self.button = [[NSButton alloc] initWithFrame:NSMakeRect(100, 80, 100, 40)];
    [self.button setTitle:@"Click me!"];
    [self.button setTarget:self];
    [self.button setAction:@selector(showMessage)];
    [[self.window contentView] addSubview:self.button];

    [self.window makeKeyAndOrderFront:nil];
}

- (void)showMessage {
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"Hello, macOS!"];
    [alert runModal];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES; // 창 닫으면 앱 종료
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