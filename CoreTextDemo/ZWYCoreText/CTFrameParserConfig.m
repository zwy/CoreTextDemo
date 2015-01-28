//
//  CTFrameParserConfig.m
//  CoreTextDemo
//
//  Created by zwy on 15/1/28.
//  Copyright (c) 2015年 zwy. All rights reserved.
//

#import "CTFrameParserConfig.h"

@implementation CTFrameParserConfig

- (id)init {
    self = [super init];
    if (self) {
        _width = 200.0f;
        _fontSize = 16.0f;
        _lineSpace = 8.0f;
        _textColor = RGB(108, 108, 108);
    }
    return self;
}

@end
