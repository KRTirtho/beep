#import "BeepPlugin.h"
#if __has_include(<beep/beep-Swift.h>)
#import <beep/beep-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "beep-Swift.h"
#endif

@implementation BeepPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBeepPlugin registerWithRegistrar:registrar];
}
@end
