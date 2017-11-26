//
//  MIDIHelper.m
//  TestMacMIDIIn01
//
//  Created by John Carlson on 5/28/17.
//  Copyright © 2017 John Carlson. All rights reserved.
//

#import "MIDIHelper.h"

@implementation MIDIHelper
{
    
}
//
//
-(id) init
{
    self = [super init];
    //
    self.deviceList = [NSMutableArray array];
    //
    //self.propertyListRef = CFPropertyListCreateWithData(kCFAllocatorDefault, _dataRef,kCFPropertyListMutableContainersAndLeaves, NULL, self.error);
    //
    // Create a new thread for callbacks
    [self performSelectorInBackground:@selector(createCallbackThread) withObject:nil];
    //
    return self;
}
//
//
-(void) createCallbackThread
{
    self.status = MIDIClientCreate(CFSTR("MIDI client"),notifyProcCallback, self.connRefCon, &_clientRef);
    //
    if (self.status != noErr)
    {
        NSLog(@"\nError creating MIDI client\n");
        //return;
    }
    //
    self.status = MIDIInputPortCreate(_clientRef, CFSTR("Input"), readProcCallback, _connRefCon, &_inputPortRef);
    //
    if (self.status != noErr)
    {
        NSLog(@"\nError creating MIDI input port\n");
        //return;
    }
}
//
//
-(void) scanForDevices
{
    self.qtyOfDevices = MIDIGetNumberOfDevices();
    //NSLog(@"Qty. of MIDI Devices = %@",[NSString stringWithFormat:@"%ld", self.qtyOfDevices]);
    //
    for (ItemCount i = 0; i < self.qtyOfDevices; i++)
    {
        MIDIDevice *device = [[MIDIDevice alloc] initWithMIDIDeviceRef:MIDIGetDevice(i)];
        //
        //
        [self.deviceList addObject: device];
    }
}
//
//
//
-(void) connectSource: (NSUInteger) deviceArrayIndex
{
    MIDIDevice *device = [self.deviceList objectAtIndex:deviceArrayIndex];
    MIDIEntity *entity = [device.entityList objectAtIndex:0];
    MIDIEndpoint *source = [entity.endpointSourcesList objectAtIndex:0];
    //
    //
    self.status = MIDIPortConnectSource(_inputPortRef, source.endpointRef, _connRefCon);
    if (self.status != noErr)
    {
        NSLog(@"\nError connecting MIDI input source %@\n", device.name);
        //return;
    }
    else
    {
        NSLog(@"\nSuccess connecting MIDI input source %@ \n", device.name);
    }
}
//
//
//
-(void) disconnectSource: (NSUInteger) deviceArrayIndex
{
    MIDIDevice *device = [self.deviceList objectAtIndex:deviceArrayIndex];
    MIDIEntity *entity = [device.entityList objectAtIndex:0];
    MIDIEndpoint *source = [entity.endpointSourcesList objectAtIndex:0];
    //
    //
    self.status = MIDIPortDisconnectSource(_inputPortRef, source.endpointRef);
    if (self.status != noErr)
    {
        NSLog(@"\nError discconnecting MIDI input source %@\n", device.name);
        //return;
    }
    else
    {
        NSLog(@"\nSuccess discconnecting MIDI input source %@ \n", device.name);
    }
}
//
//
// C-style callback
void notifyProcCallback (const MIDINotification *message, void *refConf)
{
    NSLog(@"\n\nnotifyProcCallback was called\n");
}
//
//
// C-style callback
void notifyBlockCallback (const MIDINotification *message)
{
    NSLog(@"\n\nMIDINotifyBlock, messageId = %d\n",message->messageID);
}
//
//
// C-style callback
void readProcCallback(const MIDIPacketList *pktlist, void *readProcRefCon, void *srcConnRefCon)
{
    NSLog(@"\n\nreadProcCallback was called\n");
    //
    //
    MIDIPacket *packet = (MIDIPacket *) pktlist->packet;
    for(int i=0; i < pktlist->numPackets; i++)
    {
        Byte midiStatus = packet->data[0];
        Byte midiCommand = midiStatus >> 4;
        NSLog(@"\nmidiCommand =  %hhu", midiCommand);
        //
        if((midiCommand == 0x08) || (midiCommand == 0x09))
        {
            if(midiCommand == 0x09)
            {
                NSLog(@"\nnote on");
            }
            if(midiCommand == 0x08)
            {
                NSLog(@"\nnote off");
            }
            Byte note = packet->data[1] & 0x7F;
            NSLog(@"\nnote =  %hhu", note);
            //
            Byte velocity = packet->data[2] & 0x7F;
            NSLog(@"\nvelocity =  %hhu", velocity);
        }
        packet = MIDIPacketNext(packet);
    }
}

//
//
// C-style callback
void inputCallback(const MIDIPacketList *pktlist, void *srcConnRefCon)
{
    NSLog(@"\n\nmidiInputCallback was called\n");
};
//
//
// C-style callback
void (^readBlockCallback)(const MIDIPacketList *pktlist, void *srcConnRefCon) = ^void(const MIDIPacketList *pktlist, void *srcConnRefCon)
{
    NSLog(@"\n\nreadBlockCallback was called\n");
}; 
//
//
// C-style callback
/*
void readBlockCallback(const MIDIPacketList *pktlist, void *srcConnRefCon)
{
    NSLog(@"\n\nreadBlockCallback was called");
};
 */
//
@end
