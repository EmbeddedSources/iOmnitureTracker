#import <Foundation/Foundation.h>

extern NSString* const ESOmnitureMediaPlayActionName;
extern NSString* const ESOmnitureMediaStopActionName;
extern NSString* const ESOmnitureMediaTrackActionName;

@interface ESOmnitureMediaPlaybackAction : NSObject

@property ( nonatomic, retain, readonly ) NSString* name;
@property ( nonatomic, assign, readonly ) NSTimeInterval offset;

+(id)trackActionWithOffset:( NSTimeInterval )offset_;
+(id)playActionWithOffset:( NSTimeInterval )offset_;
+(id)stopActionWithOffset:( NSTimeInterval )offset_;

@end