#import "ESOmnitureMediaPlaybackAction.h"

#import "ESOmniture.h"

@interface ESOmnitureMediaPlaybackAction ()

@property ( nonatomic, assign ) ESOmnitureMediaActionType type;
@property ( nonatomic, assign ) NSTimeInterval offset;
@property ( nonatomic, retain ) NSString* reportType;

@end


@implementation ESOmnitureMediaPlaybackAction

@synthesize type = _type;
@synthesize offset = _offset;
@synthesize reportType = _report_type;

-(void)dealloc
{
   [ _report_type release ];

   [ super dealloc ];
}

-(id)initWithType:( ESOmnitureMediaActionType )type_
           offset:( NSTimeInterval )offset_
       reportType:( NSString* )report_type_
{
   if ( !( self = [ super init ] ) )
      return nil;

   self.type = type_;
   self.offset = offset_;
   self.reportType = report_type_;

   return self;
}

+(id)trackActionWithOffset:( NSTimeInterval )offset_
{
   return [ [ [ self alloc ] initWithType: ESOmnitureMediaActionTrack
                                   offset: offset_
                               reportType: ESOmnitureVideoReportOthers ] autorelease ];
}

+(id)openActionWithOffset:( NSTimeInterval )offset_
{
   return [ [ [ self alloc ] initWithType: ESOmnitureMediaActionPlay
                                   offset: offset_
                               reportType: ESOmnitureVideoReportStart ] autorelease ];
}

+(id)playActionWithOffset:( NSTimeInterval )offset_
{
   return [ [ [ self alloc ] initWithType: ESOmnitureMediaActionPlay
                                   offset: offset_
                               reportType: ESOmnitureVideoReportOthers ] autorelease ];
}

+(id)stopActionWithOffset:( NSTimeInterval )offset_
{
   return [ [ [ self alloc ] initWithType: ESOmnitureMediaActionStop
                                   offset: offset_
                               reportType: ESOmnitureVideoReportOthers ] autorelease ];
}

-(NSString*)description
{
   //offset 1 second = 0 second in omniture format
   NSTimeInterval omniture_offset_ = self.offset > 1.0 ? self.offset - 1.0 : self.offset;

   return [ NSString stringWithFormat: @"%c%d", self.type, (int)omniture_offset_ ];
}

@end
