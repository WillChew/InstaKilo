//
//  Pictures.m
//  InstaKilo
//
//  Created by Will Chew on 2018-06-20.
//  Copyright © 2018 Will Chew. All rights reserved.
//

#import "Pictures.h"


@implementation Pictures

-(instancetype)initWithImage:(UIImage *)image name:(NSString *)name {
    if (self = [super init]) {
        _image = image;
        _name = name;
    }
    return self;
}

@end
