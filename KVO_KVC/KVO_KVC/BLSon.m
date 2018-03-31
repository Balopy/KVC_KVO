//
//  BLSon.m
//  KVO_KVC
//
//  Created by 王春龙 on 2018/3/31.
//  Copyright © 2018年 Balopy. All rights reserved.
//

#import "BLSon.h"

@implementation BLSon

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addObserver:self forKeyPath:@"sonName" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
   
    [change enumerateKeysAndObjectsUsingBlock:^(NSKeyValueChangeKey  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSLog(@"key-%@   obj-%@", key, object);
    }];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"\n sonName%@ \n sonWife%@", _sonName, _sonName];
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"sonName"];
}
@end
