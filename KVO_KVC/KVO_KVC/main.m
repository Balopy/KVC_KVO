//
//  main.m
//  KVO_KVC
//
//  Created by 王春龙 on 2018/3/31.
//  Copyright © 2018年 Balopy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLPerson.h"
#import "BLSon.h"

void KVCMethod(void);
void KVOUseMethod(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        //KVC
        KVCMethod();
        
        //KVO
        KVOUseMethod();
    }
    return 0;
}
void KVOUseMethod(void) {
    /*! KVO，即key-value-observing,
     * 利用一个key来找到某个属性并监听其值得改变。其实这也是一种典型的观察者模式。
     *
     * 用法
     *1. 添加观察者
     *2. 在观察者中实现监听方法，observeValueForKeyPath: ofObject: change: context:（这个方法属于NSObject, 绝大多数对象都有这个方法）
     *3. 移除观察者
     *
     */
    
    BLSon *son = [[BLSon alloc] init];
    son.sonName = @"你是我的小儿子，也是小兔兔";
    son.sonWife = @"小孩子";
}



void KVCMethod(void) {
    
    /*! KVC
     * 就是key-value-coding,即键值编码，通常是用来给某一个对象的属性进行赋值。
     * 不管这个属性是公开的还是私有的，只要能获取到属性的key值就可以给他赋值
     * 属性或实例变量，key 值可以用 “_属性名” 也可以 用 “属性名”
     *
     * - (id)valueForKey:(NSString *)key;
     * - (void)setValue:(id)value forKey:(NSString *)key;
     * - (id)valueForKeyPath:(NSString *)keyPath;
     * - (void)setValue:(id)value forKeyPath:(NSString *)keyPath;
     
     * forKey 与 forKeyPath 两者的区别，在于层次，forKey 只能对某个对象的属性赋值，但不能对对象中属性的属性赋值。但是 forKeyPath 皆可
     * 所以我们在使用的时候，推荐使用 [setValue:forKeyPath:]
     *
     *  字典转模型，可以用 KVC的 setValuesForKeysWithDictionary 方法。
     *  但是要注意
     * 1. 字典转模型的时候,字典中的某一个key一定要在模型中有对应的属性
     * 2. 如果一个模型中包含了另外的模型对象,是不能直接转化成功的。
     * 3. 通过kvc转化模型中的模型,也是不能直接转化成功的。
     */
    BLPerson *person = [[BLPerson alloc] init];
    //赋值
    [person setValue:@"王春龙" forKey:@"bl_name"];
    [person setValue:@"183" forKey:@"bl_height"];
    [person setValue:@"于小妹" forKey:@"_friend"];
    [person setValue:@"于小妹" forKeyPath:@"_wife"];
    [person setValue:@"于小妹" forKeyPath:@"_girl"];
    [person setValue:@"爸爸" forKeyPath:@"father"];
    
    person.son = [BLSon new];
    [person setValue:@"你是我儿子" forKeyPath:@"son.sonName"];
    
    //取值
    NSLog(@"---%@---%@", person.bl_name, person.son.sonName);
    NSLog(@"%@", [person description]);
    
    NSString *blname = [person valueForKey:@"bl_name"];
    NSString *sonName = [person valueForKeyPath:@"son.sonName"];
    
    NSLog(@"取值---%@---son-%@", blname, sonName);
}


