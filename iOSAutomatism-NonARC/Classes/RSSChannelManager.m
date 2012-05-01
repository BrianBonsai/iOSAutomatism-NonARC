//
//  RSSChannelManager.m
//  iOSAutomatism-NonARC
//
//  Created by  on 12/05/01.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RSSChannelManager.h"

@implementation RSSChannelManager

static RSSChannelManager* _sharedInstance = nil;

+(RSSChannelManager*) sharedManager
{
    //インスタンスを作成する
    if(!_sharedInstance){
        _sharedInstance = [[RSSChannelManager alloc]init];
    }
    
    return _sharedInstance;
}

//初期化のインスタンスメソッド

-(id)init
{
    self =[super init];
    if(!self){
        return nil;
    }
    
    //channelsの初期化
    _channels = [[NSMutableArray array]retain];
    
    return self;
    
}

//--------------------------------------------------------------//
#pragma mark -- channelの操作 --
//--------------------------------------------------------------//

-(void)addCannle:(RSSChannel *)channel
{
    if(!channel){
        return;
    }
    
    //
    [_channels addObject:channel];
}

-(void)insertChannel:(RSSChannel *)channel atIndex:(unsigned int)index
{
    if(!channel){
        return;
    }
    if(index < 0 || index > [_channels count]){
        return;
    }
    [_channels insertObject:channel atIndex:index];
}

-(void)removeChannelAtIndex:(unsigned int)index
{
    if(index < 0 || index > [_channels count] -1){
        return;
    }
    
    [_channels removeObjectAtIndex:index];
    
}

-(void)moveChannelAtIndex:(unsigned int)fromIndex toIndex:(unsigned int)toIndex
{
    if(fromIndex < 0 || fromIndex > [_channels count] - 1){
        return;
    }
    if(toIndex < 0 || toIndex > [_channels count] -1){
        return;
    }      
    //チャンネルをいどうする
    RSSChannel* channel;
    channel = [_channels objectAtIndex:fromIndex];
    [channel retain];
    [_channels removeObject:channel];
    [_channels insertObject:channel atIndex:toIndex];
    [channel release];

}

//--------------------------------------------------------------//
#pragma mark -- 永続化 --
//--------------------------------------------------------------//
-(NSString*)_channelDir
{
    //ドキュメントパスの取得
    NSArray *   paths;
    NSString *  path;
    
    paths = NSSearchPathForDirectoriesInDomains(
                                                NSDocumentDirectory, 
                                                NSUserDomainMask,
                                                Yes);
    if([paths count] < 1){
        return nil;
    }
    path = [paths objectAtIndex:0];
    
    //.channelディレクトリの作成
    path = [path stringByAppendingPathComponent:@".channel"];
    return path;
}

-(NSString*)_channelPath
{
    //channel.datパスを作成する
    NSString *  path;
    path = [[self _channelDir] stringByAppendingPathComponent:@"channel.dat"];
    return path;
}

-(void)save
{
    //ファイルマネージャの取得
    NSFileManager* fileMgr;
    fileMgr = [NSFileManager defaultManager];
    
    //.channelディレクトリの作成
    NSString*   channelDir;
    channelDir = [self _channelDir];
    if(![fileMgr fileExistsAtPath:channelDir]){
        NSError*    error;
        [fileMgr createDirectoryAtPath:channelDir
                            withIntermediateDirectories:YES
                            attributes:nil error:&error];
    }
                                               
    //チャンネルの配列を保存する
    NSString*   channelPath;
    channelPath = [self _channelPath];
    [NSKeyedArchiver archiveRootObject:_channels toFile:channelPath];
}

-(void)load
{
    //ファイルパスを取得する
    NSString*   channelPath;
    channelPath = [self _channelPath];
    if(!channelPath ||
       ![[NSFileManager defaultManager] fileExistsAtPath:channelPath]){
        return;
    }
    
    //チャンネルの配列を読み込む
    NSArray*    channels;
    channels = [NSKeyedUnarchiver unarchiveObjectWithFile:channelPath];
    if(!channels){
        return;
    }
    
    //チャンネルの配列を設定する
    [_channels setArray:channels];
}


@end
