# HarmonyOS ArkTS 学习 Demo - Vibe Coding 实践

> **AI 全自动开发** - 从需求分析到代码编写，从构建部署到效果验证，全程 AI 驱动，无需人工干预。

## 🎯 Vibe Coding 项目

本项目是 **AI 驱动开发** 的实践验证。通过 Claude Code + MCP 工具链，实现"小步快跑"的开发体验。

### 核心特点

- 🤖 **AI 编码** - Claude 负责代码编写和方案设计
- 🔄 **自动化验证** - 构建 → 安装 → 验证全程自动化
- 📝 **Skill 驱动** - 标准化的开发流程和规范

## 🔧 开发工具链

### MCP 工具

| 名称 | 功能 | 仓库 |
|------|------|------|
| harmonyos-control | 构建、安装、启动、日志 | [harmony-dev-cli](https://github.com/withwz/harmony-dev-cli) |
| harmonyos-ui | 截图、UI 树、自动化操作 | [harmonyos-ui-inspector-mcp](https://github.com/withwz/harmonyos-ui-inspector-mcp) |

### Skill

| 名称 | 功能 | 仓库 |
|------|------|------|
| harmonyos-dev | 开发流程指南、工具协调 | [harmonyos-dev-skill](https://github.com/withwz/harmonyos-dev-skill) |

## 🔄 Vibe Coding 工作流

```mermaid
graph LR
    A[💭 用户需求] --> B[🤖 Claude 分析]
    B --> C[📝 编写代码]
    C --> D[🔨 构建]
    D --> E[📦 安装]
    E --> F[🚀 启动]
    F --> G[📸 截图验证]
    G --> H[✅ 用户确认]
    H --> I[📤 提交/迭代]
```

### 实际案例：DividerDemo 8 分钟闭环

| 阶段 | 操作 | 执行者 |
|:----:|------|--------|
| 💭 **需求** | 选择方案 A: DividerDemo | 用户 |
| 🤖 **编码** | 创建 DividerDemo.ets + 注册页面 | Claude |
| 🔨 **构建** | hv_build | MCP |
| 📦 **安装** | hv_install | MCP |
| 🚀 **启动** | hv_start | MCP |
| 📸 **验证** | screenshot + tap + screenshot | MCP |
| ✅ **确认** | 效果正常 | 用户 |
| 📤 **提交** | git commit/push (Co-Authored-By) | Claude |

> **全程无需人工操作设备！** 从想法到验证，8 分钟完成闭环。

## 📱 内容概览

- **装饰器** - State/Prop/Link/ObjectLink/Builder
- **布局** - Column/Row/Stack/Grid/Flex/List
- **组件** - Text/Image/Button/Dialog/Menu/Canvas
- **状态管理** - AppStorage/PersistentStorage
- **Kit** - Network/Image

详见 [plan/](plan/) 目录的学习文档。

## 许可证

MIT License
