# RPC 学习计划

> HarmonyOS RPC (Remote Procedure Call) 进程间通信学习

---

## 一、RPC 概念

### 1.1 IPC vs RPC

| 类型 | 全称 | 使用场景 |
|------|------|----------|
| IPC | Inter-Process Communication | 单设备内进程间通信 |
| RPC | Remote Procedure Call | 跨设备远程过程调用 |

### 1.2 核心概念

```
┌─────────────┐         ┌─────────────┐
│  Client     │         │  Server     │
│  (Ability)  │─────────│  (Ability)  │
│             │  RPC    │             │
└─────────────┘         └─────────────┘
     请求                        响应
```

**关键术语**:
- **Stub**: 服务端代理对象，实现 IRemoteObject
- **Proxy**: 客户端代理对象，通过 ID 请求远程调用
- **MessageSequence**: 消息序列化，跨进程传递数据
- **IRemoteObject**: 远程对象接口

---

## 二、迭代计划 (5次循环)

| # | 迭代内容 | 预估时间 | 状态 |
|---|----------|----------|------|
| 1 | RPC 基础：SimpleAbility 通信 | 20min | ✅ 完成 |
| 2 | MessageSequence 数据序列化 | 15min | ⏳ 进行中 |
| 2 | MessageSequence 数据序列化 | 15min | ⏸️ 待开始 |
| 3 | 跨设备 RPC 调用 | 20min | ⏸️ 待开始 |
| 4 | RPC 生命周期管理 | 15min | ⏸️ 待开始 |
| 5 | 完整 Demo 综合验证 | 20min | ⏸️ 待开始 |

---

## 三、参考文档

- [RPC API 参考](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/js-apis-rpc)
- [远端状态订阅](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-v5/subscribe-remote-state-V5)

---

## 四、核心 API

### 4.1 创建 RemoteObject

```typescript
import rpc from '@ohos.rpc'

// 服务端：继承 IRemoteObject
class MyRemoteObject extends rpc.RemoteObject {
  constructor(descriptor: string) {
    super(descriptor)
  }

  // 实现远程方法
  onRemoteRequest(code: number, data: rpc.MessageSequence, reply: rpc.MessageSequence, option: rpc.MessageOption) {
    // 处理请求
  }
}
```

### 4.2 连接远程 Ability

```typescript
// 客户端：连接服务端 Ability
let want = {
  bundleName: 'com.example.app',
  abilityName: 'MyServiceAbility'
}

this.connectId = rpc.connectAbility(want, (err, proxy) => {
  if (!err) {
    this.remoteProxy = proxy
  }
})
```

### 4.3 MessageSequence 序列化

```typescript
import rpc from '@ohos.rpc'

// 创建序列化容器
let sequence = rpc.MessageSequence.create()

// 写入数据
sequence.writeInt(123)
sequence.setFloat(3.14)
sequence.writeString('Hello')

// 读取数据
let val = sequence.readInt()
let str = sequence.readString()
```

---

## 五、Demo 设计

### 5.1 功能目标

- [ ] 实现两个 Ability 之间的通信
- [ ] Client Ability 发送请求
- [ ] Server Ability 接收并处理请求
- [ ] 返回响应数据
- [ ] 展示通信日志

### 5.2 文件结构

```
entry/src/main/ets/
├── pages/
│   └── RPCDemo.ets           # RPC 演示页面
├── abilities/
│   ├── EntryAbility.ets         # 主入口 (Client)
│   └── RPCServiceAbility.ets  # RPC 服务 (Server)
```

---

> **更新日期**: 2025-02-14
> **当前迭代**: #1
