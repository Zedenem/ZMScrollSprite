//
//  ZMScrollScene.m
//  ZMScrollSpriteProject
//
//  Created by Zouhair Mahieddine on 3/17/14.
//  Copyright (c) 2014 Zedenem. All rights reserved.
//

#import "ZMScrollScene.h"

#import "ZMScrollSprite.h"

@interface ZMScrollScene () <ZMScrollSpriteDelegate>

@property(strong, nonatomic) ZMScrollSprite *scrollSprite;

@end

@implementation ZMScrollScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [UIColor grayColor];
        
        self.scrollSprite = [ZMScrollSprite scrollSpriteWithSize:size contentSize:CGSizeMake(size.width, size.height*2)];
        self.scrollSprite.position = CGPointMake(size.width/2, size.height/2);
        [self addChild:self.scrollSprite];
        
        SKSpriteNode *blueSprite = [SKSpriteNode spriteNodeWithColor:[UIColor blueColor] size:CGSizeMake(300, 100)];
        blueSprite.position = CGPointMake(200, 200);
        [self addChild:blueSprite];
        
        SKSpriteNode *greenSprite = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(100, 100)];
        greenSprite.position = CGPointMake(300, 500);
        greenSprite.anchorPoint = CGPointMake(0, 1);
        [self.scrollSprite addChild:greenSprite];
        
        SKSpriteNode *otherGreenSprite = [SKSpriteNode spriteNodeWithColor:[UIColor greenColor] size:CGSizeMake(300, 500)];
        otherGreenSprite.position = CGPointMake(10 - (self.scrollSprite.contentSize.width - otherGreenSprite.size.width)/2,
                                                -10 + (self.scrollSprite.contentSize.height - otherGreenSprite.size.height)/2);
        [self.scrollSprite addChild:otherGreenSprite];
    }
    return self;
}
- (void)didMoveToView:(SKView *)view {
    [super didMoveToView:view];
    [self runAction:[SKAction sequence:@[[SKAction waitForDuration:1.0],
                                         [SKAction runBlock:^{
        [self.scrollSprite setContentOffset:self.scrollSprite.maximumContentOffset animated:YES];
    }]]]];
}

#pragma mark ZMScrollSpriteDelegate
- (void)scrollSpriteDidScroll:(ZMScrollSprite *)scrollSprite {
    
}

@end
