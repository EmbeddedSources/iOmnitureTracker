#import <Foundation/Foundation.h>

@interface ESOmnitureContext : NSObject
{
@private
   NSArray* _variables;
}

+(id)context;

-(void)setVariableValue:( NSString* )value_ withName:( NSString* )name_;

-(NSString*)variableValueWithName:( NSString* )name_;

-(NSString*)urlArguments;

@end
