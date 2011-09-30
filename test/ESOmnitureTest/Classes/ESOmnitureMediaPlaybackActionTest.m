#import <ESOmniture/Detail/ESOmnitureMediaPlaybackAction.h>

#import <ESOmniture/ESOmniture.h>

@interface ESOmnitureMediaPlaybackActionTest : GHTestCase

@end

@implementation ESOmnitureMediaPlaybackActionTest

-(void)testAction
{
   ESOmnitureMediaPlaybackAction* play_action_ = [ ESOmnitureMediaPlaybackAction playActionWithOffset: 0.0 ];

   GHAssertTrue( [ [ play_action_ description ] isEqualToString: @"S0" ], @"Check S0 description" );
   GHAssertTrue( [ play_action_.reportType isEqualToString: ESOmnitureVideoReportOthers ], @"Check S0 report type" );

   ESOmnitureMediaPlaybackAction* open_action_ = [ ESOmnitureMediaPlaybackAction openActionWithOffset: 1.0 ];

   GHAssertTrue( [ [ open_action_ description ] isEqualToString: @"S0" ], @"Check open S0 description" );
   GHAssertTrue( [ open_action_.reportType isEqualToString: ESOmnitureVideoReportStart ], @"Check open S0 report type" );

   ESOmnitureMediaPlaybackAction* stop_action_ = [ ESOmnitureMediaPlaybackAction stopActionWithOffset: 2.0 ];
   
   GHAssertTrue( [ [ stop_action_ description ] isEqualToString: @"E1" ], @"Check E1 description" );
   GHAssertTrue( [ stop_action_.reportType isEqualToString: ESOmnitureVideoReportOthers ], @"Check E1 report type" );

   ESOmnitureMediaPlaybackAction* track_action_ = [ ESOmnitureMediaPlaybackAction trackActionWithOffset: 1.5 ];

   GHAssertTrue( [ [ track_action_ description ] isEqualToString: @"L0" ], @"Check LO description" );
   GHAssertTrue( [ track_action_.reportType isEqualToString: ESOmnitureVideoReportOthers ], @"Check L0 report type" );
}

@end
