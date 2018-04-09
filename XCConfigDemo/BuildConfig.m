//
//  BuildConfig.m
//  XCConfigDemo
//
//  Created by Paulo Andrade on 08/04/2018.
//  Copyright © 2018 Paulo Andrade. All rights reserved.
//

#import "BuildConfig.h"

#define QUOTE(name) #name
#define STR(macro) QUOTE(macro)

#ifndef API_TOKEN
#error "API_TOKEN preprocessor macro must be defined"
#else
#define API_TOKEN_VALUE STR(API_TOKEN)
#endif

#ifndef AUTO_SEND_CRASHES
#error "AUTO_SEND_CRASHES preprocessor macro must be defined"
#endif


@interface BuildConfig ()

@property (strong, readwrite) NSString *apiToken;
@property (readwrite) ReleaseType releaseType;
@property (strong, readwrite) NSString *releaseName;
@property (readwrite) BOOL automaticallySendCrashReports;

@end

@implementation BuildConfig

+ (instancetype)currentConfig
{
    static dispatch_once_t onceToken;
    static BuildConfig *_config;
    dispatch_once(&onceToken, ^{
        _config = [[BuildConfig alloc] init];
        _config.apiToken = @""API_TOKEN_VALUE;
        _config.releaseType = RELEASE_TYPE;
        switch (_config.releaseType) {
            case ReleaseTypeDebug:
                _config.releaseName = @"Debug";
                break;
            case ReleaseTypeBeta:
                _config.releaseName = @"Beta";
                break;
            case ReleaseTypeAppStore:
                _config.releaseName = @"AppStore";
                break;
        }
        _config.automaticallySendCrashReports = AUTO_SEND_CRASHES;
        
    });
    return _config;
}


@end
