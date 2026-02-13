# HarmonyOS ArkTS 学习 Demo 项目

一个专注于 HarmonyOS (ArkTS) 开发学习的演示项目，包含装饰器、布局组件、UI 组件和各种系统 Kit 的实际应用示例。

## 🎯 项目定位

### Vibe Coding 验证项目

本项目是 **Vibe Coding** 开发模式的实践验证项目。通过 AI 辅助工具链，实现"小步快跑"的开发体验：

- 🤖 **AI 驱动** - 使用 Claude Code + MCP 工具链辅助开发
- 🔄 **快速验证** - 代码 → 构建 → 安装 → 验证闭环
- 📝 **规范化** - Skill 驱动的标准化开发流程

### 鸿蒙学习功能浏览项目

作为 **HarmonyOS 组件功能展示库**，本项目提供：

- 📱 **45+ Demo 页面** - 涵盖装饰器、布局、组件、Kit
- 🔍 **可视化学习** - 每个组件都有实际演示效果
- 📚 **系统化教程** - 配套学习计划和技术文档

## 🔧 开发工具链

本项目使用以下 MCP 工具和 Skill 实现 AI 辅助开发：

### MCP 工具

| 工具 | 功能 | 链接 |
|------|------|------|
| **harmonyos-control** | 构建、安装、启动、日志查看 | [harmony-dev-cli](https://github.com/withwz/harmony-dev-cli) |
| **harmonyos-ui** | UI 自动化、截图、组件树分析 | [harmonyos-ui-inspector-mcp](https://github.com/withwz/harmonyos-ui-inspector-mcp) |

### Skill

| Skill | 功能 | 链接 |
|-------|------|------|
| **harmonyos-dev** | HarmonyOS 开发流程指南 | [harmonyos-dev-skill](https://github.com/withwz/harmonyos-dev-skill) |

### 工作流程

```
用户需求 → Claude 分析 → 调用 MCP 工具
                 ↓
          构建 → 安装 → 启动 → 截图验证
                 ↓
          小步迭代，快速反馈
```

## 项目概述

本项目是 HarmonyOS 开发的学习项目，涵盖了从基础到高级的完整学习路径：

- **ArkTS 装饰器** - @State、@Prop、@Link、@ObjectLink、@Builder 等
- **UI 布局** - Column、Row、Stack、Grid、Flex、List 等布局模式
- **UI 组件** - Text、Image、Button、TextInput 等基础组件
- **系统 Kit** - Network Kit、Image Kit 等
- **路由导航** - 页面跳转和参数传递

## 技术栈

| 技术 | 版本/说明 |
|------|----------|
| 框架 | HarmonyOS Stage 模型 |
| 语言 | ArkTS |
| 目标 SDK | 6.0.1(21) |
| 设备类型 | 手机 (phone) |
| 构建工具 | hvigor/hvigorw |
| 测试框架 | @ohos/hypium |

## 快速开始

### 环境要求

- DevEco Studio (推荐最新版本)
- Node.js 和 ohpm

### 构建运行

```bash
# 构建项目
hvigorw build

# 构建 HAP 安装包
hvigorw assembleHap

# 运行测试
hvigorw test
```

**注**: 开发主要通过 DevEco Studio IDE 进行。

## 项目结构

```
MyApplication/
├── entry/                              # 主模块
│   └── src/main/
│       ├── ets/
│       │   ├── pages/                  # 所有页面
│       │   ├── entryability/           # 应用入口
│       │   └── entrybackupability/     # 数据备份
│       ├── resources/                  # 资源文件
│       │   ├── base/element/           # 颜色、字符串等
│       │   ├── base/media/             # 图片、图标
│       │   └── base/profile/           # 配置文件
│       ├── test/                       # 单元测试
│       └── ohosTest/                   # 集成测试
├── plan/                               # 项目文档
└── hvigor/                             # 构建配置
```

## 功能模块

### 装饰器 Demo

| 页面 | 描述 |
|------|------|
| `DecoratorDemo` | 装饰器总览入口 |
| `StateDemo` | @State 组件内部状态 |
| `PropDemo` | @Prop 父子单向数据流 |
| `LinkDemo` | @Link 双向数据绑定 |
| `ObjectLinkDemo` | @ObjectLink 嵌套对象观察 |
| `BuilderDemo` | @Builder 自定义构建函数 |
| `BuilderVsComponent` | @Builder 与组件对比 |

### 布局 Demo

| 页面 | 描述 |
|------|------|
| `LayoutDemo` | 布局总览入口 |
| `ColumnLayoutDemo` | 纵向线性布局 |
| `RowLayoutDemo` | 横向线性布局 |
| `StackLayoutDemo` | 层叠布局 |
| `GridLayoutDemo` | 网格布局 |
| `FlexLayoutDemo` | 弹性布局 |
| `ListLayoutDemo` | 列表布局 |

### 系统 Kit Demo

| Kit | 状态 | 描述 |
|-----|------|------|
| Network Kit | ✅ 完成 | HTTP 网络请求 |
| Image Kit | ✅ 完成 | 图片加载与缓存 |
| Preferences Kit | 🚧 计划中 | 轻量级数据存储 |
| Notification Kit | 📋 待开发 | 通知管理 |
| Resource Management Kit | 📋 待开发 | 资源管理 |

### 高级功能

| 页面 | 描述 |
|------|------|
| `KitLearningPage` | Kit 学习导航主页 |
| `ArkTSSyntaxDemo` | ArkTS 语法特性 |
| `RouterDemo` | 页面路由功能 |

## 学习路线

项目提供了完整的学习路径规划，详见 [plan/鸿蒙开发学习路线.md](plan/鸿蒙开发学习路线.md)：

1. **基础准备** - ArkTS 语言基础
2. **装饰器学习** - 状态管理与组件通信
3. **布局组件** - UI 布局模式
4. **UI 组件** - 基础和高级组件
5. **动画效果** - 属性动画和转场
6. **网络与数据** - 网络、存储等 Kit
7. **综合实战** - 完整应用开发

## 文档

| 文档 | 描述 |
|------|------|
| [鸿蒙开发学习路线.md](plan/鸿蒙开发学习路线.md) | 7 阶段学习指南 |
| [鸿蒙装饰器Demo项目总结.md](plan/鸿蒙装饰器Demo项目总结.md) | 装饰器使用总结 |
| [ArkTS组件学习指南.md](plan/ArkTS组件学习指南.md) | 组件学习指南 |
| [鸿蒙Kit学习指南.md](plan/鸿蒙Kit学习指南.md) | Kit 学习指南 |
| [ImageKit学习指南.md](plan/ImageKit学习指南.md) | ImageKit 详细指南 |
| [组件Demo开发计划.md](plan/组件Demo开发计划.md) | 开发计划 |

## 添加新页面

1. 在 `entry/src/main/ets/pages/` 创建新 `.ets` 文件
2. 在 `entry/src/main/resources/base/profile/main_pages.json` 注册页面
3. 在父页面添加导航入口
4. 遵循 ArkTS 严格类型规则

## 常见问题

### ArkTS 限制

- ❌ 不支持对象字面量类型 `{ name: string }`
- ❌ 不支持展开运算符 `[...arr]`
- ❌ 不支持 `any` 类型

### 状态更新

```typescript
// 嵌套属性修改需重新赋值
this.data = { ...this.data, name: 'New' }

// 数组操作
this.items.push(newItem)
```

详见 [CLAUDE.md](CLAUDE.md) 获取更多开发指南。

## 开发指南

本项目使用 [Claude Code](https://claude.com/claude-code) 辅助开发，详细指南见 `CLAUDE.md`。

## 许可证

MIT License

## 贡献

欢迎提交 Issue 和 Pull Request！
