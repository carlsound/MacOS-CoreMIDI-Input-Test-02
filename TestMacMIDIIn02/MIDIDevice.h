//
//  MIDIDevice.h
//  TestMacMIDIIn01
//
//  Created by John Carlson on 6/4/17.
//  Copyright © 2017 John Carlson. All rights reserved.
//

#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMIDI.h>
//
#import "MIDIEntity.h"

@interface MIDIDevice : NSObject
{
    
}
//
@property MIDIDeviceRef deviceRef;
@property NSString *deviceId;
@property NSString *name;
@property NSString *displayName;
//
@property NSMutableArray *entityList;
@property ItemCount qtyOfEntities;
//
@property OSStatus status;
//
-(id) init;
-(id) initWithMIDIDeviceRef: (MIDIDeviceRef) device;
//
@end
