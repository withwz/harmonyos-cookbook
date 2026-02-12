# ArkTS 组件学习指南

> HarmonyOS ArkUI 声明式组件完整学习路径

---

## 一、组件分类概览

根据华为官方文档，ArkTS 组件分为以下 29 个类别：

| 序号 | 类别 | 组件数量 | 学习优先级 |
|------|------|----------|------------|
| 1 | 通用事件 | - | ⭐⭐⭐⭐⭐ |
| 2 | 通用属性 | - | ⭐⭐⭐⭐⭐ |
| 3 | 手势处理 | - | ⭐⭐⭐ |
| 4 | 行列与堆叠 | 5个 | ⭐⭐⭐⭐⭐ |
| 5 | 栅格与分栏 | 3个 | ⭐⭐⭐ |
| 6 | 滚动与滑动 | 8个 | ⭐⭐⭐⭐⭐ |
| 7 | 导航与切换 | 5个 | ⭐⭐⭐⭐ |
| 8 | 按钮与选择 | 8个 | ⭐⭐⭐⭐⭐ |
| 9 | 文本与输入 | 8个 | ⭐⭐⭐⭐⭐ |
| 10 | 图片与视频 | 5个 | ⭐⭐⭐⭐ |
| 11 | 信息展示 | 10个 | ⭐⭐⭐ |
| 12 | 空白与分隔 | 4个 | ⭐⭐ |
| 13 | 画布绘制 | 2个 | ⭐⭐⭐ |
| 14 | 图形绘制 | 7个 | ⭐⭐⭐ |
| 15 | 渲染绘制 | 3个 | ⭐⭐ |
| 16 | 菜单 | 4个 | ⭐⭐⭐ |
| 17 | 动画 | 6个 | ⭐⭐⭐⭐ |
| 18 | 弹窗 | 7个 | ⭐⭐⭐⭐ |
| 19 | 卡片 | 1个 | ⭐⭐⭐ |
| 20 | 安全 | 1个 | ⭐⭐ |
| 21 | 主题 | 2个 | ⭐⭐ |
| 22 | AtomicService | 1个 | ⭐ |
| 23 | 自定义占位组件 | 1个 | ⭐⭐ |
| 24 | 自定义组件 | - | ⭐⭐⭐⭐⭐ |
| 25 | 组件预览 | 1个 | ⭐ |
| 26 | 系统预置UI组件库 | 1个 | ⭐⭐⭐⭐ |
| 27 | 状态管理与渲染控制 | 4个 | ⭐⭐⭐⭐⭐ |
| 28 | 公共定义 | - | ⭐⭐⭐ |
| 29 | 已停止维护的组件 | - | - |

---

## 二、学习路线规划

### 阶段一：基础必学组件 (2-3周)

#### 1.1 通用属性 ⭐⭐⭐⭐⭐

**学习目标**: 掌握所有组件通用的属性

| 属性类别 | 内容 |
|----------|------|
| 尺寸 | width, height, size, aspectRatio |
| 间距 | padding, margin, space |
| 对齐 | alignItems, justifyContent, alignContent |
| 背景 | backgroundColor, backgroundImage |
| 边框 | border, borderRadius |
| 位置 | position, offset, anchorPoint |
| 显示 | visibility, opacity, display |
| 其他 | id, enabled, focusable |

**参考文档**: [通用属性 - ArkTS组件](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkui-declarative-comp)

#### 1.2 通用事件 ⭐⭐⭐⭐⭐

**学习目标**: 掌握所有组件通用的事件

| 事件类型 | 说明 |
|----------|------|
| 点击事件 | onClick |
| 触摸事件 | onTouch, onHover |
| 按键事件 | onKeyEvent, onKeyPress |
| 焦点事件 | onFocus, onBlur |
| 区域变化 | onAreaChange |

#### 1.3 行列与堆叠 ⭐⭐⭐⭐⭐

**核心组件**:

| 组件 | 用途 | 文档链接 |
|------|------|----------|
| Column | 垂直布局 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-column) |
| Row | 水平布局 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-row) |
| Stack | 堆叠布局 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-stack) |
| Flex | 弹性布局 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-flex) |
| RelativeContainer | 相对布局 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-relativecontainer) |

**学习重点**:
- Column/Row 的 space 参数
- Stack 的 alignContent 参数
- Flex 的主轴和交叉轴对齐

#### 1.4 文本与输入 ⭐⭐⭐⭐⭐

**核心组件**:

| 组件 | 用途 | 文档链接 |
|------|------|----------|
| Text | 文本显示 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-text) |
| TextInput | 单行输入 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textinput) |
| TextArea | 多行输入 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-textarea) |
| Search | 搜索框 | [开发指南](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-text-input) |
| Span | 文本片段 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-span) |

#### 1.5 按钮与选择 ⭐⭐⭐⭐⭐

**核心组件**:

| 组件 | 用途 | 文档链接 |
|------|------|----------|
| Button | 按钮 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-button) |
| Toggle | 切换按钮 | [开发指南](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-common-components-switch) |
| Checkbox | 多选框 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-checkbox) |
| Radio | 单选框 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-radio) |
| Slider | 滑动条 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-slider) |
| Select | 下拉选择 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-select) |
| DatePicker | 日期选择 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-datepicker) |
| TimePicker | 时间选择 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-timepicker) |

#### 1.6 滚动与滑动 ⭐⭐⭐⭐⭐

**核心组件**:

| 组件 | 用途 | 文档链接 |
|------|------|----------|
| Scroll | 滚动容器 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-scroll) |
| List | 列表 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-list) |
| ListItem | 列表项 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-listitem) |
| Grid | 网格 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-grid) |
| Swiper | 轮播 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-swiper) |
| ScrollBar | 滚动条 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-scrollbar) |

---

### 阶段二：中级组件 (1-2周)

#### 2.1 导航与切换 ⭐⭐⭐⭐

**核心组件**:

| 组件 | 用途 | 文档链接 |
|------|------|----------|
| Tabs | 标签页容器 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-tabs) |
| TabContent | 标签页内容 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-container-tabcontent) |
| Navigator | 导航组件 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-methods-navigator) |
| NavDestination | 导航目标 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-api-navigation-navdestination) |
| Navigation | 导航容器 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-methods-navigation) |

#### 2.2 图片与视频 ⭐⭐⭐⭐

**核心组件**:

| 组件 | 用途 | 文档链接 |
|------|------|----------|
| Image | 图片 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-image) |
| Video | 视频播放 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-media-components-video) |
| ImageSpan | 图片文本 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-imagespan) |
| AnimatedImage | 动图 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-animatedimage) |

#### 2.3 信息展示 ⭐⭐⭐

**核心组件**:

| 组件 | 用途 | 文档链接 |
|------|------|----------|
| Progress | 进度条 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-progress) |
| AlertDialog | 对话框 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-methods-alert-dialog) |
| ActionSheet | 操作列表 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-methods-action-sheet) |
| Popup | 气泡弹窗 | [文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-methods-popup) |

---

### 阶段三：进阶组件 (2-3周)

#### 3.1 动画 ⭐⭐⭐⭐

**核心内容**:

| API | 用途 |
|-----|------|
| animateTo | 属性动画 |
| transition | 转场动画 |
| Animator | 动画控制器 |
| curve | 动画曲线 |
| animateMotion | 路径动画 |
| spring | 弹簧动画 |

#### 3.2 手势处理 ⭐⭐⭐

**核心手势**:

| 手势 | 用途 |
|------|------|
| TapGesture | 点击 |
| LongPressGesture | 长按 |
| PanGesture | 拖动 |
| PinchGesture | 捏合缩放 |
| RotationGesture | 旋转 |
| SwipeGesture | 滑动 |

#### 3.3 画布绘制 ⭐⭐⭐

**核心组件**:

| 组件 | 用途 |
|------|------|
| Canvas | 画布容器 |
| CanvasRenderingContext2D | 2D绘制上下文 |

#### 3.4 栅格与分栏 ⭐⭐⭐

**核心组件**:

| 组件 | 用途 |
|------|------|
| GridRow | 栅格行 |
| GridCol | 栅格列 |
| FlowItem | 流式布局 |

---

### 阶段四：高级专题 (2-3周)

#### 4.1 弹窗组件 ⭐⭐⭐⭐

| 组件 | 用途 |
|------|------|
| AlertDialog | 警告对话框 |
| ActionSheet | 操作列表 |
| BindSheet | 半模态转场 |
| Popup | 气泡提示 |
| Toast | 提示信息 |
| PromptDialog | 输入对话框 |

#### 4.2 菜单组件 ⭐⭐⭐

| 组件 | 用途 |
|------|------|
| Menu | 菜单容器 |
| MenuItem | 菜单项 |
| ContextMenu | 右键菜单 |
| CustomDialog | 自定义对话框 |

#### 4.3 状态管理与渲染控制 ⭐⭐⭐⭐⭐

| 内容 | 说明 |
|------|------|
| if | 条件渲染 |
| ForEach | 列表渲染 |
| @State | 组件状态 |
| @Prop | 父子传值 |
| @Link | 双向绑定 |
| @Provide/@Consume | 跨层级传递 |
| @Observed/@ObjectLink | 对象观察 |

---

## 三、学习顺序建议

### 第1周：基础布局和显示
1. 通用属性
2. 通用事件
3. Column/Row 布局
4. Text 显示
5. Button 按钮

### 第2周：输入和选择
1. TextInput 输入框
2. Checkbox/Radio 选择
3. Slider 滑动条
4. Toggle 开关
5. Select 下拉选择

### 第3周：列表和滚动
1. Scroll 滚动
2. List/ListItem 列表
3. Grid 网格
4. ForEach 渲染

### 第4周：导航和弹窗
1. Tabs/TabContent 标签页
2. Navigator 导航
3. AlertDialog 对话框
4. Popup 弹窗

### 第5-6周：动画和手势
1. animateTo 动画
2. transition 转场
3. 手势处理
4. 画布绘制

---

## 四、实战项目建议

### 入门级
- [ ] **登录页**: Text + TextInput + Button
- [ ] **计数器**: Text + Button + @State
- [ ] **待办列表**: List + TextInput + Checkbox

### 进阶级
- [ ] **表单页**: TextInput + Select + Slider + DatePicker
- [ ] **商品列表**: List + Image + Tabs
- [ ] **设置页**: Toggle + Slider + Select

### 高级
- [ ] **图片查看器**: Swiper + Image + 手势
- [ ] **画板应用**: Canvas + 手势
- [ ] **动画演示**: 各种动画效果展示

---

## 五、参考资源

### 官方文档

| 资源 | 链接 |
|------|------|
| ArkTS组件总览 | https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkui-declarative-comp |
| 按钮与选择 | https://developer.huawei.com/consumer/cn/doc/harmonyos-references-v5/button-and-selection-V5 |
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

> **更新日期**: 2025-02-12
> **文档路径**: `/Users/a0000/Desktop/dk/ty/MyApplication/plan/ArkTS组件学习指南.md`
