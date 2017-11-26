//
//  MIDIEntity.h
//  TestMacMIDIIn01
//
//  Created by John Carlson on 6/4/17.
//  Copyright © 2017 John Carlson. All rights reserved.
//

#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMIDI.h>
//
#import "MIDIEndpoint.h"

@interface MIDIEntity : NSObject
{
    
}
//
@property MIDIEntityRef entityRef;
@property NSString *name;
//
@property NSMutableArray *endpointSourcesList;
@property ItemCount qtyOfEndpointSources;
//
@property NSMutableArray *endpointDestinationsList;
@property ItemCount qtyOfEndpointDestinations;
//
@property OSStatus status;
//
-(id) init;
-(id) initWithMIDIEntityRef: (MIDIEntityRef) entity;
@end
