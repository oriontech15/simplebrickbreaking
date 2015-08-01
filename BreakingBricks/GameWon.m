//
//  GameWon.m
//  BreakingBricks
//
//  Created by Justin Smith on 7/30/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "GameWon.h"
#import "GameScene.h"

@implementation GameWon

-(void)didMoveToView:(SKView *)view
{
    
    
    SKLabelNode *winLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
    winLabel.text = @"You Won!";
    winLabel.fontColor = [SKColor colorWithRed:0.000f green:1.000f blue:0.590f alpha:1.00f]; //Light Green];
    winLabel.fontSize = 55;
    winLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:winLabel];
    
    SKLabelNode *tryAgain = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
    tryAgain.text = @"Tap Anywhere To Play Again";
    tryAgain.fontColor =  [SKColor colorWithRed:0.149 green:0.604 blue:0.859 alpha:1.000]; //DevMountain Blue; //Light Green
    tryAgain.fontSize = 21;
    tryAgain.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height + 50);
    
    SKAction *moveLabel = [SKAction moveToY:(self.frame.size.height / 2 - 60) duration:1.3];
    [tryAgain runAction:moveLabel];
    
    [self addChild:tryAgain];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    GameScene *newGame = [GameScene sceneWithSize:self.frame.size];
    newGame.isPlaying = YES;
    [self.view presentScene:newGame transition:[SKTransition flipHorizontalWithDuration:1.5]];
}

@end
