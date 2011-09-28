#import <Foundation/Foundation.h>

@class ESOmniture;

/** App Measurement for iPhone supports a plug-in architecture that lets you build custom plug-ins that extend App Measurement for iPhone functionality.
 It implements the Objective-C delegate design pattern.
 Use this functionality to modify the App Measurement for iPhone object to manipulate data before sending it to Omniture collection servers.
 
 
 The following example demonstrates how this is done:


       omniture_.usePlugins = YES;
       omniture_.delegate = [ MyDelegate delegate ];
       [ omniture_ track ];

 
       @interface MyDelegate : NSObject<ESOmnitureDelegate>
 
       -(void)omnitureDoPlugins:( ESOmniture* )omniture_
       {
         //custom code
         omniture_.prop4 = @"plugin";
       }

       @end

 */

@protocol ESOmnitureDelegate< NSObject >

/** Is Called before every omniture call, if [ESOmniture usePlugins] is YES
 @param omniture_ Omniture instance for what plugins should be applied
 */
-(void)omnitureDoPlugins:( ESOmniture* )omniture_;

@end
