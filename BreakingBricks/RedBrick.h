//
//  redBrick.h
//  BreakingBricks
//
//  Created by Justin Smith on 7/31/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

static const uint32_t redBrickCategory = 0x1 << 2;

@interface RedBrick : SKSpriteNode

+ (instancetype)initWithXPosition:(CGFloat)xPos yPosition:(CGFloat)yPos;

@end
