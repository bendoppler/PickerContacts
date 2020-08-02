//
//  ContactTableViewDelegateSendSMSProtocol.h
//  Contacts
//
//  Created by Do Thai Bao on 8/2/20.
//  Copyright © 2020 Do Thai Bao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ContactTableViewDelegateSendSMSDelegate <NSObject>

-(void) updateSMSButtonWithState:(NSString *)state;

@end

NS_ASSUME_NONNULL_END
