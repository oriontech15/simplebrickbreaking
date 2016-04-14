//
//  ScoresController.h
//  BreakingBricks
//
//  Created by Justin Smith on 8/3/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Score.h"
#import "ScoresScene.h"

@interface ScoresController : NSObject

-(Score *)createScore:(NSInteger)gameScore;
-(NSArray *)scores;
-(void)removeEntry:(Score *)score;
-(void)save;

+(ScoresController *)sharedInstance;

@end
