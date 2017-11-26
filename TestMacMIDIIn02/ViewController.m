//
//  ViewController.m
//  TestMacMIDIIn01
//
//  Created by John Carlson on 5/28/17.
//  Copyright © 2017 John Carlson. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    // Do any additional setup after loading the view.
    self.aRowIsSelected = FALSE;
    self.midiHelp = [[MIDIHelper alloc] init];
    [self.midiHelp scanForDevices];
    //
    //self.mutableArray = [[NSMutableArray alloc] init];
    //
    //[self.midiDevicesTable reloadData];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}



- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    //return self.midiDevicesMutableArray.count;
    return self.midiHelp.deviceList.count;
}


- (id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row
{
    MIDIDevice *d = [self.midiHelp.deviceList objectAtIndex:row];
    NSString *arrayIdentifier = [tableColumn identifier];
    //
    return [d valueForKey:arrayIdentifier];
}


- (IBAction)rowSelected:(id)sender
{
    if(self.aRowIsSelected)
    {
        self.previouslySelectedRow = self.currentlySelectedRow;
        [self.midiHelp disconnectSource: (NSUInteger)_previouslySelectedRow];
    }
    //
    //
    self.aRowIsSelected = TRUE;
    //
    //
    self.currentlySelectedRow = [sender selectedRow];
    NSLog(@"the user just clicked on row %ld", (long)self.currentlySelectedRow);
    [self.midiHelp connectSource: (NSUInteger)_currentlySelectedRow];
}

@end
