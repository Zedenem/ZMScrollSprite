//
//  ZMScrollSprite.h
//  ZMScrollSpriteProject
//
//  Created by Zouhair Mahieddine on 3/17/14.
//  Copyright (c) 2014 Zedenem. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface ZMScrollSprite : SKSpriteNode

#pragma mark Initialization
- (instancetype)initWithSize:(CGSize)size contentSize:(CGSize)contentSize;
+ (instancetype)scrollSpriteWithSize:(CGSize)size contentSize:(CGSize)contentSize;

#pragma mark Scrolling
@property(assign, nonatomic) CGSize contentSize;
@property(assign, nonatomic) CGPoint contentOffset;
- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;

#pragma mark UIScrollView Helpers
- (void)sceneDidMoveToView:(UIView *)view;

@end
