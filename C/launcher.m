#import <Cocoa/Cocoa.h>

@interface ButtonHandler : NSObject
- (void)sayHello:(id)sender;
@end

@implementation ButtonHandler
- (void)sayHello:(id)sender {
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"Hello, 준호!"];
    [alert runModal];
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSApplication *app = [NSApplication sharedApplication];

        // -----------------------------
        // 메뉴바 생성 (커맨드+Q 활성화)
        // -----------------------------
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

        // -----------------------------
        // 윈도우 생성
        // -----------------------------
        NSWindow *window = [[NSWindow alloc] initWithContentRect:NSMakeRect(0,0,300,150)
                                                       styleMask:(NSWindowStyleMaskTitled |
                                                                  NSWindowStyleMaskClosable |
                                                                  NSWindowStyleMaskResizable)
                                                         backing:NSBackingStoreBuffered
                                                           defer:NO];
        [window setTitle:@"준호의 예제"];
        [window center];

        ButtonHandler *handler = [[ButtonHandler alloc] init];

        // 버튼 1
        NSButton *button1 = [[NSButton alloc] initWithFrame:NSMakeRect(50, 50, 80, 30)];
        [button1 setTitle:@"안녕"];
        [button1 setButtonType:NSButtonTypeMomentaryPushIn];
        [button1 setBezelStyle:NSBezelStyleRounded];
        [button1 setTarget:handler];
        [button1 setAction:@selector(sayHello:)];
        [[window contentView] addSubview:button1];

        // 버튼 2
        NSButton *button2 = [[NSButton alloc] initWithFrame:NSMakeRect(170, 50, 80, 30)];
        [button2 setTitle:@"닫기"];
        [button2 setButtonType:NSButtonTypeMomentaryPushIn];
        [button2 setBezelStyle:NSBezelStyleRounded];
        [button2 setTarget:app];
        [button2 setAction:@selector(terminate:)];
        [[window contentView] addSubview:button2];

        [window makeKeyAndOrderFront:nil];
        [app run];
    }
    return 0;
}
