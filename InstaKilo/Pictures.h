//
//  Pictures.h
//  InstaKilo
//
//  Created by Will Chew on 2018-06-20.
//  Copyright © 2018 Will Chew. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Pictures : NSObject

@property (nonatomic) UIImage *image;
@property (nonatomic,copy) NSString *name;

-(instancetype)initWithImage:(UIImage*)image name: (NSString*)name;

@end
