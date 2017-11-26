//
//  MIDIEndpoint.m
//  TestMacMIDIIn01
//
//  Created by John Carlson on 6/4/17.
//  Copyright © 2017 John Carlson. All rights reserved.
//

#import "MIDIEndpoint.h"

@implementation MIDIEndpoint
//
-(id) init
{
    self.endpointRef = 0;
    self.name = @"";
    //
    return self;
}
//
//
//
-(id) initWithMIDIEndpointRef: (MIDIEndpointRef) endpoint withMIDIEndpointType: (MIDIEndpointType) endpointType
{
    self.endpointRef = endpoint;
    //
    CFStringRef cfs = CFSTR(".");
    _Nullable CFStringRef *str = &cfs;
    //
    self.status = MIDIObjectGetStringProperty(self.endpointRef, kMIDIPropertyName, str);
    if (self.status != noErr)
    {
        self.name = @"";
        //NSLog(@"\nError getting MIDI endpoint name");
        //return;
    }
    else
    {
        self.name = (__bridge NSString *)*str;
    }
    //
    //
    return self;
}
//
@end
