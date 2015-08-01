//
//  redBrick.m
//  BreakingBricks
//
//  Created by Justin Smith on 7/31/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "RedBrick.h"

@implementation RedBrick

+ (instancetype)initWithXPosition:(CGFloat)xPos yPosition:(CGFloat)yPos {
    RedBrick *redBrick = (RedBrick *)[SKSpriteNode spriteNodeWithImageNamed:@"redBrick"];
    
    redBrick.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:redBrick.frame.size];
    redBrick.physicsBody.dynamic = NO;
    redBrick.physicsBody.categoryBitMask = redBrickCategory;
    
    redBrick.position = CGPointMake(xPos, yPos);

    return redBrick;
}

@end
