#import <Foundation/Foundation.h>

typedef enum
{
   ESOmnitureMediaActionPlay = 'S'
   , ESOmnitureMediaActionStop = 'E'
   , ESOmnitureMediaActionTrack = 'L'
} ESOmnitureMediaActionType;

@interface ESOmnitureMediaPlaybackAction : NSObject

@property ( nonatomic, assign, readonly ) ESOmnitureMediaActionType type;
@property ( nonatomic, assign, readonly ) NSTimeInterval offset;
@property ( nonatomic, retain, readonly ) NSString* reportType;

+(id)trackActionWithOffset:( NSTimeInterval )offset_;
+(id)openActionWithOffset:( NSTimeInterval )offset_;
+(id)playActionWithOffset:( NSTimeInterval )offset_;
+(id)stopActionWithOffset:( NSTimeInterval )offset_;

@end
