
//
//  MIDIEntity.m
//  TestMacMIDIIn01
//
//  Created by John Carlson on 6/4/17.
//  Copyright © 2017 John Carlson. All rights reserved.
//

#import "MIDIEntity.h"

@implementation MIDIEntity
//
-(id) init
{
    self.entityRef = 0;
    self.name = @"";
    //
    self.endpointSourcesList = [NSMutableArray array];
    self.qtyOfEndpointSources = 0;
    //
    self.endpointDestinationsList = [NSMutableArray array];
    self.qtyOfEndpointDestinations = 0;
    //
    return self;
}
//
//
-(id) initWithMIDIEntityRef: (MIDIEntityRef) entity
{
    self.entityRef = entity;
    //
    self.endpointSourcesList = [NSMutableArray array];
    self.qtyOfEndpointSources = 0;
    //
    self.endpointDestinationsList = [NSMutableArray array];
    self.qtyOfEndpointDestinations = 0;
    //
    CFStringRef cfs = CFSTR(".");
    _Nullable CFStringRef *str = &cfs;
    //
    self.status = MIDIObjectGetStringProperty(self.entityRef, kMIDIPropertyName, str);
    if (self.status != noErr)
    {
        self.name = @"";
        //NSLog(@"\nError getting MIDI enetity name");
        //return;
    }
    else
    {
        self.name = (__bridge NSString *)*str;
    }
    //
    //
    //
    //
    self.qtyOfEndpointSources = MIDIEntityGetNumberOfSources(self.entityRef);
    //
    for (ItemCount i = 0; i < self.qtyOfEndpointSources; i++)
    {
        MIDIEndpoint *endpoint = [[MIDIEndpoint alloc] initWithMIDIEndpointRef: MIDIEntityGetSource(self.entityRef, i) withMIDIEndpointType: MIDIEndpointTypeSource];
        //
        [self.endpointSourcesList addObject: endpoint];
    }
    //
    //
    //
    //
    self.qtyOfEndpointDestinations = MIDIEntityGetNumberOfDestinations(self.entityRef);
    //
    for (ItemCount i = 0; i < self.qtyOfEndpointDestinations; i++)
    {
        MIDIEndpoint *endpoint = [[MIDIEndpoint alloc] initWithMIDIEndpointRef: MIDIEntityGetDestination(self.entityRef, i) withMIDIEndpointType: MIDIEndpointTypeDestination];
        //
        [self.endpointDestinationsList addObject: endpoint];
    }
    //
    //
    return self;
}
//
@end
