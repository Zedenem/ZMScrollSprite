//
//  ZMScrollSprite.m
//
//  Created by Zouhair Mahieddine on 3/17/14.
//  Copyright (c) 2014 Zedenem. All rights reserved.
//

#import "ZMScrollSprite.h"

@interface ZMScrollSprite () <UIScrollViewDelegate>

@property(strong, nonatomic) SKSpriteNode *contentSprite;

- (CGPoint)validContentOffsetFromContentOffset:(CGPoint)contentOffset;
@property(nonatomic, readonly) CGPoint contentSpriteDefaultPosition;
@property(nonatomic, readonly) CGPoint contentSpriteCurrentPosition;

@end

@implementation ZMScrollSprite

#pragma mark Initialization
- (instancetype)initWithSize:(CGSize)size contentSize:(CGSize)contentSize {
    self = [super initWithColor:nil size:size];
    if (self) {
        _contentSprite = [SKSpriteNode spriteNodeWithColor:nil size:contentSize];
        _contentSize = contentSize;
        _contentSprite.position = self.contentSpriteDefaultPosition;
        [self addChild:_contentSprite];
        self.userInteractionEnabled = YES;
    }
    return self;
}
+ (instancetype)scrollSpriteWithSize:(CGSize)size contentSize:(CGSize)contentSize {
    return [[self alloc] initWithSize:size contentSize:contentSize];
}

#pragma mark SKSpriteNode Hierarchy Overloading
- (void)addChild:(SKNode *)node {
    if (node == self.contentSprite) {
        [super addChild:node];
    }
    else {
        [self.contentSprite addChild:node];
    }
}

#pragma mark Managing the Display of Content
- (void)setContentSize:(CGSize)contentSize {
    if (!CGSizeEqualToSize(_contentSize, contentSize)) {
        _contentSize = CGSizeMake(MAX(self.size.width, contentSize.width),
                                  MAX(self.size.height, contentSize.height));
    }
}
- (void)setContentOffset:(CGPoint)contentOffset {
    if (!CGPointEqualToPoint(_contentOffset, contentOffset)) {
        [self setContentOffset:contentOffset animated:NO];
    }
}
- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated {
    if (!CGPointEqualToPoint(_contentOffset, contentOffset)) {
        _contentOffset = [self validContentOffsetFromContentOffset:contentOffset];
        if (animated) {
            [self.contentSprite runAction:[SKAction moveTo:self.contentSpriteCurrentPosition duration:0.5f]];
        }
        else {
            self.contentSprite.position = [self contentSpriteCurrentPosition];
        }
    }
}

- (CGPoint)validContentOffsetFromContentOffset:(CGPoint)contentOffset {
    return CGPointMake(MIN(MAX(self.minimumContentOffset.x, contentOffset.x), self.maximumContentOffset.x),
                       MIN(MAX(self.minimumContentOffset.y, contentOffset.y), self.maximumContentOffset.y));
}

- (CGPoint)minimumContentOffset {
    return CGPointMake(0, 0);
}
- (CGPoint)maximumContentOffset {
    return CGPointMake(self.contentSize.width - self.size.width, self.contentSize.height - self.size.height);
}

- (CGPoint)contentSpriteCurrentPosition {
    return CGPointMake(self.contentSpriteDefaultPosition.x + _contentOffset.x,
                       self.contentSpriteDefaultPosition.y + _contentOffset.y);
}
- (CGPoint)contentSpriteDefaultPosition {
    return CGPointMake(- (self.contentSize.width - self.size.width)/2,
                       - (self.contentSize.height - self.size.height)/2);
}

#pragma mark Managing Scrolling
- (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated {
    
}

#pragma mark Responding to Touch Events
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    CGPoint previousLocation = [touch previousLocationInNode:self];
    
    CGPoint contentOffset = self.contentOffset;
    CGFloat deltaX = location.x - previousLocation.x;
    CGFloat deltaY = location.y - previousLocation.y;
    contentOffset.x += deltaX;
    contentOffset.y += deltaY;
    self.contentOffset = contentOffset;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
}

@end
