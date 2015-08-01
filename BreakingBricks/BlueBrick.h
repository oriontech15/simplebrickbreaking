//
//  BlueBrick.h
//  BreakingBricks
//
//  Created by Justin Smith on 8/1/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

static const uint32_t blueBrickCategory = 0x1 << 3;

@interface BlueBrick : SKSpriteNode

+ (instancetype)initWithXPosition:(CGFloat)xPos yPosition:(CGFloat)yPos;

@end
