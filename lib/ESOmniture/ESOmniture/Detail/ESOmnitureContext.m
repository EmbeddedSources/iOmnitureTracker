#import "ESOmnitureContext.h"

#import "ESOmnitureVariable.h"

#import "NSBundle+OmnitureApplicationIdentifier.h"

@interface ESOmnitureContext ()

@property ( nonatomic, retain ) NSArray* variables;

@end

@implementation ESOmnitureContext

@synthesize variables = _variables;

-(NSString*)defaultVisitorId
{
   return [ [ UIDevice currentDevice ] uniqueIdentifier ];
}

-(NSString*)screenSize
{
   CGRect screen_bounds_ = [ [ UIScreen mainScreen ] bounds ];
   return [ NSString stringWithFormat: @"%dx%d", (int)screen_bounds_.size.width, (int)screen_bounds_.size.height ];
}

-(void)dealloc
{
   [ _variables release ];
   
   [ super dealloc ];
}

+(id)context
{
   return [ [ [ self alloc ] init ] autorelease ];
}

-(NSArray*)variables
{
   if ( !_variables )
   {
      _variables = [ [ NSArray alloc ] initWithObjects: [ ESOmnitureVariable variableWithName: @"AQB" value: @"1" ]
                    , [ ESOmnitureVariable variableWithName: @"ndh" value: @"1" ]
                    , [ ESRequiredOmnitureVariable variableWithName: ESOmnitureVariableTimestamp ]
                    , [ ESRequiredOmnitureVariable variableWithName: ESOmnitureVariableVisitorId value: [ self defaultVisitorId ] ]
                    , [ ESRequiredOmnitureVariable variableWithName: @"ce" value: @"UTF-8" ]
                    , [ ESRequiredOmnitureVariable variableWithName: ESOmnitureVariableVisitorNamespace ]
                    , [ ESRequiredOmnitureVariable variableWithName: ESOmnitureVariablePageName value: [ NSBundle applicationIdentifier ] ]
                    , [ ESMutableOmnitureVariable variableWithName: ESOmnitureVariableEvents ]
                    //Properties
                    , [ ESMutableOmnitureVariable propWithIndex: 1 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 2 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 3 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 4 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 5 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 6 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 7 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 8 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 9 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 10 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 11 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 12 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 13 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 14 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 15 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 16 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 17 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 18 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 19 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 20 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 21 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 22 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 23 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 24 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 25 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 26 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 27 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 28 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 29 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 30 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 31 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 32 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 33 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 34 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 35 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 36 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 37 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 38 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 39 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 40 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 41 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 42 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 43 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 44 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 45 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 46 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 47 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 48 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 49 ]
                    , [ ESMutableOmnitureVariable propWithIndex: 50 ]
                    //Variables
                    , [ ESMutableOmnitureVariable eVarWithIndex: 1 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 2 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 3 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 4 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 5 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 6 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 7 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 8 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 9 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 10 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 11 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 12 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 13 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 14 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 15 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 16 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 17 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 18 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 19 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 20 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 21 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 22 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 23 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 24 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 25 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 26 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 27 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 28 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 29 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 30 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 31 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 32 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 33 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 34 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 35 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 36 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 37 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 38 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 39 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 40 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 41 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 42 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 43 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 44 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 45 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 46 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 47 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 48 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 49 ]
                    , [ ESMutableOmnitureVariable eVarWithIndex: 50 ]
                    , [ ESOmnitureVariable variableWithName: @"s" value: [ self screenSize ] ]
                    , [ ESOmnitureVariable variableWithName: @"c" value: @"24" ]
                    , [ ESOmnitureVariable variableWithName: @"AQE" value: @"1" ]
                    , nil
                    ];
   }
   
   return _variables;
}

-(ESOmnitureVariable*)variableWithName:( NSString* )name_
{
   for ( ESOmnitureVariable* variable_ in self.variables )
   {
      if ( [ variable_.name isEqualToString: name_ ] )
      {
         return variable_;
      }
   }

   NSAssert( NO, @"ESOmniture. Undefined variable '%@'", name_ );

   return nil;
}

-(void)setVariableValue:( NSString* )value_ withName:( NSString* )name_
{
   ESMutableOmnitureVariable* variable_ = ( ESMutableOmnitureVariable* )[ self variableWithName: name_ ];
   variable_.value = value_;
}

-(NSString*)variableValueWithName:( NSString* )name_
{
   ESOmnitureVariable* variable_ = [ self variableWithName: name_ ];
   return variable_.value;
}

-(NSString*)urlArguments
{
   NSMutableArray* values_ = [ NSMutableArray array ];
   
   for ( ESOmnitureVariable* variable_ in self.variables )
   {
      NSString* variable_value_ = [ variable_ argumentValue ];
      if ( variable_value_ )
      {
         [ values_ addObject: variable_value_ ];
      }
   }
   return [ values_ componentsJoinedByString: @"&" ];
}

-(NSString*)description
{
   NSMutableArray* description_ = [ NSMutableArray arrayWithObject: @"[" ];
   
   for ( ESOmnitureVariable* variable_ in self.variables )
   {
      if ( variable_.value )
      {
         [ description_ addObject: [ NSString stringWithFormat: @"\t%@ = '%@';", variable_.name, variable_.value ] ];
      }
   }
   
   [ description_ addObject: @"]" ];
   
   return [ description_ componentsJoinedByString: @"\n" ];
}

@end
