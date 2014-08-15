//
//  RWTItemCell.m
//  ForgetMeNot
//
//  Created by Chris Wagner on 1/30/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

#import "RWTItemCell.h"
#import "RWTItem.h"

@implementation RWTItemCell

- (void)prepareForReuse {
    [super prepareForReuse];
    self.item = nil;
}

- (void)setItem:(RWTItem *)item {
    if (_item) {
        [_item removeObserver:self forKeyPath:@"lastSeenBeacon"];
    }
    
    _item = item;
    [_item addObserver:self forKeyPath:@"lastSeenBeacon" options:NSKeyValueObservingOptionNew context:NULL];
    
    self.textLabel.text = _item.name;
}

- (void)dealloc {
    [_item removeObserver:self forKeyPath:@"lastSeenBeacon"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([object isEqual:self.item] && [keyPath isEqualToString:@"lastSeenBeacon"]) {
        self.detailTextLabel.text = [NSString stringWithFormat:@"Location: %@", [self nameForProximity:self.item.lastSeenBeacon.proximity]];
    }
}

- (NSString *)nameForProximity:(CLProximity)proximity {
    switch (proximity) {
        case CLProximityUnknown:
            NSLog(@"User location: unknown.");
            return @"Unknown";
            break;
        case CLProximityImmediate:
            NSLog(@"User location: immediate.");
            return @"Immediate";
            break;
        case CLProximityNear:
            NSLog(@"User location: near.");
            return @"Near";
            break;
        case CLProximityFar:
            NSLog(@"User location: far.");
            return @"Far";
            break;
    }
}

@end
