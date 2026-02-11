# 鸿蒙装饰器 Demo 项目总结

> 基于 HarmonyOS ArkTS 的装饰器学习示例项目

---

## 一、项目概述

本项目是一套完整的鸿蒙装饰器学习 Demo，通过实际可运行的示例帮助开发者快速掌握 ArkTS 装饰器的使用方法。

### 技术栈
- **语言**: ArkTS (TypeScript 的严格超集)
- **框架**: ArkUI
- **平台**: HarmonyOS

### 项目结构
```
MyApplication/
├── entry/src/main/ets/pages/
│   ├── Index.ets              # 主页入口
│   ├── DecoratorDemo.ets      # 装饰器学习导航页
│   ├── StateDemo.ets          # @State 演示
│   ├── PropDemo.ets           # @Prop 演示
│   ├── LinkDemo.ets           # @Link 演示
│   ├── ObjectLinkDemo.ets     # @ObjectLink 演示
│   └── BuilderDemo.ets        # @Builder 演示
└── plan/
    └── 鸿蒙装饰器Demo项目总结.md  # 本文档
```

---

## 二、装饰器详解

### 2.1 @State - 组件内部状态

**作用**: 管理组件内部的状态，状态变化时自动触发 UI 更新

**特点**:
- 必须本地初始化
- 不与父组件同步
- 仅组件内部可访问
- 支持类型: boolean, string, number, class, Object, Array, Map, Set, Date, enum

**示例场景**:
```typescript
@State count: number = 0
@State message: string = 'Hello World'
@State items: string[] = ['项目1', '项目2']
```

**Demo 文件**: `StateDemo.ets`

**包含示例**:
1. 计数器 - 基础状态变化
2. 文本状态 - 字符串切换
3. 布尔状态 - 控制 UI 显示/隐藏
4. 数组状态 - 动态列表操作
5. 对象状态 - 对象属性修改

---

### 2.2 @Prop - 父子单向数据传递

**作用**: 父组件向子组件单向传递数据，子组件只读不可修改

**特点**:
- 数据流向: 父组件 → 子组件
- 子组件只能读取，不能修改
- 必须从父组件接收
- 支持类型转换

**Demo 文件**: `PropDemo.ets`

**包含示例**:
1. 用户卡片 - 显示用户信息（只读）
2. 计数显示 - 多个子组件显示同一数据
3. 产品列表 - 产品信息展示

**与 @Link 的区别**:
| 特性 | @Prop | @Link |
|------|-------|-------|
| 数据流向 | 父→子 | 双向 |
| 子组件权限 | 只读 | 可修改 |
| 传递方式 | `value:xxx` | `value:$xxx` |

---

### 2.3 @Link - 父子双向数据绑定

**作用**: 父组件与子组件之间的双向数据绑定

**特点**:
- 数据流向: 双向同步
- 子组件修改会同步到父组件
- 必须与父组件的 @State 配合使用
- 使用 `$` 语法传递引用

**Demo 文件**: `LinkDemo.ets`

**包含示例**:
1. 双向计数器 - 子组件修改父组件数值
2. 开关控制 - Toggle 双向绑定
3. 滑动条 - Slider 进度同步

**使用方式**:
```typescript
// 父组件
@State count: number = 0
CounterComponent({ count: $count })  // 注意使用 $count

// 子组件
@Component
struct CounterComponent {
  @Link count: number  // 双向绑定
}
```

---

### 2.4 @Observed + @ObjectLink - 嵌套对象深度观察

**作用**: 观察嵌套对象的深层属性变化

**为什么需要**:
`@State` 只能观察到第一层属性变化，无法观察到嵌套对象的属性修改。

```typescript
// ❌ @State 无法观察到嵌套属性变化
@State data = { user: { name: 'Tom' } }
this.data.user.name = 'Jerry'  // UI 不会更新!

// ✅ @Observed + @ObjectLink 可以观察
@Observed
class User {
  name: string
}

@ObjectLink user: User
this.user.name = 'Jerry'  // UI 会自动更新!
```

**Demo 文件**: `ObjectLinkDemo.ets`

**包含示例**:
1. 购物车 - 商品数量修改（嵌套属性观察）
2. 地址管理 - 地址信息修改

**使用方式**:
```typescript
// 1. 用 @Observed 标记类
@Observed
class Product {
  name: string
  quantity: number
}

// 2. 父组件使用 @State 管理
@State cartItems: Product[] = []

// 3. 子组件用 @ObjectLink 接收
@Component
struct CartItem {
  @ObjectLink product: Product
}
```

---

### 2.5 @Builder - 自定义构建函数

**作用**: 将重复的 UI 结构封装成可复用的构建函数

**类型**:
1. **全局 @Builder** - 跨组件复用
2. **局部 @Builder** - 组件内复用

**Demo 文件**: `BuilderDemo.ets`

**包含示例**:
1. 全局按钮样式 - 统一按钮外观
2. 统计卡片 - 数据展示组件
3. 用户卡片 - 带参数的复杂组件
4. 条件渲染 - 根据状态显示不同 UI
5. 列表项复用 - ForEach 中的复用

**使用方式**:
```typescript
// 全局 @Builder
@Builder
function StyledButton(text: string, type: ButtonType, onClick: () => void) {
  Button(text)
    .onClick(onClick)
}

// 组件内 @Builder
@Component
struct MyComponent {
  @Builder
  MyCard(title: string) {
    Text(title)
  }
}
```

---

## 三、ArkTS 语法注意事项

### 3.1 类型系统

ArkTS 是 TypeScript 的严格超集，有以下限制：

**❌ 不支持对象字面量类型**
```typescript
// 错误
let item: { title: string, desc: string } = { title: '', desc: '' }

// 正确 - 定义接口
interface Item {
  title: string
  desc: string
}
let item: Item = { title: '', desc: '' }
```

**❌ 不支持展开运算符**
```typescript
// 错误
const newArr = [...this.items]

// 正确 - 使用循环
const newArr: string[] = []
for (let i = 0; i < this.items.length; i++) {
  newArr.push(this.items[i])
}
this.items = newArr
```

### 3.2 @Builder 函数限制

@Builder 函数内只能包含 UI 组件语法，不能写普通 TypeScript 代码：

```typescript
// ❌ 错误
@Builder
MyView() {
  let total = 0  // 普通代码不允许
  Text(`总计: ${total}`)
}

// ✅ 正确
private getTotal(): number {
  let total = 0
  // 计算逻辑
  return total
}

@Builder
MyView() {
  Text(`总计: ${this.getTotal()}`)  // 调用方法
}
```

---

## 四、装饰器选择决策树

```
需要管理状态？
    │
    ├─ 组件内部使用？
    │   └─► @State
    │
    └─ 需要与其他组件同步？
        │
        ├─ 父组件数据 → 子组件？
        │   ├─ 子组件只读？
        │   │   └─► @Prop
        │   └─ 子组件需要修改？
        │       └─► @Link
        │
        └─ 传递嵌套对象？
            └─► @Observed + @ObjectLink
```

---

## 五、装饰器对比表

| 装饰器 | 数据流向 | 初始化来源 | 观察深度 | 典型场景 |
|--------|----------|------------|----------|----------|
| @State | - | 本地/父组件 | 第一层 | 组件内部状态 |
| @Prop | 父→子 | 父组件 | 第一层 | 数据展示 |
| @Link | 双向 | 父组件 @State | 第一层 | 表单输入 |
| @ObjectLink | 双向 | 父组件 @Observed | 深层 | 嵌套对象 |
| @Builder | - | - | - | UI 复用 |

---

## 六、学习路径建议

### 初级阶段
1. **@State** - 理解状态管理的基础
2. **@Builder** - 学会封装可复用的 UI 组件

### 中级阶段
3. **@Prop** - 理解组件间的数据传递
4. **@Link** - 掌握双向数据绑定

### 高级阶段
5. **@Observed + @ObjectLink** - 解决复杂嵌套对象的响应式问题

---

## 七、常见问题

### Q1: 为什么修改对象属性后 UI 没有更新？

**原因**: `@State` 只能观察到第一层属性变化。

**解决方案**:
1. 重新赋值整个对象: `this.obj = { ...this.obj }`
2. 使用 `@Observed + @ObjectLink`

### Q2: @Prop 和 @Link 如何选择？

**选择 @Prop**: 子组件只需要展示数据，不需要修改
**选择 @Link**: 子组件需要修改数据，且修改需要同步到父组件

### Q3: 如何在 ForEach 中正确渲染列表？

```typescript
// 正确示例
ForEach(this.items, (item: Item, index: number) => {
  ListItem() {
    Text(item.name)
  }
}, (item: Item, index: number) => item.id)  // 必须提供唯一的 key
```

---

## 八、参考资源

- [HarmonyOS 官方文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides)
- [ArkTS 状态管理](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-state-management-overview)
- [@State 装饰器](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-state)
- [@Observed/@ObjectLink](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/arkts-observed-and-objectlink)

---

## 九、更新日志

| 版本 | 日期 | 内容 |
|------|------|------|
| v1.0 | 2025-02-10 | 初始版本，包含5个装饰器 Demo |

---

> **作者**: AI Assistant
> **项目路径**: `/Users/a0000/Desktop/dk/ty/MyApplication`
> **文档路径**: `/Users/a0000/Desktop/dk/ty/MyApplication/plan/鸿蒙装饰器Demo项目总结.md`
