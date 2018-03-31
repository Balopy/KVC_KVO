//
//  BLPerson.h
//  KVO_KVC
//
//  Created by 王春龙 on 2018/3/31.
//  Copyright © 2018年 Balopy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BLSon;
@interface BLPerson : NSObject



@property (nonatomic, copy) NSString *bl_age;
@property (nonatomic, copy) NSString *bl_name;
@property (nonatomic, copy) NSString *bl_height;
@property (nonatomic, copy) NSString *bl_gender;

@property (nonatomic, strong) BLSon *son;
@end
