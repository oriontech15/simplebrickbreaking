//
//  HomeScreen.m
//  BreakingBricks
//
//  Created by Justin Smith on 8/1/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "HomeScreen.h"
#import "UIKit/UIKit.h"

@implementation HomeScreen

-(void)didMoveToView:(SKView *)view
{
    self.backgroundColor = [SKColor blackColor];
    
    [self playButton];
    [self scoresButton];
}

-(void)playButton
{
    SKSpriteNode *start = [SKSpriteNode spriteNodeWithImageNamed:@"play"];
    start.name = @"playButton";//how the node is identified later
    start.zPosition = 1.0;
    start.position = CGPointMake(self.size.width / 2, self.size.height / 2 + 70);
    
    [self addChild:start];
}

-(void)scoresButton
{
    SKSpriteNode *scores = [SKSpriteNode spriteNodeWithImageNamed:@"scoresX"];
    scores.name = @"scoresButton";//how the node is identified later
    scores.zPosition = 1.0;
    scores.position = CGPointMake(self.size.width / 2, self.size.height / 2 - 70);
    
    [self addChild:scores];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    //if fire button touched, bring the rain
    if ([node.name isEqualToString:@"playButton"]) {
        GameScene *newGame = [GameScene sceneWithSize:self.frame.size];
        newGame.isPlaying = YES;
        [self.view presentScene:newGame transition:[SKTransition flipHorizontalWithDuration:1.5]];
    }
    
    if ([node.name isEqualToString:@"scoresButton"]) {
        ScoresScene *scoresScene = [ScoresScene sceneWithSize:self.frame.size];
        [self.view presentScene:scoresScene transition:[SKTransition flipHorizontalWithDuration:1.5]];
    }
}

@end
