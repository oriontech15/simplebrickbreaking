//
//  GameScene.h
//  BreakingBricks
//

//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "ScoresScene.h"

static const uint32_t ballCategory = 0x1 << 1;
static const uint32_t livesCategory = 0x1 << 9;
static const uint32_t paddleCategory = 0x1 << 6;
static const uint32_t edgeCategory = 0x1 << 7;
static const uint32_t bottomEdgeCategory = 0x1 << 8;
static const uint32_t topEdgeCategory = 0x1 << 10;

@interface GameScene : SKScene <SKPhysicsContactDelegate>

@property (nonatomic) BOOL isPlaying;
@property (nonatomic) BOOL isReady;
@property (nonatomic) NSInteger redScore;
@property (nonatomic) NSInteger lightBlueScore;
@property (nonatomic) NSInteger yellowScore;
@property (nonatomic) NSInteger purpleScore;
@property (nonatomic) NSInteger totalScore;

@end
