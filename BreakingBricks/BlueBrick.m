//
//  BlueBrick.m
//  BreakingBricks
//
//  Created by Justin Smith on 8/1/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "BlueBrick.h"

@implementation BlueBrick

+ (instancetype)initWithXPosition:(CGFloat)xPos yPosition:(CGFloat)yPos {
    BlueBrick *blueBrick = (BlueBrick *)[SKSpriteNode spriteNodeWithImageNamed:@"lightBlueBrick"];
    
    blueBrick.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:blueBrick.frame.size];
    blueBrick.physicsBody.dynamic = NO;
    blueBrick.physicsBody.categoryBitMask = blueBrickCategory;
    
    blueBrick.position = CGPointMake(xPos, yPos);
    
    return blueBrick;
}

@end
