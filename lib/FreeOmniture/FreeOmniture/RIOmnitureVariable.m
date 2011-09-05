#import "RIOmnitureVariable.h"

#import <JFFUtils/NSArray/NSArray+BlocksAdditions.h>

NSString* const RIOmnitureVariableTimestamp = @"t";
NSString* const RIOmnitureVariableVisitorId = @"vid";
NSString* const RIOmnitureVariableVisitorNamespace = @"ns";
NSString* const RIOmnitureVariablePageName = @"pageName";
NSString* const RIOmnitureVariableEvents = @"events";

@interface RIOmnitureVariable ()

@property ( nonatomic, copy ) NSString* name;

-(NSString*)argumentValue;

@end


@implementation RIOmnitureVariable

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

-(NSString*)argumentValue
{
   if ( self.value )
   {
      return [ self.name stringByAppendingFormat: @"=%@", self.value ];
   }

   return nil;
}

@end

@interface RIRequiredOmnitureVariable : RIOmnitureVariable

@end

@implementation RIRequiredOmnitureVariable

-(NSString*)argumentValue
{
   NSString* result_ = [ super argumentValue ];

   NSAssert1( result_, @"Omniture variable: '%@' is required", self.name );

   return result_;
}

@end


@interface RIOmnitureContext ()

@property ( nonatomic, retain ) NSArray* variables;

@end

@implementation RIOmnitureContext

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
      _variables = [ [ NSArray alloc ] initWithObjects: [ RIRequiredOmnitureVariable variableWithName: @"AQB" value: @"1" ]
                    , [ RIRequiredOmnitureVariable variableWithName: @"ndh" value: @"1" ]
                    , [ RIRequiredOmnitureVariable variableWithName: RIOmnitureVariableTimestamp ]
                    , [ RIRequiredOmnitureVariable variableWithName: RIOmnitureVariableVisitorId value: [ self defaultVisitorId ] ]
                    , [ RIRequiredOmnitureVariable variableWithName: @"ce" value: @"UTF-8" ]
                    , [ RIRequiredOmnitureVariable variableWithName: RIOmnitureVariableVisitorNamespace ]
                    , [ RIRequiredOmnitureVariable variableWithName: RIOmnitureVariablePageName value: [ self applicationIdentifier ] ]
                    , [ RIOmnitureVariable variableWithName: RIOmnitureVariableEvents ]
                    //Properties
                    , [ RIOmnitureVariable variableWithName: @"c1" ]
                    , [ RIOmnitureVariable variableWithName: @"c2" ]
                    , [ RIOmnitureVariable variableWithName: @"c3" ]
                    , [ RIOmnitureVariable variableWithName: @"c4" ]
                    , [ RIOmnitureVariable variableWithName: @"c5" ]
                    , [ RIOmnitureVariable variableWithName: @"c6" ]
                    , [ RIOmnitureVariable variableWithName: @"c7" ]
                    , [ RIOmnitureVariable variableWithName: @"c8" ]
                    , [ RIOmnitureVariable variableWithName: @"c9" ]
                    , [ RIOmnitureVariable variableWithName: @"c10" ]
                    , [ RIOmnitureVariable variableWithName: @"c11" ]
                    , [ RIOmnitureVariable variableWithName: @"c12" ]
                    , [ RIOmnitureVariable variableWithName: @"c13" ]
                    , [ RIOmnitureVariable variableWithName: @"c14" ]
                    , [ RIOmnitureVariable variableWithName: @"c15" ]
                    , [ RIOmnitureVariable variableWithName: @"c16" ]
                    , [ RIOmnitureVariable variableWithName: @"c17" ]
                    , [ RIOmnitureVariable variableWithName: @"c18" ]
                    , [ RIOmnitureVariable variableWithName: @"c19" ]
                    , [ RIOmnitureVariable variableWithName: @"c20" ]
                    , [ RIOmnitureVariable variableWithName: @"c21" ]
                    , [ RIOmnitureVariable variableWithName: @"c22" ]
                    , [ RIOmnitureVariable variableWithName: @"c23" ]
                    , [ RIOmnitureVariable variableWithName: @"c24" ]
                    , [ RIOmnitureVariable variableWithName: @"c25" ]
                    , [ RIOmnitureVariable variableWithName: @"c26" ]
                    , [ RIOmnitureVariable variableWithName: @"c27" ]
                    , [ RIOmnitureVariable variableWithName: @"c28" ]
                    , [ RIOmnitureVariable variableWithName: @"c29" ]
                    , [ RIOmnitureVariable variableWithName: @"c30" ]
                    , [ RIOmnitureVariable variableWithName: @"c31" ]
                    , [ RIOmnitureVariable variableWithName: @"c32" ]
                    , [ RIOmnitureVariable variableWithName: @"c33" ]
                    , [ RIOmnitureVariable variableWithName: @"c34" ]
                    , [ RIOmnitureVariable variableWithName: @"c35" ]
                    , [ RIOmnitureVariable variableWithName: @"c36" ]
                    , [ RIOmnitureVariable variableWithName: @"c37" ]
                    , [ RIOmnitureVariable variableWithName: @"c38" ]
                    , [ RIOmnitureVariable variableWithName: @"c39" ]
                    , [ RIOmnitureVariable variableWithName: @"c40" ]
                    , [ RIOmnitureVariable variableWithName: @"c41" ]
                    , [ RIOmnitureVariable variableWithName: @"c42" ]
                    , [ RIOmnitureVariable variableWithName: @"c43" ]
                    , [ RIOmnitureVariable variableWithName: @"c44" ]
                    , [ RIOmnitureVariable variableWithName: @"c45" ]
                    , [ RIOmnitureVariable variableWithName: @"c46" ]
                    , [ RIOmnitureVariable variableWithName: @"c47" ]
                    , [ RIOmnitureVariable variableWithName: @"c48" ]
                    , [ RIOmnitureVariable variableWithName: @"c49" ]
                    , [ RIOmnitureVariable variableWithName: @"c50" ]
                    //Variables
                    , [ RIOmnitureVariable variableWithName: @"v1" ]
                    , [ RIOmnitureVariable variableWithName: @"v2" ]
                    , [ RIOmnitureVariable variableWithName: @"v3" ]
                    , [ RIOmnitureVariable variableWithName: @"v4" ]
                    , [ RIOmnitureVariable variableWithName: @"v5" ]
                    , [ RIOmnitureVariable variableWithName: @"v6" ]
                    , [ RIOmnitureVariable variableWithName: @"v7" ]
                    , [ RIOmnitureVariable variableWithName: @"v8" ]
                    , [ RIOmnitureVariable variableWithName: @"v9" ]
                    , [ RIOmnitureVariable variableWithName: @"v10" ]
                    , [ RIOmnitureVariable variableWithName: @"v11" ]
                    , [ RIOmnitureVariable variableWithName: @"v12" ]
                    , [ RIOmnitureVariable variableWithName: @"v13" ]
                    , [ RIOmnitureVariable variableWithName: @"v14" ]
                    , [ RIOmnitureVariable variableWithName: @"v15" ]
                    , [ RIOmnitureVariable variableWithName: @"v16" ]
                    , [ RIOmnitureVariable variableWithName: @"v17" ]
                    , [ RIOmnitureVariable variableWithName: @"v18" ]
                    , [ RIOmnitureVariable variableWithName: @"v19" ]
                    , [ RIOmnitureVariable variableWithName: @"v20" ]
                    , [ RIOmnitureVariable variableWithName: @"v21" ]
                    , [ RIOmnitureVariable variableWithName: @"v22" ]
                    , [ RIOmnitureVariable variableWithName: @"v23" ]
                    , [ RIOmnitureVariable variableWithName: @"v24" ]
                    , [ RIOmnitureVariable variableWithName: @"v25" ]
                    , [ RIOmnitureVariable variableWithName: @"v26" ]
                    , [ RIOmnitureVariable variableWithName: @"v27" ]
                    , [ RIOmnitureVariable variableWithName: @"v28" ]
                    , [ RIOmnitureVariable variableWithName: @"v29" ]
                    , [ RIOmnitureVariable variableWithName: @"v30" ]
                    , [ RIOmnitureVariable variableWithName: @"v31" ]
                    , [ RIOmnitureVariable variableWithName: @"v32" ]
                    , [ RIOmnitureVariable variableWithName: @"v33" ]
                    , [ RIOmnitureVariable variableWithName: @"v34" ]
                    , [ RIOmnitureVariable variableWithName: @"v35" ]
                    , [ RIOmnitureVariable variableWithName: @"v36" ]
                    , [ RIOmnitureVariable variableWithName: @"v37" ]
                    , [ RIOmnitureVariable variableWithName: @"v38" ]
                    , [ RIOmnitureVariable variableWithName: @"v39" ]
                    , [ RIOmnitureVariable variableWithName: @"v40" ]
                    , [ RIOmnitureVariable variableWithName: @"v41" ]
                    , [ RIOmnitureVariable variableWithName: @"v42" ]
                    , [ RIOmnitureVariable variableWithName: @"v43" ]
                    , [ RIOmnitureVariable variableWithName: @"v44" ]
                    , [ RIOmnitureVariable variableWithName: @"v45" ]
                    , [ RIOmnitureVariable variableWithName: @"v46" ]
                    , [ RIOmnitureVariable variableWithName: @"v47" ]
                    , [ RIOmnitureVariable variableWithName: @"v48" ]
                    , [ RIOmnitureVariable variableWithName: @"v49" ]
                    , [ RIOmnitureVariable variableWithName: @"v50" ]
                    , [ RIRequiredOmnitureVariable variableWithName: @"s" value: [ self screenSize ] ]
                    , [ RIRequiredOmnitureVariable variableWithName: @"c" value: @"24" ]
                    , [ RIRequiredOmnitureVariable variableWithName: @"AQE" value: @"1" ]
                    , nil
                    ];
   }
   
   return _variables;
}

-(RIOmnitureVariable*)variableWithName:( NSString* )name_
{
   RIOmnitureVariable* variable_ = [ self.variables firstMatch: ^( id v_ )
   {
      return (BOOL)[ name_ isEqualToString: [ v_ name ] ];
   }
   ];

   return variable_;
}

-(NSString*)urlArguments
{
   NSMutableArray* values_ = [ NSMutableArray array ];
   
   for ( RIOmnitureVariable* variable_ in self.variables )
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
   NSString* arguments_ = @"[\n";
   
   for ( RIOmnitureVariable* variable_ in self.variables )
   {
      if ( variable_.value )
      {
         arguments_ = [ arguments_ stringByAppendingFormat: @"\t%@ = '%@';\n", variable_.name, variable_.value ];
      }
   }
   
   return [ arguments_ stringByAppendingFormat: @"]" ];
}

@end

