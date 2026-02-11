# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **HarmonyOS (ArkTS) learning demo project** demonstrating:
- ArkTS decorators (@State, @Prop, @Link, @Observed, @ObjectLink, @Builder)
- UI layout patterns (Column, Row, Stack, Grid, Flex, List)
- State management patterns
- Navigation patterns

## Build & Run Commands

```bash
# Build the project
hvigorw build

# Build HAP package for installation
hvigorw assembleHap

# Watch mode for development (DevEco Studio typically handles this)
hvigorw w

# Run tests
hvigorw test
```

**Note**: Development is primarily done through DevEco Studio IDE, not CLI.

## Project Architecture

### Module Structure
- **Single module application** using the Stage model (not FA model)
- Entry point: `entry/src/main/ets/entryability/EntryAbility.ets`
- All pages in `entry/src/main/ets/pages/`

### Page Registration
Pages must be registered in `entry/src/main/resources/base/profile/main_pages.json`:
```json5
{
  "src": [
    "pages/Index",
    "pages/DecoratorDemo",
    "pages/StateDemo",
    // ... add new pages here
  ]
}
```

### Navigation
Uses `@ohos.router` API:
```typescript
import router from '@ohos.router'

// Navigate
router.pushUrl({ url: 'pages/TargetPage' })

// Go back
router.back()
```

### Application Model
- **Stage Model** (not FA) - modern HarmonyOS application model
- **UIAbility**: EntryAbility in `entryability/` folder
- **Target SDK**: 6.0.1(21)
- **Device Type**: phone

## Code Organization Patterns

### Page Structure
Each page follows this pattern:
```typescript
import router from '@ohos.router'

@Entry
@Component
struct PageName {
  // State variables
  @State message: string = 'Hello'

  // Lifecycle
  aboutToAppear() {
    // Initialize data
  }

  // Build UI
  build() {
    Column() {
      // UI components
    }
  }

  // Builder functions
  @Builder
  HelperComponent() {
    // Reusable UI
  }
}
```

### Component Communication

| Decorator | Direction | Use Case |
|-----------|-----------|----------|
| @State | - | Component internal state |
| @Prop | Parent → Child (read-only) | Display parent data |
| @Link | Bidirectional | Form inputs, settings |
| @Provide/@Consume | Cross-tree | Theme, user info |
| @Observed/@ObjectLink | Nested objects | Lists, cart items |

### Data Initialization
Complex data must be initialized in `aboutToAppear()`:
```typescript
@State items: Array<MyItem> = []

aboutToAppear() {
  this.items = [
    { id: 1, name: 'Item 1' },
    { id: 2, name: 'Item 2' }
  ]
}
```

## ArkTS Language Restrictions

ArkTS is a strict superset of TypeScript with these **important restrictions**:

### ❌ Not Supported
```typescript
// Object literal types
let item: { name: string }  // ❌ Use interface instead

// Spread operator
const newArr = [...arr]  // ❌ Use loop instead

// any type
let data: any  // ❌ Use specific types

// Inline object types in arrays
const items: Array<{ name: string }> = []  // ❌ Define interface
```

### ✅ Correct Approach
```typescript
// Define interfaces
interface Item {
  name: string
}
let item: Item = { name: '' }

// Use loops for array copy
const newArr: Item[] = []
for (let i = 0; i < arr.length; i++) {
  newArr.push(arr[i])
}

// Use specific types
let data: unknown | string

// Define interface for array types
const items: Array<Item> = []
```

### State Updates
For @State objects/arrays, reassign to trigger UI updates:
```typescript
// For nested properties in @State objects
this.userInfo = { name: 'New', age: this.userInfo.age }

// For array operations
this.items.push(newItem)
this.items = [...this.items]  // Won't work - use loop instead
const newItems: Item[] = []
for (let i = 0; i < this.items.length; i++) {
  newItems.push(this.items[i])
}
this.items = newItems
```

## Documentation

Located in `plan/` folder:
- **鸿蒙装饰器Demo项目总结.md** - Comprehensive decorator guide
- **鸿蒙开发学习路线.md** - 7-stage learning roadmap

## Testing

- **Framework**: @ohos/hypium
- **Mocking**: @ohos/hamock
- **Test location**: `entry/src/ohosTest/` and `entry/src/test/`

## Key Files

| File | Purpose |
|------|---------|
| `entry/src/main/module.json5` | Module config, abilities, page routing ref |
| `entry/src/main/resources/base/profile/main_pages.json` | Page registration |
| `build-profile.json5` | Build configuration, target SDK |
| `oh-package.json5` | Dependencies |
| `hvigorfile.ts` | Build scripts |

## When Adding New Features

1. Create new `.ets` file in `entry/src/main/ets/pages/`
2. Register in `main_pages.json`
3. Add navigation button/index on appropriate parent page
4. Follow ArkTS strict typing rules (use interfaces, no spread operator)
5. Initialize complex data in `aboutToAppear()`

## Common Issues & Solutions

### 编译错误 (Compiler Errors)

#### 1. 对象字面量类型错误
```
ERROR: Object literals cannot be used as type declarations
```
**原因**: ArkTS 不支持 `{ name: string }` 这种内联类型
**解决**: 定义接口
```typescript
// ❌ 错误
function foo(item: { name: string }) {}

// ✅ 正确
interface Item { name: string }
function foo(item: Item) {}
```

#### 2. 展开运算符错误
```
ERROR: It is possible to spread only arrays or classes derived from arrays
```
**原因**: ArkTS 不支持 `[...arr]`
**解决**: 使用循环复制
```typescript
// ❌ 错误
this.items = [...this.items]

// ✅ 正确
const newItems: Item[] = []
for (let i = 0; i < this.items.length; i++) {
  newItems.push(this.items[i])
}
this.items = newItems
```

#### 3. 数组类型推断错误
```
ERROR: Array literals must contain elements of only inferrable types
```
**原因**: 数组包含对象字面量类型
**解决**: 定义接口并明确类型
```typescript
// ❌ 错误
private items: Array<{ name: string }> = []

// ✅ 正确
interface Item { name: string }
private items: Array<Item> = []
```

#### 4. @Builder 函数内不能写普通代码
```
ERROR: Only UI component syntax can be written here
```
**原因**: @Builder 函数内不能写 `let total = 0` 等普通 TypeScript 代码
**解决**: 将计算逻辑提取到方法中
```typescript
// ❌ 错误
@Builder
MyView() {
  let total = 0
  Text(`${total}`)
}

// ✅ 正确
private getTotal(): number {
  let total = 0
  // 计算逻辑
  return total
}

@Builder
MyView() {
  Text(`${this.getTotal()}`)
}
```

#### 5. Column overflow 属性不存在
```
ERROR: Property 'overflow' does not exist on type 'ColumnAttribute'
```
**原因**: ArkUI 中 Column/Row 不支持 `overflow` 属性
**解决**: 使用 `clip` 属性
```typescript
// ❌ 错误
Column().overflow(Overflow.Hidden)

// ✅ 正确
Column().clip(true)
```

### @Prop 行为问题

#### Q: @Prop 在子组件中可以修改吗？
**A**: 可以修改，但修改**不会同步到父组件**
- @Prop 是值拷贝，子组件修改只在子组件内生效
- @Link 是引用传递，子组件修改会同步到父组件

```typescript
// @Prop - 修改不同步父组件
@Prop value: string
this.value = 'new'  // 只影响子组件

// @Link - 修改同步父组件
@Link value: string
this.value = 'new'  // 父组件也会更新
```

### 状态更新问题

#### Q: 为什么修改 @State 对象的属性后 UI 没有更新？
**A**: @State 只能观察到第一层属性变化
```typescript
// ❌ 嵌套属性修改不会触发更新
@State data = { user: { name: 'Tom' } }
this.data.user.name = 'Jerry'  // UI 不更新

// ✅ 解决方案1: 重新赋值整个对象
this.data = { user: { name: 'Jerry' } }

// ✅ 解决方案2: 使用 @Observed + @ObjectLink
@Observed
class User { name: string }
@ObjectLink user: User
this.user.name = 'Jerry'  // UI 会更新
```

### 路由问题

#### Q: 新页面跳转报错 "page not found"
**A**: 必须在 `main_pages.json` 中注册页面
```json5
{
  "src": [
    "pages/Index",
    "pages/NewPage"  // 添加新页面
  ]
}
```

### 性能问题

#### Q: ForEach 渲染列表时卡顿
**A**: 必须提供唯一的 key
```typescript
// ❌ 使用索引作为 key (性能差)
ForEach(items, (item, index) => {
  ListItem() { ... }
}, (item, index) => index.toString())

// ✅ 使用唯一 ID
ForEach(items, (item) => {
  ListItem() { ... }
}, (item) => item.id)
```
