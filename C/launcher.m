#import <Cocoa/Cocoa.h>

// 버튼 클릭 액션 처리용 클래스
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
        
        NSWindow *window = [[NSWindow alloc] initWithContentRect:NSMakeRect(0,0,300,150)
                                                       styleMask:(NSWindowStyleMaskTitled |
                                                                  NSWindowStyleMaskClosable |
                                                                  NSWindowStyleMaskResizable)
                                                         backing:NSBackingStoreBuffered
                                                           defer:NO];
        [window setTitle:@"준호의 예제"];
        [window center];

        // 버튼 처리 객체
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
