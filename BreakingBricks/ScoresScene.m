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
    
    SKLabelNode *highScoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
    highScoreLabel.text = @"High Scores";
    highScoreLabel.fontColor = [SKColor colorWithRed:0.149 green:0.604 blue:0.859 alpha:1.000];
    highScoreLabel.fontSize = 35;
    highScoreLabel.position = CGPointMake(self.size.width / 2, self.size.height - 80);
    
    [self addChild:highScoreLabel];
    
    NSArray *sortedArray;
    
    NSSortDescriptor *sorter = [NSSortDescriptor sortDescriptorWithKey:@"totalScore" ascending:NO];
    
    sortedArray = [[[ScoresController sharedInstance] scores] sortedArrayUsingDescriptors:@[sorter]];
    float amount = 7;
    if ([[ScoresController sharedInstance] scores].count < 7) {
        amount = [[ScoresController sharedInstance] scores].count;
    }
    for (int i = 0; i < amount; i++)
    {
        int y = amount - (i+1);
        NSLog(@"scores count: %lu", (unsigned long)[[ScoresController sharedInstance] scores].count);
        int yPos = (self.size.height / 6) + (y * 71);
        NSLog(@"y:pos %d", y);

        Score *score = sortedArray[i];
        
        //NSLog(@"%@", sortedArray[i]);
        
        SKLabelNode *scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)[score.totalScore integerValue]];
        scoreLabel.fontColor = [SKColor whiteColor];
        scoreLabel.fontSize = 20;
        scoreLabel.position = CGPointMake(self.size.width / 2, yPos);
        [self addChild:scoreLabel];
    }
    
    [[ScoresController sharedInstance] save];
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
