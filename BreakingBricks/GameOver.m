//
//  GameOver.m
//  BreakingBricks
//
//  Created by Justin Smith on 7/30/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "GameOver.h"
#import "GameScene.h"

@implementation GameOver

-(void)didMoveToView:(SKView *)view
{
    self.backgroundColor = [SKColor blackColor];
    
    SKLabelNode *gameOverLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
    gameOverLabel.text = @"Game \u2639ver";
    gameOverLabel.fontColor = [SKColor redColor];
    gameOverLabel.fontSize = 50;
    gameOverLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    [self addChild:gameOverLabel];
    SKAction *playEndGameSFX = [SKAction playSoundFileNamed:@"gameover.caf" waitForCompletion:NO];
    [self runAction:playEndGameSFX];

    
    SKLabelNode *tryAgain = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
    tryAgain.text = @"Tap Anywhere To Play Again";
    tryAgain.fontColor =  [SKColor colorWithRed:0.000f green:1.000f blue:0.590f alpha:1.00f]; //Light Green
    tryAgain.fontSize = 21;
    tryAgain.position = CGPointMake(self.frame.size.width /2, - 50);
    
    SKAction *moveLabel = [SKAction moveToY:(self.frame.size.height /2 - 60) duration:1.3];
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
