//
//  ZMScrollScene.m
//  ZMScrollSpriteProject
//
//  Created by Zouhair Mahieddine on 3/17/14.
//  Copyright (c) 2014 Zedenem. All rights reserved.
//

#import "ZMScrollScene.h"

#import "ZMScrollSprite.h"

@interface ZMScrollScene ()

@property(strong, nonatomic) ZMScrollSprite *scrollSprite;

@end

@implementation ZMScrollScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.scrollSprite = [ZMScrollSprite scrollSpriteWithSize:size contentSize:CGSizeMake(size.width*3, size.height*2)];
        [self addChild:self.scrollSprite];
        
        SKSpriteNode *blueSprite = [SKSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(300, 100)];
        blueSprite.position = CGPointMake(200, 200);
        [self addChild:blueSprite];
        
        SKSpriteNode *greenSprite = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(300, 100)];
        greenSprite.position = CGPointMake(500, 500);
        [self.scrollSprite addChild:greenSprite];
    }
    return self;
}

- (void)didMoveToView:(SKView *)view {
    [super didMoveToView:view];
    [self.scrollSprite sceneDidMoveToView:view];
}

@end
