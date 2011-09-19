#import <Foundation/Foundation.h>

@interface ESOmnitureContext : NSObject< NSCopying >
{
@private
   NSArray* _variables;
}

+(id)context;
+(id)contextWithContext:( ESOmnitureContext* )context_;

-(void)setVariableValue:( NSString* )value_ withName:( NSString* )name_;
-(NSString*)variableValueWithName:( NSString* )name_;

-(NSString*)urlArguments;

@end
