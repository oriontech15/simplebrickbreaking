//
//  PurpleBrick.h
//  BreakingBricks
//
//  Created by Justin Smith on 8/1/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

static const uint32_t purpleBrickCategory = 0x1 << 4;

@interface PurpleBrick : SKSpriteNode

+ (instancetype)initWithXPosition:(CGFloat)xPos yPosition:(CGFloat)yPos;

@end
