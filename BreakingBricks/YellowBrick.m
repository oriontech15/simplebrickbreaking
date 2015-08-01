//
//  YellowBrick.m
//  BreakingBricks
//
//  Created by Justin Smith on 8/1/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "YellowBrick.h"

@implementation YellowBrick

+ (instancetype)initWithXPosition:(CGFloat)xPos yPosition:(CGFloat)yPos {
    YellowBrick *yellowBrick = (YellowBrick *)[SKSpriteNode spriteNodeWithImageNamed:@"yellowBrick"];
    
    yellowBrick.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:yellowBrick.frame.size];
    yellowBrick.physicsBody.dynamic = NO;
    yellowBrick.physicsBody.categoryBitMask = yellowBrickCategory;
    
    yellowBrick.position = CGPointMake(xPos, yPos);
    
    return yellowBrick;
}

@end
