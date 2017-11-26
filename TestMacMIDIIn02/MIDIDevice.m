//
//  MIDIDevice.m
//  TestMacMIDIIn01
//
//  Created by John Carlson on 6/4/17.
//  Copyright © 2017 John Carlson. All rights reserved.
//

#import "MIDIDevice.h"

@implementation MIDIDevice
//
-(id) init
{
    self.deviceRef = 0;
    self.deviceId = @"";
    self.name = @"";
    self.displayName = @"";
    //
    self.entityList  = [NSMutableArray array];
    self.qtyOfEntities = 0;
    //
    return self;
}
//
//
-(id) initWithMIDIDeviceRef: (MIDIDeviceRef) device
{
    self.deviceRef = device;
    //
    self.entityList  = [NSMutableArray array];
    self.qtyOfEntities = 0;
    //
    CFStringRef cfs = CFSTR(".");
    _Nullable CFStringRef *str = &cfs;
    //
    self.status = MIDIObjectGetStringProperty(self.deviceRef, kMIDIPropertyDeviceID, str);
    if (self.status != noErr)
    {
        self.deviceId = @"";
        //NSLog(@"\nError getting MIDI device ID");
        //return;
    }
    else
    {
        self.deviceId = (NSString *)CFBridgingRelease(str);
        //NSLog(@"\n\nDevice ID = %@",self.deviceId);
    }
    //
    //
    self.status = MIDIObjectGetStringProperty(self.deviceRef, kMIDIPropertyName, str);
    if (self.status != noErr)
    {
        //NSLog(@"\nError getting MIDI property name");
        self.name = @"";
        //return;
    }
    else
    {
        self.name = (__bridge NSString *)*str;
        //NSLog(@"\nName = %@",self.name);
    }
    //
    //
    self.status = MIDIObjectGetStringProperty(self.deviceRef, kMIDIPropertyDisplayName, str);
    if (self.status != noErr)
    {
        self.displayName = @"";
        //NSLog(@"\nError getting MIDI display name");
        //return;
    }
    else
    {
        self.displayName = (__bridge NSString *)*str;
        //NSLog(@"\nName = %@",self.displayName);
    }
    //
    //
    self.qtyOfEntities = MIDIDeviceGetNumberOfEntities(self.deviceRef);
    //
    for (ItemCount i = 0; i < self.qtyOfEntities; i++)
    {
        MIDIEntity *entity = [[MIDIEntity alloc] initWithMIDIEntityRef: MIDIDeviceGetEntity(self.deviceRef, i)];
        //
        [self.entityList addObject: entity];
    }
    //
    //
    return self;
}
//
@end
