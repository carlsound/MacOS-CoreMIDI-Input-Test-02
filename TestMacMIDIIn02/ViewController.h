//
//  ViewController.h
//  TestMacMIDIIn01
//
//  Created by John Carlson on 5/28/17.
//  Copyright © 2017 John Carlson. All rights reserved.
//

//https://developer.apple.com/library/content/samplecode/TableViewPlayground/Introduction/Intro.html#//apple_ref/doc/uid/DTS40010727
//
//https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/TableView/Introduction/Introduction.html#//apple_ref/doc/uid/10000026i
//
//https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/TableView/PopulatingView-TablesProgrammatically/PopulatingView-TablesProgrammatically.html#//apple_ref/doc/uid/10000026i-CH14-SW1
//
//https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/TableView/PopulatingViewTablesWithBindings/PopulatingView-TablesWithBindings.html#//apple_ref/doc/uid/10000026i-CH13-SW1
//
//https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CocoaBindings/CocoaBindings.html#//apple_ref/doc/uid/10000167i
//
//https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/KeyValueCoding/index.html#//apple_ref/doc/uid/10000107i
//
//https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/KeyValueObserving/KeyValueObserving.html#//apple_ref/doc/uid/10000177i
//
//https://developer.apple.com/reference/appkit/nstableviewdelegate
//
//https://developer.apple.com/reference/appkit/nstableview
//
//https://www.youtube.com/watch?v=JUElbsmi67Y

#import <Cocoa/Cocoa.h>

#import "MIDIHelper.h"

@interface ViewController : NSViewController<NSTableViewDataSource, NSTableViewDelegate>
{
    
}
//
@property (weak) IBOutlet NSTableView *midiDevicesTable;
//
@property (nonatomic, strong) MIDIHelper *midiHelp;
//
@property NSInteger currentlySelectedRow;
@property NSInteger previouslySelectedRow;
@property BOOL aRowIsSelected;
//
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView;
//
- (id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(NSInteger)row;
//
@end
