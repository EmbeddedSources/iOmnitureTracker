#import "ESOmnitureVariable.h"

#import "NSString+OmnitureEscape.h"

NSString* const ESOmnitureVariableTimestamp = @"t";
NSString* const ESOmnitureVariableVisitorId = @"vid";
NSString* const ESOmnitureVariableVisitorNamespace = @"ns";
NSString* const ESOmnitureVariablePageName = @"pageName";
NSString* const ESOmnitureVariableEvents = @"events";
NSString* const ESOmnitureVariableCharset = @"ce";

NSString* ESOmnitureVariableEVar( NSUInteger index_ )
{
   return [ NSString stringWithFormat: @"v%d", index_ ];
}

NSString* ESOmnitureVariableProp( NSUInteger index_ )
{
   return [ NSString stringWithFormat: @"c%d", index_ ];
}

@interface ESOmnitureVariable ()

@property ( nonatomic, copy, getter=name ) NSString* mutableName;
@property ( nonatomic, copy, getter=value ) NSString* mutableValue;

@end

@implementation ESOmnitureVariable

@synthesize mutableName = _name;
@synthesize mutableValue = _value;

@dynamic name, value;

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
   
   self.mutableName = name_;
   self.mutableValue = value_;
   
   return self;
}

+(id)variableWithName:( NSString* )name_
                value:( NSString* )value_
{
   return [ [ [ self alloc ] initWithName: name_ value: value_ ] autorelease ];
}

-(BOOL)isDefined
{
   return [ self.value length ] > 0;
}

-(NSString*)argumentValue
{
   if ( [ self isDefined ] )
   {
      return [ self.name stringByAppendingFormat: @"=%@", [ self.value stringByAddingOmnitureEscapes ] ];
   }
   
   return nil;
}

@end


@implementation ESMutableOmnitureVariable

@dynamic value;

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

-(void)setValue:( NSString* )value_
{
   self.mutableValue = value_;
}

@end

@implementation ESRequiredOmnitureVariable

-(NSString*)argumentValue
{
   NSString* result_ = [ super argumentValue ];

   NSAssert1( result_, @"Omniture variable: '%@' is required", self.name );

   return result_;
}

@end
