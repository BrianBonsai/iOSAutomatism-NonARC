//
//  RSSItem.h
//  TestSingleView1
//
//  Created by  on 12/04/28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSItem : NSObject
{
    NSString*   _identifier;
    BOOL        _read;
    
    NSString*   _title;
    NSString*   _link;
    NSString*   _itemDescription;
    NSString*   _pubDate;
}

//クラスメソッドで？？
//+(id) init;
-(id) init;


//@property
@property(nonatomic,readonly)NSString* identifier;
@property(nonatomic,getter=isRead)BOOL read;
@property(nonatomic,retain)NSString* title;
@property(nonatomic,retain)NSString* link;
@property(nonatomic,retain)NSString* itemDescription;
@property(nonatomic,retain)NSString* pubDate;


@end
