//
//  BuildConfig.h
//  XCConfigDemo
//
//  Created by Paulo Andrade on 08/04/2018.
//  Copyright © 2018 Paulo Andrade. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ReleaseType) {
    ReleaseTypeDebug = DEBUG_RELEASE,
    ReleaseTypeBeta = BETA_RELEASE,
    ReleaseTypeAppStore = APPSTORE_RELEASE,
};


@interface BuildConfig : NSObject

@property(class, nonatomic, readonly) BuildConfig *currentConfig;

@property (strong, readonly) NSString *apiToken;
@property (readonly) ReleaseType releaseType;
@property (strong, readonly) NSString *releaseName;
@property (readonly) BOOL automaticallySendCrashReports;

@end

NS_ASSUME_NONNULL_END



// throw errors if we're missing any macro definition
#ifndef RELEASE_TYPE
#error "RELEASE_TYPE preprocessor macro must be defined"
#endif

#ifndef DEBUG_RELEASE
#error "DEBUG_RELEASE preprocessor macro must be defined"
#endif

#ifndef BETA_RELEASE
#error "BETA_RELEASE preprocessor macro must be defined"
#endif

#ifndef APPSTORE_RELEASE
#error "APPSTORE_RELEASE preprocessor macro must be defined"
#endif
