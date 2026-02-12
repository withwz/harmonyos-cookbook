# ArkTS 组件 Demo 开发计划

> 按分类逐步完成各个组件的 Demo 实现

---

## 一、已完成 Demo ✅

| Demo名称 | 文件 | 状态 |
|----------|------|------|
| 装饰器 Demo | DecoratorDemo.ets | ✅ 完成 |
| 布局 Demo | LayoutDemo.ets | ✅ 完成 |
| 路由 Demo | RouterDemo.ets | ✅ 完成 |
| ArkTS 语法 Demo | ArkTSSyntaxDemo.ets | ✅ 完成 |
| Network Kit Demo | NetworkKitDemo.ets | ✅ 完成 |
| Image Kit Demo | ImageKitDemo.ets | ✅ 完成 |

---

## 二、待开发 Demo 列表

### 第1优先级：高频组件 (必须掌握)

#### 1. 按钮与选择组件 Demo

**文件**: `ButtonAndSelectDemo.ets`

**内容**:
- [ ] Button 基础用法
- [ ] Button 类型: Capsule, Normal, Circle
- [ ] Toggle 开关样式
- [ ] Checkbox 多选
- [ ] Radio 单选
- [ ] Slider 滑动条
- [ ] Select 下拉选择
- [ ] DatePicker 日期选择
- [ ] TimePicker 时间选择

**预计时间**: 2-3小时

---

#### 2. 文本与输入组件 Demo

**文件**: `TextAndInputDemo.ets`

**内容**:
- [ ] Text 基础用法
- [ ] Text 样式 (fontSize, fontWeight, fontStyle)
- [ ] TextInput 单行输入
- [ ] TextArea 多行输入
- [ ] Search 搜索框
- [ ] Span 富文本片段
- [ ] TextPatternLock 图案锁

**预计时间**: 2-3小时

---

#### 3. 滚动与滑动组件 Demo

**文件**: `ScrollAndSlideDemo.ets`

**内容**:
- [ ] Scroll 滚动容器
- [ ] List 列表 + ForEach
- [ ] ListItem 列表项
- [ ] Grid 网格布局
- [ ] Swiper 轮播图
- [ ] Swiper 自定义指示器
- [ ] ScrollBar 滚动条

**预计时间**: 3-4小时

---

#### 4. 导航与切换组件 Demo

**文件**: `NavigationDemo.ets`

**内容**:
- [ ] Tabs + TabContent 基础用法
- [ ] Tabs 位置模式 (Bottom, Start, End)
- [ ] TabContent 自定义构建
- [ ] Navigator 跳转
- [ ] Navigation 导航容器

**预计时间**: 2-3小时

---

### 第2优先级：信息展示组件

#### 5. 信息展示组件 Demo

**文件**: `InfoDisplayDemo.ets`

**内容**:
- [ ] Progress 进度条
- [ ] AlertDialog 对话框
- [ ] ActionSheet 操作列表
- [ ] Popup 气泡弹窗
- [ ] TextPicker 选择器
- [ ] Tooltip 提示

**预计时间**: 2-3小时

---

#### 6. 图片与视频组件 Demo

**文件**: `MediaDemo.ets`

**内容**:
- [ ] Image 不同来源 (本地/网络/Base64)
- [ ] Image objectFit 缩放模式
- [ ] ImageSpan 图片文本混合
- [ ] AnimatedImage GIF 动图
- [ ] Video 视频播放器
- [ ] Video 控制条

**预计时间**: 2-3小时

---

### 第3优先级：动画与手势

#### 7. 动画组件 Demo

**文件**: `AnimationDemo.ets`

**内容**:
- [ ] animateTo 属性动画
- [ ] transition 转场动画
- [ ] Animator 显式动画
- [ ] spring 弹簧动画
- [ ] curve 动画曲线
- [ ] animateMotion 路径动画

**预计时间**: 3-4小时

---

#### 8. 手势组件 Demo

**文件**: `GestureDemo.ets`

**内容**:
- [ ] gesture 组合手势
- [ ] TapGesture 点击
- [ ] LongPressGesture 长按
- [ ] PanGesture 拖动
- [ ] PinchGesture 缩放
- [ ] RotationGesture 旋转
- [ ] SwipeGesture 滑动

**预计时间**: 3-4小时

---

### 第4优先级：其他组件

#### 9. 画布绘制 Demo

**文件**: `CanvasDemo.ets`

**内容**:
- [ ] Canvas 基础设置
- [ ] 绘制形状 (矩形/圆形/线条)
- [ ] 绘制文本
- [ ] 绘制图片
- [ ] 交互绘制

**预计时间**: 3-4小时

---

#### 10. 弹窗与菜单 Demo

**文件**: `DialogAndMenuDemo.ets`

**内容**:
- [ ] AlertDialog 各种样式
- [ ] BindSheet 半模态
- [ ] Menu 菜单
- [ ] MenuItem 菜单项
- [ ] ContextMenu 右键菜单
- [ ] CustomDialog 自定义对话框
- [ ] Toast 提示

**预计时间**: 2-3小时

---

#### 11. 状态管理 Demo

**文件**: `StateManagementDemo.ets`

**内容**:
- [ ] @State 基础用法
- [ ] @Prop 父子传递
- [ ] @Link 双向绑定
- [ ] @Provide/@Consume 跨层级
- [ ] @Observed/@ObjectLink 对象观察
- [ ] @Watch 监听变化
- [ ] if 条件渲染
- [ ] ForEach 列表渲染

**预计时间**: 3-4小时

---

#### 12. 栅格布局 Demo

**文件**: `GridRowColDemo.ets`

**内容**:
- [ ] GridRow 栅格行
- [ ] GridCol 栅格列
- [ ] 断点响应式
- [ ] offset 偏移
- [ ] Span 跨度

**预计时间**: 2小时

---

## 三、Demo 页面统一规范

### 页面结构

```typescript
import router from '@ohos.router'

@Entry
@Component
struct ComponentDemo {
  @State currentIndex: number = 0

  build() {
    Scroll() {
      Column({ space: 0 }) {
        // 顶部导航
        this.Header()

        // 主要内容
        Column({ space: 16 }) {
          // Demo 内容...
        }
        .width('100%')
        .padding({ left: 16, right: 16, bottom: 20 })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  Header() {
    // 返回按钮 + 标题
  }
}
```

### UI 风格规范

| 元素 | 规范 |
|------|------|
| 返回按钮 | 圆形蓝色按钮，白色箭头 |
| 标题 | 28px，粗体，#1F1F1F |
| 副标题 | 14px，#999999 |
| 卡片背景 | 白色，圆角 16px |
| 卡片内边距 | 16px |
| 间距 | 组件间 16px，卡片内 12px |

---

## 四、学习检查清单

### 基础组件
- [ ] 能熟练使用 Column/Row 布局
- [ ] 能使用 Text 显示各种样式文本
- [ ] 能使用 TextInput 获取用户输入
- [ ] 能使用 Button 响应点击
- [ ] 能使用 List 展示列表数据

### 中级组件
- [ ] 能使用 Tabs 实现标签页切换
- [ ] 能使用 Swiper 实现轮播图
- [ ] 能使用 Grid 实现网格布局
- [ ] 能使用 AlertDialog 显示对话框

### 高级组件
- [ ] 能使用 animateTo 实现属性动画
- [ ] 能使用 gesture 处理复杂手势
- [ ] 能使用 Canvas 绘制图形
- [ ] 能理解状态管理装饰器的区别

---

## 五、开发进度跟踪

### 本周计划

| 任务 | 预计时间 | 状态 |
|------|----------|------|
| 按钮与选择 Demo | 2-3h | 待开始 |
| 文本与输入 Demo | 2-3h | 待开始 |
| 滚动与滑动 Demo | 3-4h | 待开始 |
| 导航与切换 Demo | 2-3h | 待开始 |

### 下周计划

| 任务 | 预计时间 | 状态 |
|------|----------|------|
| 信息展示 Demo | 2-3h | 待开始 |
| 图片与视频 Demo | 2-3h | 待开始 |
| 动画 Demo | 3-4h | 待开始 |
| 手势 Demo | 3-4h | 待开始 |

---

> **更新日期**: 2025-02-12
> **文档路径**: `/Users/a0000/Desktop/dk/ty/MyApplication/plan/组件Demo开发计划.md`
