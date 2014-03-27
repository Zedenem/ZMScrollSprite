//
//  ZMScrollSprite.h
//
//  Created by Zouhair Mahieddine on 3/17/14.
//  Copyright (c) 2014 Zedenem. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class ZMScrollSprite;
@protocol ZMScrollSpriteDelegate <NSObject>

@optional
- (void)scrollSpriteDidScroll:(ZMScrollSprite *)scrollSprite;

@end

@interface ZMScrollSprite : SKSpriteNode

#pragma mark Initialization
- (instancetype)initWithSize:(CGSize)size contentSize:(CGSize)contentSize;
+ (instancetype)scrollSpriteWithSize:(CGSize)size contentSize:(CGSize)contentSize;

#pragma mark Managing the Display of Content
@property(assign, nonatomic) CGSize contentSize;
@property(assign, nonatomic) CGPoint contentOffset;
- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;
@property(nonatomic, readonly) CGPoint minimumContentOffset;
@property(nonatomic, readonly) CGPoint maximumContentOffset;

#pragma mark Managing Scrolling
- (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;

#pragma mark Managing the Delegate
@property(weak, nonatomic) id<ZMScrollSpriteDelegate> delegate;

@end
