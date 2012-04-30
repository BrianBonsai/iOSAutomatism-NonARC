//
//  RSSItem.m
//  TestSingleView1
//
//  Created by  on 12/04/28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RSSItem.h"

@implementation RSSItem


@synthesize identifier = _identifier;
@synthesize read = _read;
@synthesize title = _title;
@synthesize link = _link;
@synthesize itemDescription = _itemDescription;
@synthesize pubDate = _pubDate;

//初期化のインスタンスメソッド

-(id)init
{
    self =[super init];
    if(!self){
        return nil;
    }
    
    //識別子を作成する
    CFUUIDRef   uuid;
    uuid = CFUUIDCreate(NULL);  //NULL
    _identifier = (NSString*)CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    
    //itemを初期化する
    ///作成したインスタンスをこのクラスで保持させている
    ///（メモリ管理のパターン）
    //どこで宣言しているのだ？
    _items = [[NSMutableArray array] retain];

    return self;
}

-(id)initWithCoder:(NSCoder*)decoder
{
    self =[super init];
    if(!self){
        return nil;
    }

    [self decodeWithCoder:decoder];
    
    return self;
}

//保存:encode
-(void)encodeWithCoder:(NSCoder*)encoder
{
    //インスタンス変数をエンコードする
    [encoder encodeObject:_identifier forKey:@"identifier"];
    [encoder encodeBool:_read forKey:@"read"];
    [encoder encodeObject:_title forKey:@"title"];
    [encoder encodeObject:_link forKey:@"link"];
    [encoder encodeObject:_itemDescription forKey:@"itemDescription"];
    [encoder encodeObject:_pubDate forKey:@"pubDate"];
}

//読み込み:decode
-(void)decodeWithCoder:(NSCoder*)decoder{
    
    //インスタンス変数をデコードする
    _identifier = [[decoder decodeObjectForKey:@"identifier"] retain];
    //BOOL型はretainしない
    _read = [decoder decodeBoolForKey:@"read"];
    _title = [[decoder decodeObjectForKey:@"title"] retain];
    _link = [[decoder decodeObjectForKey:@"link"] retain];
    _itemDescription = [[decoder decodeObjectForKey:@"itemDescription"] retain];
    _pubDate = [[decoder decodeObjectForKey:@"pubDate"] retain];
}

-(void)dealloc
{
    [_identifier release], _identifier = nil;
    [_title release], _title = nil;
    [_link release ], _link = nil;
    [_itemDescription release], _itemDescription = nil;
    [_pubDate release], _pubDate = nil;
    
    //親クラスのdeallocを呼び出す
    [super dealloc];
}

@end
