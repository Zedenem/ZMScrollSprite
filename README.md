#Installation

Just drag'n'drop `SKScrollSprite.h` and `SKScrollSprite.m` into your XCode project.

*CocoaPods pod coming soon...*

#Usage

`SKScrollSprite` is built to be super easy-to-use.

##Step 1

Just instantiate an `SKScrollSprite` object using the specific `init` method:

```
- (instancetype)initWithSize:(CGSize)size contentSize:(CGSize)contentSize;
```

##Step 2 (Optional)

If you added your `SKScrollSprite` instance in the nodes' hierarchy before your `SKScene` was added to its `SKView`, just override `- (void)didMoveToView:(SKView *)view` and add this line:

```
[myScrollSprite sceneDidMoveToView:view];
```

That's it! You are good to go!

#License
##This project is released under the MIT License

Copyright (c) 2012 Zedenem

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.