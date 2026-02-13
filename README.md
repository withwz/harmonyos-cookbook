# HarmonyOS ArkTS 学习 Demo 项目

> 通过 **Vibe Coding** 方式开发的 HarmonyOS 组件学习项目，包含 45+ 个 Demo 页面。

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

```
用户需求
    ↓
Claude 分析 & 编写代码
    ↓
┌─────────────────────────────────────┐
│      MCP 自动化验证流程             │
│  构建 → 安装 → 启动 → 截图验证     │
└─────────────────────────────────────┘
    ↓
用户确认效果
    ↓
小步迭代或提交
```

### 实际案例：DividerDemo

| 步骤 | 操作 | 工具 |
|------|------|------|
| 1 | 编写 DividerDemo.ets | Claude |
| 2 | 更新 main_pages.json | Claude |
| 3 | 构建项目 | hv_build |
| 4 | 安装到设备 | hv_install |
| 5 | 启动应用 | hv_start |
| 6 | 截图验证 | screenshot |
| 7 | 点击测试 | tap |
| 8 | 确认效果 | 截图反馈 |

**从想法到验证，无需人工操作设备！**

## 📱 内容概览

- **装饰器** - State/Prop/Link/ObjectLink/Builder
- **布局** - Column/Row/Stack/Grid/Flex/List
- **组件** - Text/Image/Button/Dialog/Menu/Canvas
- **状态管理** - AppStorage/PersistentStorage
- **Kit** - Network/Image

详见 [plan/](plan/) 目录的学习文档。

## 🚀 快速开始

```bash
# 构建
hvigorw build

# 安装
hdc install entry/build/default/outputs/default/*.hap

# 启动
hdc shell aa start -a EntryAbility -b com.example.myapplication
```

或使用 MCP 工具自动化完成上述流程。

## 许可证

MIT License
