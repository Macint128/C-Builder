#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (strong) NSWindow *window;
@property (strong) NSTextView *textView;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // 윈도우 생성
    self.window = [[NSWindow alloc]
        initWithContentRect:NSMakeRect(0, 0, 400, 300)
                  styleMask:(NSWindowStyleMaskTitled |
                             NSWindowStyleMaskClosable |
                             NSWindowStyleMaskResizable)
                    backing:NSBackingStoreBuffered
                      defer:NO];
    [self.window setTitle:@"🍫 CocoaCraft"];
    [self.window center];
    [self.window makeKeyAndOrderFront:nil];
    
    // 텍스트 뷰
    self.textView = [[NSTextView alloc] initWithFrame:self.window.contentView.bounds];
    self.textView.string = @"🪄 코코아 레시피\n\n1. 따뜻한 우유 200ml\n2. 코코아 파우더 2스푼\n3. 설탕 약간\n4. 마시멜로 하나 던지기 🍬\n\n➡️ 저어주고 마시면 완성!";
    self.textView.editable = NO;
    [self.textView setFont:[NSFont systemFontOfSize:16]];
    [self.window.contentView addSubview:self.textView];
    
    // 버튼
    NSButton *drinkButton = [[NSButton alloc] initWithFrame:NSMakeRect(150, 20, 100, 40)];
    [drinkButton setTitle:@"마시기 ☕️"];
    [drinkButton setButtonType:NSButtonTypeMomentaryPushIn];
    [drinkButton setBezelStyle:NSBezelStyleRounded];
    [drinkButton setTarget:self];
    [drinkButton setAction:@selector(drinkCocoa)];
    [self.window.contentView addSubview:drinkButton];
}

- (void)drinkCocoa {
    self.textView.string = @"(ゴクゴク...) 으으 따뜻해~ ☺️🍫";
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSApplication *app = [NSApplication sharedApplication];
        AppDelegate *delegate = [AppDelegate new];
        [app setDelegate:delegate];
        [app run];
    }
    return 0;
}
