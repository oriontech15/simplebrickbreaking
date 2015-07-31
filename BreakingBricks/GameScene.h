//
//  GameScene.h
//  BreakingBricks
//

//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

static const uint32_t ballCategory = 0x1 << 1;
static const uint32_t redBrickCategory = 0x1 << 2;
static const uint32_t yellowBrickCategory = 0x1 << 3;
static const uint32_t blueBrickCategory = 0x1 << 4;
static const uint32_t purpleBrickCategory = 0x1 << 5;
static const uint32_t paddleCategory = 0x1 << 6;
static const uint32_t edgeCategory = 0x1 << 7;
static const uint32_t bottomEdgeCategory = 0x1 << 8;

@interface GameScene : SKScene <SKPhysicsContactDelegate>

@property (nonatomic) BOOL isPlaying;
@property (nonatomic) BOOL isReady;
@property (nonatomic) NSInteger redScore;
@property (nonatomic) NSInteger lightBlueScore;
@property (nonatomic) NSInteger yellowScore;
@property (nonatomic) NSInteger purpleScore;

@end
