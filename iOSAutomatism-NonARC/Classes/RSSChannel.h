//
//  RSSChannel.h
//  TestSingleView1
//
//  Created by  on 12/04/28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSChannel : NSObject
{
    NSString*   _identifier;
    NSString*   _feedUrlStrin;
    NSString*   _title;
    NSString*   _link;
    
    NSMutableArray* _items;
}
@end
