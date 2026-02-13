# ArkTS 组件完整学习计划

> 基于华为官方文档的29个组件分类，系统学习所有 ArkTS 组件

**更新日期**: 2025-02-13
**官方文档**: [ArkTS组件参考](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkui-declarative-comp)

---

## 一、组件分类概览（29类）

| 序号 | 类别 | 组件数量 | 优先级 | 状态 |
|------|------|----------|--------|------|
| 1 | 通用事件 | - | ⭐⭐⭐⭐⭐ | ✅ 基础 |
| 2 | 通用属性 | - | ⭐⭐⭐⭐⭐ | ✅ 基础 |
| 3 | 手势处理 | - | ⭐⭐⭐ | 📝 待学 |
| 4 | 行列与堆叠 | 5个 | ⭐⭐⭐⭐⭐ | ✅ 已完成 |
| 5 | 栅格与分栏 | 3个 | ⭐⭐⭐ | 📝 待学 |
| 6 | 滚动与滑动 | 8个 | ⭐⭐⭐⭐⭐ | ✅ 已完成 |
| 7 | 导航与切换 | 5个 | ⭐⭐⭐⭐ | 📝 待学 |
| 8 | 按钮与选择 | 8个 | ⭐⭐⭐⭐⭐ | ✅ 已完成 |
| 9 | 文本与输入 | 8个 | ⭐⭐⭐⭐⭐ | 📝 待学 |
| 10 | 图片与视频 | 5个 | ⭐⭐⭐⭐ | 📝 待学 |
| 11 | 信息展示 | 10个 | ⭐⭐⭐ | 📝 待学 |
| 12 | 空白与分隔 | 4个 | ⭐⭐ | 📝 待学 |
| 13 | 画布绘制 | 2个 | ⭐⭐⭐ | 📝 待学 |
| 14 | 图形绘制 | 7个 | ⭐⭐⭐ | 📝 待学 |
| 15 | 渲染绘制 | 3个 | ⭐⭐ | 📝 待学 |
| 16 | 菜单 | 4个 | ⭐⭐⭐ | 📝 待学 |
| 17 | 动画 | 6个 | ⭐⭐⭐⭐ | 📝 待学 |
| 18 | 弹窗 | 7个 | ⭐⭐⭐⭐ | 📝 待学 |
| 19 | 卡片 | 1个 | ⭐⭐⭐ | 📝 待学 |
| 20 | 安全 | 1个 | ⭐⭐ | 📝 待学 |
| 21 | 主题 | 2个 | ⭐⭐ | 📝 待学 |
| 22 | AtomicService | 1个 | ⭐ | 📝 待学 |
| 23 | 自定义占位组件 | 1个 | ⭐⭐ | 📝 待学 |
| 24 | 自定义组件 | - | ⭐⭐⭐⭐⭐ | ✅ 基础 |
| 25 | 组件预览 | 1个 | ⭐ | 📝 待学 |
| 26 | 系统预置UI组件库 | 1个 | ⭐⭐⭐⭐ | 📝 待学 |
| 27 | 状态管理与渲染控制 | 4个 | ⭐⭐⭐⭐⭐ | ✅ 基础 |
| 28 | 公共定义 | - | ⭐⭐⭐ | ✅ 基础 |
| 29 | 已停止维护的组件 | - | - | ⏭️ 跳过 |

---

## 二、详细学习计划

### 阶段一：基础组件巩固（已完成 ✅）

#### 1.1 行列与堆叠 ✅
- [x] Column
- [x] Row
- [x] Stack
- [x] Flex
- [x] RelativeContainer
- **Demo文件**: `ColumnLayoutDemo.ets`, `RowLayoutDemo.ets`, `StackLayoutDemo.ets`, `FlexLayoutDemo.ets`, `GridLayoutDemo.ets`

#### 1.2 滚动与滑动 ✅
- [x] Scroll
- [x] List
- [x] ListItem
- [x] Grid
- [x] Swiper
- [x] ScrollBar
- **Demo文件**: `ListLayoutDemo.ets`, `GridLayoutDemo.ets`

#### 1.3 按钮与选择 ✅
- [x] Button
- [x] Toggle
- [x] Checkbox
- [x] Radio
- [x] Slider
- [x] Select
- [x] DatePicker
- [x] TimePicker
- **Demo文件**: `ButtonAndSelectDemo.ets`

#### 1.4 状态管理与渲染控制 ✅
- [x] @State
- [x] @Prop
- [x] @Link
- [x] @Provide/@Consume
- [x] @Observed/@ObjectLink
- [x] @Watch
- [x] if 条件渲染
- [x] ForEach 列表渲染
- **Demo文件**: `StateDemo.ets`, `PropDemo.ets`, `LinkDemo.ets`, `ObjectLinkDemo.ets`, `DecoratorDemo.ets`

#### 1.5 自定义组件 ✅
- [x] @Component
- [x] @Builder
- [x] @Styles
- [x] @Extend
- **Demo文件**: `BuilderDemo.ets`, `BuilderVsComponent.ets`

---

### 阶段二：高频交互组件（进行中 📝）

#### 2.1 文本与输入组件
**文件**: `TextAndInputDemo.ets`

**组件列表**:
- [ ] Text - 文本显示
- [ ] TextInput - 单行输入
- [ ] TextArea - 多行输入
- [ ] Search - 搜索框
- [ ] Span - 富文本片段
- [ ] TextSpan - 图文混排
- [ ] PatternLock - 图案锁
- [ ] RichEditor - 富文本编辑器

**重点功能**:
- Text 各种样式（字体、颜色、装饰、对齐）
- TextInput 校验、限制输入类型
- TextArea 自动高度、字符计数
- Search 搜索建议
- Span 点击事件

**预计时间**: 2-3小时

---

#### 2.2 图片与视频组件
**文件**: `MediaDemo.ets`

**组件列表**:
- [ ] Image - 图片显示
- [ ] ImageSpan - 图文混排
- [ ] AnimatedImage - GIF动图
- [ ] Video - 视频播放器
- [ ] VideoSlider - 视频进度条

**重点功能**:
- Image 不同来源（本地/网络/Base64/resource）
- Image objectFit 缩放模式
- Image 缓存策略
- Video 播放控制
- Video 自定义控制条

**预计时间**: 2-3小时

---

#### 2.3 导航与切换组件
**文件**: `NavigationDemo.ets`

**组件列表**:
- [ ] Tabs - 标签页容器
- [ ] TabContent - 标签页内容
- [ ] Navigator - 导航组件
- [ ] NavDestination - 导航目标
- [ ] Navigation - 导航容器

**重点功能**:
- Tabs 位置模式（Bottom/Start/End）
- Tabs 自定义指示器
- TabContent 懒加载
- Navigation 路由管理
- Navigation 过渡动画

**预计时间**: 2-3小时

---

#### 2.4 信息展示组件
**文件**: `InfoDisplayDemo.ets`

**组件列表**:
- [ ] Progress - 进度条
- [ ] AlertDialog - 警告对话框
- [ ] ActionSheet - 操作列表
- [ ] Popup - 气泡弹窗
- [ ] TextPicker - 选择器
- [ ] BindSheet - 半模态
- [ ] Tooltip - 提示
- [ ] GridContainer - 栅格容器
- [ ] ContainerColumn - 栅格列
- [ ] ContainerRow - 栅格行

**预计时间**: 2-3小时

---

### 阶段三：进阶交互组件（待学习）

#### 3.1 手势处理
**文件**: `GestureDemo.ets`

**手势列表**:
- [ ] TapGesture - 点击
- [ ] LongPressGesture - 长按
- [ ] PanGesture - 拖动
- [ ] PinchGesture - 捏合缩放
- [ ] RotationGesture - 旋转
- [ ] SwipeGesture - 滑动
- [ ] 组合手势 gestureGroup

**预计时间**: 3-4小时

---

#### 3.2 动画组件
**文件**: `AnimationDemo.ets`

**动画列表**:
- [ ] animateTo - 属性动画
- [ ] animation - 动画属性
- [ ] transition - 转场动画
- [ ] Animator - 显式动画
- [ ] spring - 弹簧动画
- [ ] curve - 动画曲线
- [ ] animateMotion - 路径动画

**预计时间**: 3-4小时

---

#### 3.3 弹窗组件
**文件**: `DialogDemo.ets`

**弹窗列表**:
- [ ] AlertDialog - 各种样式
- [ ] BindSheet - 半模态转场
- [ ] Menu - 菜单
- [ ] MenuItem - 菜单项
- [ ] ContextMenu - 右键菜单
- [ ] CustomDialog - 自定义对话框
- [ ] Toast/ToastPrompt - 提示

**预计时间**: 2-3小时

---

#### 3.4 菜单组件
**文件**: `MenuDemo.ets`

**菜单列表**:
- [ ] Menu - 菜单容器
- [ ] MenuItem - 菜单项
- [ ] MenuItemGroup - 菜单项分组
- [ ] ContextMenu - 右键菜单

**预计时间**: 1-2小时

---

### 阶段四：绘图与渲染（待学习）

#### 4.1 画布绘制
**文件**: `CanvasDemo.ets`

**组件列表**:
- [ ] Canvas - 画布容器
- [ ] CanvasRenderingContext2D - 2D绘制上下文

**绘制功能**:
- [ ] 绘制形状（矩形/圆形/线条）
- [ ] 绘制文本
- [ ] 绘制图片
- [ ] 变换（平移/旋转/缩放）
- [ ] 交互绘制

**预计时间**: 3-4小时

---

#### 4.2 图形绘制
**文件**: `ShapeDemo.ets`

**图形列表**:
- [ ] Shape - 形状容器
- [ ] Path - 路径
- [ ] Polyline - 折线
- [ ] Polygon - 多边形
- [ ] Rect - 矩形
- [ ] Circle - 圆形
- [ ] Ellipse - 椭圆

**预计时间**: 2-3小时

---

#### 4.3 栅格与分栏
**文件**: `GridRowColDemo.ets`

**组件列表**:
- [ ] GridRow - 栅格行
- [ ] GridCol - 栅格列
- [ ] FlowItem - 流式布局

**重点功能**:
- 断点响应式
- offset 偏移
- Span 跨度

**预计时间**: 2小时

---

### 阶段五：其他组件（待学习）

#### 5.1 空白与分隔
**文件**: `SpacingDemo.ets`

**组件列表**:
- [ ] Blank - 空白填充
- [ ] Divider - 分割线
- [ ] Space - 间距
- [ ] ListItemGroup - 列表分组

**预计时间**: 1小时

---

#### 5.2 卡片组件
**文件**: `FormDemo.ets`

**组件列表**:
- [ ] Form - 卡片组件

**预计时间**: 2小时

---

#### 5.3 主题与安全
**文件**: `ThemeDemo.ets`

**组件列表**:
- [ ] SecurityComponent - 安全组件
- [ ] Theme - 主题

**预计时间**: 1-2小时

---

#### 5.4 系统预置UI组件库
**文件**: `PresetUIDemo.ets`

**组件列表**:
- [ ] 系统预置组件

**预计时间**: 2-3小时

---

## 三、学习检查清单

### 基础能力检查
- [x] 能熟练使用 Column/Row 布局
- [x] 能使用 Text 显示各种样式文本
- [x] 能使用 TextInput 获取用户输入
- [x] 能使用 Button 响应点击
- [x] 能使用 List 展示列表数据
- [ ] 能使用 Tabs 实现标签页切换
- [ ] 能使用 Swiper 实现轮播图
- [ ] 能使用 Grid 实现网格布局
- [ ] 能使用 AlertDialog 显示对话框

### 中级能力检查
- [ ] 能使用 animateTo 实现属性动画
- [ ] 能使用 gesture 处理复杂手势
- [ ] 能使用 Canvas 绘制图形
- [ ] 能使用 Video 播放视频
- [ ] 能使用 Menu 创建菜单
- [ ] 能使用 Navigation 管理路由
- [ ] 能理解状态管理装饰器的区别

### 高级能力检查
- [ ] 能自定义组件并封装
- [ ] 能使用 @Builder 复用 UI
- [ ] 能处理组件生命周期
- [ ] 能使用栅格布局实现响应式
- [ ] 能优化列表渲染性能
- [ ] 能使用自定义弹窗

---

## 四、Demo 统一规范

### 页面结构模板

```typescript
import router from '@ohos.router'

@Entry
@Component
struct ComponentDemo {
  // 1. 状态变量
  @State message: string = 'Hello'

  // 2. 生命周期
  aboutToAppear() {
    // 初始化
  }

  // 3. 构建UI
  build() {
    Scroll() {
      Column({ space: 20 }) {
        // 头部
        this.Header()

        // 主要内容
        this.ContentSection()

        // 底部提示
        this.TipCard()
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  // 4. @Builder 方法
  @Builder
  Header() {
    // 返回按钮 + 标题
  }

  @Builder
  TipCard(tip: string) {
    // 提示卡片
  }
}
```

### UI 风格规范

| 元素 | 规范 |
|------|------|
| 返回按钮 | 圆形蓝色按钮，白色箭头 |
| 标题 | 24px，粗体，#1F1F1F |
| 副标题 | 14px，#999999 |
| 卡片背景 | 白色，圆角 12px |
| 卡片内边距 | 16px |
| 间距 | 组件间 16px，卡片内 12px |

---

## 五、开发进度跟踪

### 本周计划（第1周）

| 任务 | 预计时间 | 状态 |
|------|----------|------|
| 文本与输入 Demo | 2-3h | 📝 待开始 |
| 图片与视频 Demo | 2-3h | 📝 待开始 |
| 导航与切换 Demo | 2-3h | 📝 待开始 |
| 信息展示 Demo | 2-3h | 📝 待开始 |

### 下周计划（第2周）

| 任务 | 预计时间 | 状态 |
|------|----------|------|
| 手势 Demo | 3-4h | 📝 待开始 |
| 动画 Demo | 3-4h | 📝 待开始 |
| 弹窗 Demo | 2-3h | 📝 待开始 |
| 菜单 Demo | 1-2h | 📝 待开始 |

### 第三周计划

| 任务 | 预计时间 | 状态 |
|------|----------|------|
| 画布绘制 Demo | 3-4h | 📝 待开始 |
| 图形绘制 Demo | 2-3h | 📝 待开始 |
| 栅格分栏 Demo | 2h | 📝 待开始 |
| 空白分隔 Demo | 1h | 📝 待开始 |

### 第四周计划

| 任务 | 预计时间 | 状态 |
|------|----------|------|
| 卡片 Demo | 2h | 📝 待开始 |
| 主题安全 Demo | 1-2h | 📝 待开始 |
| 系统UI组件库 Demo | 2-3h | 📝 待开始 |

---

## 六、学习资源

### 官方文档

| 资源 | 链接 |
|------|------|
| ArkTS组件总览 | https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkui-declarative-comp |
| 按钮与选择 | https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/button-and-selection-V5 |
| 文本输入指南 | https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-text-input |
| 按钮开发指南 | https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-button |

### 模拟器支持

| 组件类别 | 模拟器支持 |
|----------|------------|
| 基础组件 | ✅ 完全支持 |
| 媒体组件 | ⚠️ 部分支持 |
| 相机组件 | ❌ 不支持 |
| 地图组件 | ❌ 不支持 |

---

> **文档路径**: `/Users/a0000/Desktop/dk/ty/MyApplication/plan/ArkTS组件完整学习计划.md`
> **最后更新**: 2025-02-13
