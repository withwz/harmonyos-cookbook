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

## 🔥 痛苦的调试经验教训（2025-02-12）

### 问题背景
在调试编译错误时，进行了大量无效操作，导致项目状态混乱，浪费大量时间。

---

### ❌ 关键错误

#### 1. 盲目使用 git 操作
- **问题**: 在文件删除问题上使用了 `git rm` + `git restore` + `git reset` + `git push --force`
- **后果**: 
  - 项目状态来回变化，无法准确定位真正问题
  - 远程仓库历史被多次无意义的提交污染
  - 用户无法理解项目当前真实状态
- **教训**: 
  - **文件删除永远优先于 git 操作**
  - 先确认文件确实不需要，再删除
  - 使用 `git rm` 时应确认并告知用户

#### 2. 修改配置文件而非删除文件
- **问题**: SelectDemo.ets 和 GridDemo.ets 被删除后，配置缓存导致编译器仍引用它们
- **尝试的方案**: 修改 `main_pages.json` 删除页面注册
- **后果**: 
  - 编译器可能缓存了旧的配置信息
  - JSON 文件修改可能未及时生效
  - 导致反复的 "page does not exist" 错误
- **教训**: 
  - **配置修改可能需要重启 DevEco Studio**
  - 修改配置后应等待或手动刷新项目

#### 3. 缺乏与用户沟通
- **问题**: 在未理解用户需求的情况下进行了多次操作
- **表现**: 
  - 删除文件 → 恢复文件 → 修改配置 → 强制推送
  - 每一步都可能是"帮倒忙"，实际增加了混乱
- **教训**: 
  - **遇到不确定情况时，先停下来问用户**
  - **不要假设用户意图，明确说明方案**
  - **一次只做一件事，做完确认效果**

#### 4. 对问题根源判断错误
- **问题**: 将"文件存在编译错误"误判为"需要从配置删除注册"
- **实际情况**: 
  - 编译器缓存问题，删除文件后仍然报错
  - 或者是其他 IDE/编译器进程未刷新
- **教训**: 
  - **错误信息解读要准确**
  - `Page does not exist` 可能只是缓存问题
  - 应该先分析错误日志的真正原因

---

### ✅ 正确的调试流程

#### Step 1: 理解问题
- 询问用户具体的错误信息和期望行为
- 检查相关文件和配置
- **确认问题根源后再行动**

#### Step 2: 提供方案
- 给出明确的解决选项
- 说明每个方案的风险和预期效果
- **等待用户确认后再执行**

#### Step 3: 执行操作
- 一次只做一个改动
- 立即验证效果
- **不进行额外的"预防性"操作**

---

### 📝 给开发者的建议

#### 今后的调试原则
1. **最小化操作原则**
   - 只修改必要的文件
   - 避免批量修改
   - 每次修改后立即测试

2. **文件修改优先于 git 操作**
   - 先在 IDE 中删除/重命名
   - 确认无误后再提交到 git

3. **配置修改注意事项**
   - 修改 `main_pages.json` 后需要刷新或重启 IDE
   - 避免在不确定情况下多次修改配置

4. **错误排查方法**
   - 仔细阅读错误日志
   - 确认是文件问题、缓存问题还是配置问题
   - 不要急于修改，先分析再行动

---

### 🎯 最终总结

经过两个小时的折腾，核心问题是：
- **SelectDemo.ets** 和 **GridDemo.ets** 两个 Demo 文件引起编译错误
- 由于编译器缓存或配置缓存，即使删除文件和修改配置后仍报错
- 多次无效的 git 操作增加了项目复杂度

**正确的做法应该是**：
1. 先在 IDE 中清理缓存/重新构建
2. 确认编译错误真正原因
3. 有针对性地解决问题

再次为这两个小时的折腾表示歉意！希望这些经验能帮助避免类似情况。

