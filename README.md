# CoreAnimationDemo
CoreAnimation动画的示例

Core Animation是iOS与OS X平台上负责图形渲染与动画的基础设施。你只需配置少量的动画参数（如开始点位置和结束点的位置）即可施展Core Animation魔法。Core Animation将大部分实际的绘图任务交给了图形硬件来处理，图形硬件会加速图形渲染的速度。这种自动化的图形加速技术让动画拥有更的帧率并且更加的平滑，而且不会加重CPU的负担而影响程序的运行速度。

Core Animation为动画视图和其他可视元素提供了一个通用的系统。Core Animation并不是视图的替代品，相反，它是一种和视图相集成的技术。由于位图可以直接由图形硬件直接操控，所以通过将视图的内容缓存到位图中, 可以获得更好的性能。除了缓存视图内容，使用Core Animation可以定义任意的可视对象，然后将该对象添加到视图上，最后动画该对象。