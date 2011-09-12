#import <ESOmniture/Detail/ESOmnitureVariable.h>

@interface ESOmnitureVariableTest : GHTestCase

@end


@implementation ESOmnitureVariableTest

-(void)testVariableNames
{
   GHAssertTrue( [ ESOmnitureVariableTimestamp isEqualToString: @"t" ]
                , @"ESOmnitureVariableTimestamp"
                );

   GHAssertTrue( [ ESOmnitureVariableVisitorId isEqualToString: @"vid" ]
                , @"ESOmnitureVariableVisitorId"
                );
   
   GHAssertTrue( [ ESOmnitureVariableVisitorNamespace isEqualToString: @"ns" ]
                , @"ESOmnitureVariableVisitorNamespace"
                );

   GHAssertTrue( [ ESOmnitureVariablePageName isEqualToString: @"pageName" ]
                , @"ESOmnitureVariablePageName"
                );

   GHAssertTrue( [ ESOmnitureVariableEvents isEqualToString: @"events" ]
                , @"ESOmnitureVariableEvents"
                );

   GHAssertTrue( [ ESOmnitureVariableEVar( 12 ) isEqualToString: @"v12" ]
                , @"ESOmnitureVariableEVar"
                );
   
   GHAssertTrue( [ ESOmnitureVariableProp( 48 ) isEqualToString: @"c48" ]
                , @"ESOmnitureVariableEVar"
                );
}

-(void)testArgumentValue
{
   ESOmnitureVariable* escape_variable_ = [ ESOmnitureVariable variableWithName: @"abc" value: @"(GMT+00:00) Kiev" ];
   
   GHAssertTrue( [ [ escape_variable_ argumentValue ] isEqualToString: @"abc=%28GMT%2B00%3A00%29%20Kiev" ]
                , @"Variable with escaping"
                );

   ESMutableOmnitureVariable* evar_ = [ ESMutableOmnitureVariable eVarWithIndex: 18 ];
   evar_.value = @"evarTest";
   
   GHAssertTrue( [ [ evar_ argumentValue ] isEqualToString: @"v18=evarTest" ]
                , @"eVar"
                );
   
   ESMutableOmnitureVariable* prop_ = [ ESMutableOmnitureVariable propWithIndex: 5 ];
   prop_.value = @"testProp";
   
   GHAssertTrue( [ [ prop_ argumentValue ] isEqualToString: @"c5=testProp" ]
                , @"prop"
                );
}

-(void)testRequiredVariable
{
   ESOmnitureVariable* fail_variable_ = [ ESRequiredOmnitureVariable variableWithName: @"req1" ];
   
   GHAssertThrows( [ fail_variable_ argumentValue ], @"Required without value" );
   
   ESMutableOmnitureVariable* required_variable_ = [ ESRequiredOmnitureVariable variableWithName: @"req2" ];
   required_variable_.value = @"value";
   
   GHAssertNoThrow( [ required_variable_ argumentValue ], @"Required with value" );
}

-(void)testDefineState
{
   ESMutableOmnitureVariable* variable_ = [ ESMutableOmnitureVariable variableWithName: @"name" ];

   GHAssertFalse( [ variable_ isDefined ]
                , @"By default variable is not defined"
                );
   
   variable_.value = @"value";

   GHAssertTrue( [ variable_ isDefined ]
                 , @"Defined with value"
                 );

   variable_.value = nil;

   GHAssertFalse( [ variable_ isDefined ]
                , @"Nil is undefined"
                );
   
   variable_.value = @"";
   
   GHAssertFalse( [ variable_ isDefined ]
                 , @"Empty string is undefined"
                 );
}

@end
