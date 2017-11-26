//
//  MIDIEndpoint.h
//  TestMacMIDIIn01
//
//  Created by John Carlson on 6/4/17.
//  Copyright © 2017 John Carlson. All rights reserved.
//

#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMIDI.h>

@interface MIDIEndpoint : NSObject
{
    
}
typedef NS_ENUM(NSInteger, MIDIEndpointType)
{
    MIDIEndpointTypeSource,
    MIDIEndpointTypeDestination
};
//
@property MIDIEndpointRef endpointRef;
@property MIDIEndpointType *endpointType;
@property NSString *name;
//
@property OSStatus status;
//
-(id) init;
-(id) initWithMIDIEndpointRef: (MIDIEndpointRef) endpoint withMIDIEndpointType: (MIDIEndpointType) endpointType;
//
@end
