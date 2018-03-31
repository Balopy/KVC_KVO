//
//  BLPerson.m
//  KVO_KVC
//
//  Created by 王春龙 on 2018/3/31.
//  Copyright © 2018年 Balopy. All rights reserved.
//

#import "BLPerson.h"

@interface BLPerson ()

@property (nonatomic, copy) NSString *friend;
@property (nonatomic, copy) NSString *girl;
@property (nonatomic, copy) NSString *wife;

@end


@implementation BLPerson
{
    NSString *_father;
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"\nfriend-%@\n girl-%@\n wife-%@\n father-%@", _friend, _girl, _wife, _father];
}

@end
