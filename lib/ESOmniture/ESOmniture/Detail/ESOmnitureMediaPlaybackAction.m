#import "ESOmnitureMediaPlaybackAction.h"

NSString* const ESOmnitureMediaPlayActionName = @"S";
NSString* const ESOmnitureMediaStopActionName = @"E";
NSString* const ESOmnitureMediaTrackActionName = @"L";

@interface ESOmnitureMediaPlaybackAction ()

@property ( nonatomic, retain ) NSString* name;
@property ( nonatomic, assign ) NSTimeInterval offset;

@end


@implementation ESOmnitureMediaPlaybackAction

@synthesize name = _name;
@synthesize offset = _offset;

-(void)dealloc
{
   [ _name release ];

   [ super dealloc ];
}

-(id)initWithName:( NSString* )name_
           offset:( NSTimeInterval )offset_
{
   if ( !( self = [ super init ] ) )
      return nil;

   self.name = name_;
   self.offset = offset_;

   return self;
}

+(id)trackActionWithOffset:( NSTimeInterval )offset_
{
   return [ [ [ self alloc ] initWithName: ESOmnitureMediaTrackActionName
                                   offset: offset_ ] autorelease ];
}

+(id)playActionWithOffset:( NSTimeInterval )offset_
{
   return [ [ [ self alloc ] initWithName: ESOmnitureMediaPlayActionName
                                   offset: offset_ ] autorelease ];
}

+(id)stopActionWithOffset:( NSTimeInterval )offset_
{
   return [ [ [ self alloc ] initWithName: ESOmnitureMediaStopActionName
                                   offset: offset_ ] autorelease ];
}

-(NSString*)description
{
   //offset 1 second = 0 second in omniture format
   NSTimeInterval omniture_offset_ = self.offset > 1.0 ? self.offset - 1.0 : self.offset;

   return [ self.name stringByAppendingFormat: @"%d", (int)omniture_offset_ ];
}

@end
