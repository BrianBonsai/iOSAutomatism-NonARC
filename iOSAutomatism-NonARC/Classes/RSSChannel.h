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
    NSString*   _feedUrlString;
    NSString*   _title;
    NSString*   _link;
    
    NSMutableArray* _items;
}

//クラスメソッドで？？
//+(id) init;
-(id) init;


//@property
@property(nonatomic,readonly)NSString* identifier;
@property(nonatomic,retain)NSString* feedUrlString;
@property(nonatomic,retain)NSString* title;
@property(nonatomic,retain)NSString* link;
@property(nonatomic,retain)NSMutableArray* items;


@end
