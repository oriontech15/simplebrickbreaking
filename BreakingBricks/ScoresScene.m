//
//  ScoresScene.m
//  BreakingBricks
//
//  Created by Justin Smith on 8/2/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "ScoresScene.h"

@implementation ScoresScene

-(void)didMoveToView:(SKView *)view
{
    self.backgroundColor = [SKColor blackColor];
    
    [self okButtonBackToHomeScreen];
    
    int yPos = self.size.height - 10;
    
    for (NSNumber *score in self.scorsArray) {
        SKLabelNode *scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)score];
        scoreLabel.fontColor = [SKColor whiteColor];
        scoreLabel.fontSize = 20;
        scoreLabel.position = CGPointMake(70, yPos - 40);
        
        [self addChild:scoreLabel];
    }
}

-(void)okButtonBackToHomeScreen
{
    
    SKSpriteNode *start = [SKSpriteNode spriteNodeWithImageNamed:@"done"];
    start.name = @"doneButton";//how the node is identified later
    start.zPosition = 1.0;
    start.position = CGPointMake(self.size.width / 2, self.size.height / 4 - 100);

    [self addChild:start];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"doneButton"]) {
        HomeScreen *toHome = [HomeScreen sceneWithSize:self.frame.size];
        [self.view presentScene: toHome transition:[SKTransition flipHorizontalWithDuration:1.5]];
    }
}

@end
