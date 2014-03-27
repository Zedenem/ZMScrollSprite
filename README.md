##Installation

### With CocoaPods

Just add `pod 'ZMScrollSprite', '~> 1.0.0'` to your `Podfile` and run

```
$> pod install
```

### Without CocoaPods
Just drag'n'drop `ZMScrollSprite.h` and `ZMScrollSprite.m` into your XCode project.

##Usage

`ZMScrollSprite` is built to be super easy-to-use.

###Step 1

Just instantiate a `ZMScrollSprite` object using the specific `init` method:

```
- (instancetype)initWithSize:(CGSize)size contentSize:(CGSize)contentSize;
```

###No Step 2 Anymore!

`ZMScrollSprite` is no longer based on the scrolling behavior of a hidden `UIScrollView` object.

This gives it more flexibilty but also removes some of the cool functionalities inherited from the `UIScrollView` scrolling behavior (bouncing, paging, deceleration, etc.).

All these refinements are already on `ZMScrollSprite`'s roadmap and will be added in future versions.

For now, you have two choices:

* Stick to v1.0.0 that uses the `UIScrollView`. Big downside: every area covered by the hidden `UIScrollView` won't be accessible to interact with the `SKScene`
* Use v1.0.1 which works great in a full-screen `SpriteKit` only environment but is less refined than the v1.0.0

Hope this will help you as much as it helps me!

 
##License
###This project is released under the MIT License

Copyright (c) 2012 Zedenem

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.