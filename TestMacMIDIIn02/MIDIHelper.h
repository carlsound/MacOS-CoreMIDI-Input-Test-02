//
//  MIDIHelper.h
//  TestMacMIDIIn01
//
//  Created by John Carlson on 5/28/17.
//  Copyright © 2017 John Carlson. All rights reserved.
//

#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#import <CoreMIDI/CoreMIDI.h>
//
#import "MIDIDevice.h"
//
//https://developer.apple.com/reference/coremidi
//
//http://comelearncocoawithme.blogspot.ca/2011/08/reading-from-external-controllers-with.html
//
//https://stackoverflow.com/questions/13952151/can-anyone-show-me-how-to-use-coremidi-on-ios
//
//https://stackoverflow.com/questions/8795749/coremidi-logging-received-midi-messages-to-an-nstextfield
//
//http://rypress.com/tutorials/objective-c/blocks
//
// https://stackoverflow.com/questions/19002598/midiclientcreate-notifyproc-not-getting-called
//
// http://xmidi.com/how-to-access-midi-devices-with-coremidi/
//
//
@interface MIDIHelper : NSObject
{
}
//
@property MIDIClientRef clientRef;
@property OSStatus status;
//
@property MIDIPortRef inputPortRef;
//
//
@property ItemCount qtyOfDevices;
@property MIDIObjectRef * _Nullable objectRef;
@property MIDIObjectType * _Nullable objectType;
//
@property NSMutableArray * _Nullable deviceList;
//
@property MIDIEndpointRef * _Nullable endpointRef;
//
//@property CFPropertyListRef propertyListRef;
//
//@property MIDINotifyBlock _Nullable notifyBlock;
//@property MIDINotifyProc _Nullable notifyProc;
//@property MIDIReadBlock _Nullable readBlock;
@property MIDIReadProc _Nullable readProc;
//
@property MIDIPacketList packetList;
//
@property void * _Nullable connRefCon;
//
@property CFDataRef _Nullable dataRef;
@property CFErrorRef _Nullable * _Nullable error;
//
-(id _Nullable ) init;
//
-(void) createCallbackThread;
//
-(void) scanForDevices;
//
-(void) connectSource: (NSUInteger) deviceArrayIndex;
-(void) disconnectSource: (NSUInteger) deviceArrayIndex;
//
@end
