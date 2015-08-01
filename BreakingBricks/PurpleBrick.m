//
//  PurpleBrick.m
//  BreakingBricks
//
//  Created by Justin Smith on 8/1/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "PurpleBrick.h"

@implementation PurpleBrick

+ (instancetype)initWithXPosition:(CGFloat)xPos yPosition:(CGFloat)yPos {
    PurpleBrick *purpleBrick = (PurpleBrick *)[SKSpriteNode spriteNodeWithImageNamed:@"purpleBrick"];
    
    purpleBrick.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:purpleBrick.frame.size];
    purpleBrick.physicsBody.dynamic = NO;
    purpleBrick.physicsBody.categoryBitMask = purpleBrickCategory;
    
    purpleBrick.position = CGPointMake(xPos, yPos);
    
    return purpleBrick;
}

@end
