#import <Foundation/Foundation.h>

@class ESOmniture;

@protocol ESOmnitureMediaDelegate;

@interface ESOmnitureMedia : NSObject

@property ( nonatomic, assign ) ESOmniture* omniture;
@property ( nonatomic, assign ) NSTimeInterval trackSeconds;
@property ( nonatomic, retain ) NSString* trackMilestones;
@property ( nonatomic, retain ) NSString* cuePoints;
@property ( nonatomic, assign ) BOOL trackAtCuePoints;
@property ( nonatomic, assign ) id< ESOmnitureMediaDelegate > delegate;

-(id)initWithOmniture:( ESOmniture* )omniture_;

-(void)open:( NSString* )name_
     length:( NSTimeInterval )length_
 playerName:( NSString* )player_name_;

-(void)close:( NSString* )name_;

-(void)play:( NSString* )name_
     offset:( NSTimeInterval )offset_;

-(void)stop:( NSString* )name_
     offset:( NSTimeInterval )offset_;

@end

@interface ESOmnitureMediaState : NSObject

@property ( nonatomic, retain, readonly ) NSString * name;
@property ( nonatomic, assign, readonly ) NSTimeInterval length;
@property ( nonatomic, retain, readonly ) NSString* playerName;
@property ( nonatomic, retain, readonly ) NSString* mediaEvent;
@property ( nonatomic, retain, readonly ) NSDate* openTime;
@property ( nonatomic, assign, readonly ) NSTimeInterval offset;
@property ( nonatomic, retain, readonly ) NSString * offsetName;
@property ( nonatomic, assign, readonly ) double percent;
@property ( nonatomic, assign, readonly ) NSTimeInterval timePlayed;
@property ( nonatomic, assign, readonly ) double milestone;

@end
