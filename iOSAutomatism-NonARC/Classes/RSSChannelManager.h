//
//  RSSChannelManager.h
//  iOSAutomatism-NonARC
//
//  Created by  on 12/05/01.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RSSChannel.h"

@interface RSSChannelManager : NSObject
{
    //NSMutableArrayで管理する
    //NSDataではないバージョン
    NSMutableArray* _channels;
}

@property(nonatomic, readonly) NSArray* channels;

+(RSSChannelManager*)sharedManager;

-(id)init;

//channelの操作
-(void)addCannle:(RSSChannel*)channel;
-(void)insertChannel:(RSSChannel*)channel atIndex:(unsigned int)index;
-(void)removeChannelAtIndex:(unsigned int)index;
-(void)moveChannelAtIndex:(unsigned int)fromIndex toIndex:(unsigned int)toIndex;

//永続化
-(NSString*)_channelDir;
-(NSString*)_channelPath;
-(void)save;
-(void)load;

@end
