#import "ESOmnitureVariable.h"

NSString* const ESOmnitureVariableTimestamp = @"t";
NSString* const ESOmnitureVariableVisitorId = @"vid";
NSString* const ESOmnitureVariableVisitorNamespace = @"ns";
NSString* const ESOmnitureVariablePageName = @"pageName";
NSString* const ESOmnitureVariableEvents = @"events";

NSString* ESOmnitureVariableEVar( NSUInteger index_ )
{
   return [ NSString stringWithFormat: @"v%d", index_ ];
}

NSString* ESOmnitureVariableProp( NSUInteger index_ )
{
   return [ NSString stringWithFormat: @"c%d", index_ ];
}

@interface ESOmnitureVariable ()

@property ( nonatomic, copy ) NSString* name;

-(NSString*)argumentValue;

@end


@implementation ESOmnitureVariable

@synthesize name = _name;
@synthesize value = _value;

-(void)dealloc
{
   [ _name release ];
   [ _value release ];
   
   [ super dealloc ];
}

-(id)initWithName:( NSString* )name_
            value:( NSString* )value_
{
   if ( !( self = [ super init ] ) )
      return nil;
   
   self.name = name_;
   self.value = value_;

   return self;
}

+(id)variableWithName:( NSString* )name_
                value:( NSString* )value_
{
   return [ [ [ self alloc ] initWithName: name_ value: value_ ] autorelease ];
}

+(id)variableWithName:( NSString* )name_
{
   return [ self variableWithName: name_ value: nil ];
}

+(id)eVarWithIndex:( NSUInteger )index_
{
   return [ self variableWithName: ESOmnitureVariableEVar( index_ ) ];
}

+(id)propWithIndex:( NSUInteger )index_
{
   return [ self variableWithName: ESOmnitureVariableProp( index_ ) ];
}

-(NSString*)argumentValue
{
   if ( self.value )
   {
      return [ self.name stringByAppendingFormat: @"=%@", self.value ];
   }

   return nil;
}

@end

@interface ESRequiredOmnitureVariable : ESOmnitureVariable

@end

@implementation ESRequiredOmnitureVariable

-(NSString*)argumentValue
{
   NSString* result_ = [ super argumentValue ];

   NSAssert1( result_, @"Omniture variable: '%@' is required", self.name );

   return result_;
}

@end


@interface ESOmnitureContext ()

@property ( nonatomic, retain ) NSArray* variables;

@end

@implementation ESOmnitureContext

@synthesize variables = _variables;

-(NSString*)defaultVisitorId
{
   return [ [ UIDevice currentDevice ] uniqueIdentifier ];
}

-(NSString*)applicationIdentifier
{
   NSDictionary* info_ = [ [ NSBundle mainBundle ] infoDictionary ];
   NSString* version_ = [ info_ objectForKey: @"CFBundleVersion" ];
   NSString* application_name_ = [ info_ objectForKey: @"CFBundleName" ];
   return [ application_name_ stringByAppendingFormat: @"/%@", version_ ];
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
      _variables = [ [ NSArray alloc ] initWithObjects: [ ESRequiredOmnitureVariable variableWithName: @"AQB" value: @"1" ]
                    , [ ESRequiredOmnitureVariable variableWithName: @"ndh" value: @"1" ]
                    , [ ESRequiredOmnitureVariable variableWithName: ESOmnitureVariableTimestamp ]
                    , [ ESRequiredOmnitureVariable variableWithName: ESOmnitureVariableVisitorId value: [ self defaultVisitorId ] ]
                    , [ ESRequiredOmnitureVariable variableWithName: @"ce" value: @"UTF-8" ]
                    , [ ESRequiredOmnitureVariable variableWithName: ESOmnitureVariableVisitorNamespace ]
                    , [ ESRequiredOmnitureVariable variableWithName: ESOmnitureVariablePageName value: [ self applicationIdentifier ] ]
                    , [ ESOmnitureVariable variableWithName: ESOmnitureVariableEvents ]
                    //Properties
                    , [ ESOmnitureVariable propWithIndex: 1 ]
                    , [ ESOmnitureVariable propWithIndex: 2 ]
                    , [ ESOmnitureVariable propWithIndex: 3 ]
                    , [ ESOmnitureVariable propWithIndex: 4 ]
                    , [ ESOmnitureVariable propWithIndex: 5 ]
                    , [ ESOmnitureVariable propWithIndex: 6 ]
                    , [ ESOmnitureVariable propWithIndex: 7 ]
                    , [ ESOmnitureVariable propWithIndex: 8 ]
                    , [ ESOmnitureVariable propWithIndex: 9 ]
                    , [ ESOmnitureVariable propWithIndex: 10 ]
                    , [ ESOmnitureVariable propWithIndex: 11 ]
                    , [ ESOmnitureVariable propWithIndex: 12 ]
                    , [ ESOmnitureVariable propWithIndex: 13 ]
                    , [ ESOmnitureVariable propWithIndex: 14 ]
                    , [ ESOmnitureVariable propWithIndex: 15 ]
                    , [ ESOmnitureVariable propWithIndex: 16 ]
                    , [ ESOmnitureVariable propWithIndex: 17 ]
                    , [ ESOmnitureVariable propWithIndex: 18 ]
                    , [ ESOmnitureVariable propWithIndex: 19 ]
                    , [ ESOmnitureVariable propWithIndex: 20 ]
                    , [ ESOmnitureVariable propWithIndex: 21 ]
                    , [ ESOmnitureVariable propWithIndex: 22 ]
                    , [ ESOmnitureVariable propWithIndex: 23 ]
                    , [ ESOmnitureVariable propWithIndex: 24 ]
                    , [ ESOmnitureVariable propWithIndex: 25 ]
                    , [ ESOmnitureVariable propWithIndex: 26 ]
                    , [ ESOmnitureVariable propWithIndex: 27 ]
                    , [ ESOmnitureVariable propWithIndex: 28 ]
                    , [ ESOmnitureVariable propWithIndex: 29 ]
                    , [ ESOmnitureVariable propWithIndex: 30 ]
                    , [ ESOmnitureVariable propWithIndex: 31 ]
                    , [ ESOmnitureVariable propWithIndex: 32 ]
                    , [ ESOmnitureVariable propWithIndex: 33 ]
                    , [ ESOmnitureVariable propWithIndex: 34 ]
                    , [ ESOmnitureVariable propWithIndex: 35 ]
                    , [ ESOmnitureVariable propWithIndex: 36 ]
                    , [ ESOmnitureVariable propWithIndex: 37 ]
                    , [ ESOmnitureVariable propWithIndex: 38 ]
                    , [ ESOmnitureVariable propWithIndex: 39 ]
                    , [ ESOmnitureVariable propWithIndex: 40 ]
                    , [ ESOmnitureVariable propWithIndex: 41 ]
                    , [ ESOmnitureVariable propWithIndex: 42 ]
                    , [ ESOmnitureVariable propWithIndex: 43 ]
                    , [ ESOmnitureVariable propWithIndex: 44 ]
                    , [ ESOmnitureVariable propWithIndex: 45 ]
                    , [ ESOmnitureVariable propWithIndex: 46 ]
                    , [ ESOmnitureVariable propWithIndex: 47 ]
                    , [ ESOmnitureVariable propWithIndex: 48 ]
                    , [ ESOmnitureVariable propWithIndex: 49 ]
                    , [ ESOmnitureVariable propWithIndex: 50 ]
                    //Variables
                    , [ ESOmnitureVariable eVarWithIndex: 1 ]
                    , [ ESOmnitureVariable eVarWithIndex: 2 ]
                    , [ ESOmnitureVariable eVarWithIndex: 3 ]
                    , [ ESOmnitureVariable eVarWithIndex: 4 ]
                    , [ ESOmnitureVariable eVarWithIndex: 5 ]
                    , [ ESOmnitureVariable eVarWithIndex: 6 ]
                    , [ ESOmnitureVariable eVarWithIndex: 7 ]
                    , [ ESOmnitureVariable eVarWithIndex: 8 ]
                    , [ ESOmnitureVariable eVarWithIndex: 9 ]
                    , [ ESOmnitureVariable eVarWithIndex: 10 ]
                    , [ ESOmnitureVariable eVarWithIndex: 11 ]
                    , [ ESOmnitureVariable eVarWithIndex: 12 ]
                    , [ ESOmnitureVariable eVarWithIndex: 13 ]
                    , [ ESOmnitureVariable eVarWithIndex: 14 ]
                    , [ ESOmnitureVariable eVarWithIndex: 15 ]
                    , [ ESOmnitureVariable eVarWithIndex: 16 ]
                    , [ ESOmnitureVariable eVarWithIndex: 17 ]
                    , [ ESOmnitureVariable eVarWithIndex: 18 ]
                    , [ ESOmnitureVariable eVarWithIndex: 19 ]
                    , [ ESOmnitureVariable eVarWithIndex: 20 ]
                    , [ ESOmnitureVariable eVarWithIndex: 21 ]
                    , [ ESOmnitureVariable eVarWithIndex: 22 ]
                    , [ ESOmnitureVariable eVarWithIndex: 23 ]
                    , [ ESOmnitureVariable eVarWithIndex: 24 ]
                    , [ ESOmnitureVariable eVarWithIndex: 25 ]
                    , [ ESOmnitureVariable eVarWithIndex: 26 ]
                    , [ ESOmnitureVariable eVarWithIndex: 27 ]
                    , [ ESOmnitureVariable eVarWithIndex: 28 ]
                    , [ ESOmnitureVariable eVarWithIndex: 29 ]
                    , [ ESOmnitureVariable eVarWithIndex: 30 ]
                    , [ ESOmnitureVariable eVarWithIndex: 31 ]
                    , [ ESOmnitureVariable eVarWithIndex: 32 ]
                    , [ ESOmnitureVariable eVarWithIndex: 33 ]
                    , [ ESOmnitureVariable eVarWithIndex: 34 ]
                    , [ ESOmnitureVariable eVarWithIndex: 35 ]
                    , [ ESOmnitureVariable eVarWithIndex: 36 ]
                    , [ ESOmnitureVariable eVarWithIndex: 37 ]
                    , [ ESOmnitureVariable eVarWithIndex: 38 ]
                    , [ ESOmnitureVariable eVarWithIndex: 39 ]
                    , [ ESOmnitureVariable eVarWithIndex: 40 ]
                    , [ ESOmnitureVariable eVarWithIndex: 41 ]
                    , [ ESOmnitureVariable eVarWithIndex: 42 ]
                    , [ ESOmnitureVariable eVarWithIndex: 43 ]
                    , [ ESOmnitureVariable eVarWithIndex: 44 ]
                    , [ ESOmnitureVariable eVarWithIndex: 45 ]
                    , [ ESOmnitureVariable eVarWithIndex: 46 ]
                    , [ ESOmnitureVariable eVarWithIndex: 47 ]
                    , [ ESOmnitureVariable eVarWithIndex: 48 ]
                    , [ ESOmnitureVariable eVarWithIndex: 49 ]
                    , [ ESOmnitureVariable eVarWithIndex: 50 ]
                    , [ ESRequiredOmnitureVariable variableWithName: @"s" value: [ self screenSize ] ]
                    , [ ESRequiredOmnitureVariable variableWithName: @"c" value: @"24" ]
                    , [ ESRequiredOmnitureVariable variableWithName: @"AQE" value: @"1" ]
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
   
   return nil;
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

