//
//  UnityBridge.h
//  FollowApps
//
//  Created by Raphaël El Beze on 04/10/2017.
//  Copyright © 2017 Followanalytics. All rights reserved.
//

#import "FAFollowApps.h"

#ifdef __cplusplus
extern "C" {
#endif
    
    void configure(const char* FAID);
    void logEvent(const char* message);
    void registerForPush();
#ifdef __cplusplus
}
#endif
