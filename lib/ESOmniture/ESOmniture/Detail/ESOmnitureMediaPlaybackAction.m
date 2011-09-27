#import "ESOmnitureMediaPlaybackAction.h"

#import "ESOmniture.h"

NSString* const ESOmnitureMediaPlayActionName = @"S";
NSString* const ESOmnitureMediaStopActionName = @"E";
NSString* const ESOmnitureMediaTrackActionName = @"L";

@interface ESOmnitureMediaPlaybackAction ()

@property ( nonatomic, retain ) NSString* name;
@property ( nonatomic, assign ) NSTimeInterval offset;
@property ( nonatomic, retain ) NSString* reportType;

@end


@implementation ESOmnitureMediaPlaybackAction

@synthesize name = _name;
@synthesize offset = _offset;
@synthesize reportType = _report_type;

-(void)dealloc
{
   [ _name release ];
   [ _report_type release ];

   [ super dealloc ];
}

-(id)initWithName:( NSString* )name_
           offset:( NSTimeInterval )offset_
       reportType:( NSString* )report_type_
{
   if ( !( self = [ super init ] ) )
      return nil;

   self.name = name_;
   self.offset = offset_;
   self.reportType = report_type_;

   return self;
}

+(id)trackActionWithOffset:( NSTimeInterval )offset_
{
   return [ [ [ self alloc ] initWithName: ESOmnitureMediaTrackActionName
                                   offset: offset_
                               reportType: ESOmnitureVideoReportOthers ] autorelease ];
}

+(id)openActionWithOffset:( NSTimeInterval )offset_
{
   return [ [ [ self alloc ] initWithName: ESOmnitureMediaPlayActionName
                                   offset: offset_
                               reportType: ESOmnitureVideoReportStart ] autorelease ];
}

+(id)playActionWithOffset:( NSTimeInterval )offset_
{
   return [ [ [ self alloc ] initWithName: ESOmnitureMediaPlayActionName
                                   offset: offset_
                               reportType: ESOmnitureVideoReportOthers ] autorelease ];
}

+(id)stopActionWithOffset:( NSTimeInterval )offset_
{
   return [ [ [ self alloc ] initWithName: ESOmnitureMediaStopActionName
                                   offset: offset_
                               reportType: ESOmnitureVideoReportOthers ] autorelease ];
}

-(NSString*)description
{
   //offset 1 second = 0 second in omniture format
   NSTimeInterval omniture_offset_ = self.offset > 1.0 ? self.offset - 1.0 : self.offset;

   return [ self.name stringByAppendingFormat: @"%d", (int)omniture_offset_ ];
}

@end
