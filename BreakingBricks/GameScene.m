//
//  GameScene.m
//  BreakingBricks
//
//  Created by Justin Smith on 7/28/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "UIKit/UIKit.h"
#import "GameScene.h"
#import "GameOver.h"
#import "GameWon.h"
#import "RedBrick.h"
#import "YellowBrick.h"
#import "BlueBrick.h"
#import "PurpleBrick.h"

@interface GameScene ()

@property (nonatomic) ScoresScene *scoreScene;
@property (nonatomic) SKSpriteNode *paddle;
@property (nonatomic) SKSpriteNode *ball;
@property (nonatomic) SKSpriteNode *numBalls1;
@property (nonatomic) SKSpriteNode *numBalls2;
@property (nonatomic) SKSpriteNode *numBalls3;
@property (nonatomic) SKLabelNode *scoreLabel;
@property (nonatomic) SKAction *playSFX;
@property (nonatomic) SKAction *playBrickSFX;
@property (nonatomic) SKAction *playEndGameSFX;
@property (nonatomic, assign) NSInteger brickCount;
@property (nonatomic) NSInteger ballCount;
@property (nonatomic) BOOL isBallInPlay;

@end

@implementation GameScene

-(void)didBeginContact:(SKPhysicsContact *)contact
{
    SKPhysicsBody *notTheBall;
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
    {
        notTheBall = contact.bodyB;
    }
    else
    {
        notTheBall = contact.bodyA;
    }
    
    if (notTheBall.categoryBitMask == redBrickCategory)
    {
        [self runAction:self.playBrickSFX];
        
        [notTheBall.node removeFromParent];
        
        [self updateScore:self.redScore];
        
        self.brickCount--;
    }
    
    if (notTheBall.categoryBitMask == purpleBrickCategory)
    {
        [self runAction:self.playBrickSFX];
        
        [notTheBall.node removeFromParent];
        
        [self updateScore:self.purpleScore];
        
        self.brickCount--;
    }
    
    if (notTheBall.categoryBitMask == yellowBrickCategory)
    {
        [self runAction:self.playBrickSFX];
        
        [notTheBall.node removeFromParent];
        
        [self updateScore:self.yellowScore];
        
        self.brickCount--;
    }
    
    if (notTheBall.categoryBitMask == blueBrickCategory)
    {
        [self runAction:self.playBrickSFX];
        
        [notTheBall.node removeFromParent];
        
        [self updateScore:self.lightBlueScore];
        
        self.brickCount--;
    }
    
    if (notTheBall.categoryBitMask == paddleCategory)
    {
        [self runAction:self.playSFX];
    }
    
    if (notTheBall.categoryBitMask == bottomEdgeCategory)
    {
        
        if (self.isBallInPlay == YES)
        {
            self.isBallInPlay = NO;
            [self.ball removeFromParent];
            
            self.ballCount--;
        }

        if (self.ballCount == 0)
        {
            GameOver *end = [GameOver sceneWithSize:self.frame.size];
            
            [self.view presentScene:end transition:[SKTransition doorsOpenHorizontalWithDuration:1.2]];
        }
    }
    
    if (self.brickCount == 0 && self.isPlaying)
    {
        self.isPlaying = NO;
        
        GameWon *win = [GameWon sceneWithSize:self.frame.size];
        [self.view presentScene:win transition:[SKTransition crossFadeWithDuration:1.2]];
    }
}

- (void)addBall
{
    self.ball = [SKSpriteNode spriteNodeWithImageNamed:@"tinyBall"];
    
    self.ball.position = CGPointMake(CGRectGetMidX(self.paddle.frame),
                                CGRectGetMidY(self.paddle.frame)+15);
    
    self.ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.ball.frame.size.width / 2];
    self.ball.physicsBody.friction = 0;
    self.ball.physicsBody.restitution = 1;
    self.ball.physicsBody.linearDamping = 0;
    
    self.ball.physicsBody.categoryBitMask = ballCategory;
    self.ball.physicsBody.contactTestBitMask = redBrickCategory | yellowBrickCategory | blueBrickCategory | purpleBrickCategory | paddleCategory | bottomEdgeCategory | topEdgeCategory;
    
    [self addChild:self.ball];
    
    if (self.isReady == YES)
    {
        sleep(1.5);
        [self applyVector];
    }
}

-(void)applyVector
{
    if (self.isReady == YES)
    {
        CGVector myVector = CGVectorMake([self getRandomNumberBetween:1 to:4], [self getRandomNumberBetween:1 to:4]);
        
        [self.ball.physicsBody applyImpulse:myVector];
    }
}

-(int)getRandomNumberBetween:(int)from to:(int)to
{
    
    return (int)from + arc4random() % (to-from+1);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        CGPoint newPosition = CGPointMake(location.x, 65);
        
        if (newPosition.x < (self.paddle.size.width / 2) + 10)
        {
            newPosition.x = (self.paddle.size.width / 2) + 10;
        }
        
        if (newPosition.x > (self.size.width - (self.paddle.size.width / 2) - 10))
        {
            newPosition.x = (self.size.width - (self.paddle.size.width / 2) - 10);
        }
        
        self.paddle.position = newPosition;
    }
}

-(void)addBricks
{
    for (int i = 0; i < 8; i++)
    {
        
        int xPos = self.size.width / 8.5 * (i+0.75);
        int yPos = self.size.height - 90;
        
        RedBrick *redBrick = [RedBrick initWithXPosition:xPos yPosition:yPos];
        self.redScore = 500;
        [self addChild:redBrick];
        
        BlueBrick *blueBrick = [BlueBrick initWithXPosition:xPos yPosition:yPos - 40];
        self.lightBlueScore = 400;
        [self addChild:blueBrick];
        
        blueBrick = [BlueBrick initWithXPosition:xPos yPosition:yPos - 80];
        [self addChild:blueBrick];
        
        YellowBrick *yellowBrick = [YellowBrick initWithXPosition:xPos yPosition:yPos - 120];
        self.yellowScore = 250;
        [self addChild:yellowBrick];
        
        yellowBrick = [YellowBrick initWithXPosition:xPos yPosition:yPos - 160];
        [self addChild:yellowBrick];
        
        PurpleBrick *purpleBrick = [PurpleBrick initWithXPosition:xPos yPosition:yPos - 200];
        self.purpleScore = 100;
        [self addChild:purpleBrick];
        
        purpleBrick = [PurpleBrick initWithXPosition:xPos yPosition:yPos - 240];
        [self addChild:purpleBrick];
    }
}

- (void)addBottomEdge
{
    SKNode *bottomEdge = [SKNode node];
    bottomEdge.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(0, 1) toPoint:CGPointMake(self.frame.size.width, 1)];
    bottomEdge.physicsBody.categoryBitMask = bottomEdgeCategory;
    [self addChild:bottomEdge];
}

- (void)addTopEdge
{
    SKNode *topEdge = [SKNode node];
    topEdge.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(0, self.size.height -50) toPoint:CGPointMake(self.frame.size.width, self.size.height - 50)];
    topEdge.physicsBody.categoryBitMask = topEdgeCategory;
    topEdge.physicsBody.contactTestBitMask = ballCategory;
    [self addChild:topEdge];
}

- (void)addPlayer
{
    self.paddle = [SKSpriteNode spriteNodeWithImageNamed:@"skinnyPaddle"];
    self.paddle.position = CGPointMake(self.size.width / 2, 65);
    self.paddle.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.paddle.frame.size];
    self.paddle.physicsBody.dynamic = NO;
    self.paddle.physicsBody.categoryBitMask = paddleCategory;
    
    [self addChild:self.paddle];
}

-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    self.backgroundColor = [SKColor blackColor];
    
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    self.physicsBody.categoryBitMask = edgeCategory;
    
    self.physicsWorld.gravity = CGVectorMake(0, 0);
    
    self.physicsWorld.contactDelegate = self;
    
    self.playSFX = [SKAction playSoundFileNamed:@"blip.caf" waitForCompletion:NO];
    self.playBrickSFX = [SKAction playSoundFileNamed:@"brickhit.caf" waitForCompletion:NO];
    
    self.brickCount = 56;
    self.ballCount = 3;
    
    self.isPlaying = NO;
    self.isReady = NO;
    self.isBallInPlay = NO;
    
    self.totalScore = 0;
    
    self.scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.totalScore];
    self.scoreLabel.fontColor = [SKColor whiteColor];
    self.scoreLabel.fontSize = 20;
    self.scoreLabel.position = CGPointMake(70, self.size.height -40);
    [self addChild:self.scoreLabel];
    
    SKLabelNode *lives = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
    lives.text = @"Lives:";
    lives.fontColor = [SKColor whiteColor];
    lives.fontSize = 17;
    lives.position = CGPointMake(self.frame.size.width - 130, self.size.height -40);
    [self addChild:lives];
    
    [self addLives];
    [self addPlayer];
    [self addBricks];
    [self addBottomEdge];
    [self addTopEdge];
}

-(void)addLives
{
    self.numBalls1 = [SKSpriteNode spriteNodeWithImageNamed:@"tinyBall"];
    self.numBalls1.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.numBalls1.frame.size.width / 2];
    self.numBalls1.position = CGPointMake(self.frame.size.width - 90, self.size.height - 35);
    self.numBalls1.physicsBody.dynamic = NO;
    self.numBalls1.physicsBody.contactTestBitMask = livesCategory;
        
    [self addChild:self.numBalls1];
    
    self.numBalls2 = [SKSpriteNode spriteNodeWithImageNamed:@"tinyBall"];
    self.numBalls2.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.numBalls1.frame.size.width / 2];
    self.numBalls2.position = CGPointMake(self.frame.size.width - 65, self.size.height - 35);
    self.numBalls2.physicsBody.dynamic = NO;
    self.numBalls2.physicsBody.contactTestBitMask = livesCategory;
    
    [self addChild:self.numBalls2];
    
    self.numBalls3 = [SKSpriteNode spriteNodeWithImageNamed:@"tinyBall"];
    self.numBalls3.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:self.numBalls1.frame.size.width / 2];
    self.numBalls3.position = CGPointMake(self.frame.size.width - 40, self.size.height - 35);
    self.numBalls3.physicsBody.dynamic = NO;
    self.numBalls3.physicsBody.contactTestBitMask = livesCategory;
    
    [self addChild:self.numBalls3];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.isReady = YES;
    
    if (self.isBallInPlay == NO)
    {
        [self addBall];
    }
    
    if (self.isBallInPlay == NO && self.ballCount == 3)
    {
        [self.numBalls1 removeFromParent];
    }
    
    if (self.isBallInPlay == NO && self.ballCount == 2)
    {
        [self.numBalls2 removeFromParent];
    }
    
    if (self.isBallInPlay == NO && self.ballCount == 1)
    {
        [self.numBalls3 removeFromParent];
    }
    
    //[self applyVector];
    self.isBallInPlay = YES;
    self.isPlaying = YES;
}

-(void)updateScore:(NSInteger)score
{
    self.totalScore += score;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.totalScore];
    
    [self.scoreScene.scorsArray addObject:[NSNumber numberWithInteger:self.totalScore]];
}

@end
