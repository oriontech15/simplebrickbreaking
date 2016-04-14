//
//  ScoresController.m
//  BreakingBricks
//
//  Created by Justin Smith on 8/3/15.
//  Copyright (c) 2015 Justin Smith. All rights reserved.
//

#import "ScoresController.h"

@implementation ScoresController

+(ScoresController *)sharedInstance
{
    static ScoresController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [ScoresController new];
    });
    
    return sharedInstance;
}

-(Score *)createScore:(NSInteger)gameScore;
{
    Score *score = [NSEntityDescription insertNewObjectForEntityForName:@"Score" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    score.totalScore = [NSNumber numberWithInteger:gameScore];
    
    return score;
}

-(NSArray *)scores
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Score"];
    
    NSError *error;
    
    NSArray *allScores = [[Stack sharedInstance].managedObjectContext executeFetchRequest:request error:&error];
    
    //NSLog(@"%@", allScores.description);
    
    if (error)
    {
        NSLog(@"Error %@", error.localizedDescription);
    }
    
    return allScores;
}

//Remove an entry if called and not empty
-(void)removeEntry:(Score *)score
{
    [score.managedObjectContext deleteObject:score];
}

//Save the existing entries by calling the saveToPersistentStorage method
-(void)save
{
    [[Stack sharedInstance].managedObjectContext save:nil];
}

@end
