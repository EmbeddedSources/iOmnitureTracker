#import <ESOmniture/Detail/ESOmnitureVariable.h>

#import <ESOmniture/Detail/ESOmnitureContext.h>

@interface ESOmnitureContextTest : GHTestCase

@end


@implementation ESOmnitureContextTest

-(void)testVariablesOrder
{
   ESOmnitureContext* context_ = [ ESOmnitureContext context ];

   [ context_  setVariableValue: @"eVar3_value" withName: ESOmnitureVariableEVar( 3 ) ];
   [ context_  setVariableValue: @"prop2_value" withName: ESOmnitureVariableProp( 2 ) ];
   [ context_  setVariableValue: @"eVar1_value" withName: ESOmnitureVariableEVar( 1 ) ];
   [ context_  setVariableValue: @"prop1_value" withName: ESOmnitureVariableProp( 1 ) ];
   [ context_  setVariableValue: @"ns_value" withName: ESOmnitureVariableVisitorNamespace ];
   [ context_  setVariableValue: @"pageName_value" withName: ESOmnitureVariablePageName ];
   [ context_  setVariableValue: @"t_value" withName: ESOmnitureVariableTimestamp ];
   [ context_  setVariableValue: @"events_value" withName: ESOmnitureVariableEvents ];
   [ context_  setVariableValue: @"vid_value" withName: ESOmnitureVariableVisitorId ];

   CGRect screen_bounds_ = [ [ UIScreen mainScreen ] bounds ];

   NSString* expexted_value_ = [ NSString stringWithFormat: @"AQB=1&ndh=1&t=t_value&vid=vid_value&ce=UTF-8"
                                @"&ns=ns_value&pageName=pageName_value&events=events_value&c1=prop1_value"
                                @"&c2=prop2_value&v1=eVar1_value&v3=eVar3_value&s=%dx%d&c=24&AQE=1"
                                , (int)screen_bounds_.size.width
                                , (int)screen_bounds_.size.height ];

   GHAssertTrue( [ [ context_ urlArguments ] isEqualToString: expexted_value_ ]
                , @"Order of variables during serialization"
                );
   
   [ context_ setVariableValue: nil withName: ESOmnitureVariableEVar( 3 ) ];
   
   NSString* expected_value2_ = [ NSString stringWithFormat: @"AQB=1&ndh=1&t=t_value&vid=vid_value&ce=UTF-8"
                                @"&ns=ns_value&pageName=pageName_value&events=events_value&c1=prop1_value"
                                @"&c2=prop2_value&v1=eVar1_value&s=%dx%d&c=24&AQE=1"
                                , (int)screen_bounds_.size.width
                                , (int)screen_bounds_.size.height ];
   
   GHAssertTrue( [ [ context_ urlArguments ] isEqualToString: expected_value2_ ]
                , @"Order of variables during serialization"
                );
}

-(void)testUndefinedVariable
{
   ESOmnitureContext* context_ = [ ESOmnitureContext context ];
   
   GHAssertThrows( [ context_ setVariableValue: @"abc" withName: @"custom" ], @"Undefined variable name" );
}

@end
