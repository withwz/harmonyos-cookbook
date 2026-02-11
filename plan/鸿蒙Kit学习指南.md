# 鸿蒙 Kit 学习指南

> HarmonyOS SDK Kit 模块学习路径和实战 Demo

---

## 一、Kit 概览

### 什么是 Kit？

Kit 是 HarmonyOS SDK 提供的**功能模块集合**，每个 Kit 专注于某一类系统能力。使用 Kit 可以快速调用系统服务，无需关注底层实现。

### 导入方式

```typescript
// 方式1：导入整个 Kit
import { http } from '@kit.NetworkKit'

// 方式2：导入特定模块
import http from '@ohos.net.http'

// 方式3：导入多个 Kit
import { http } from '@kit.NetworkKit'
import { image } from '@kit.ImageKit'
```

---

## 二、常用 Kit 详解

### 🔥 Network Kit - 网络服务

**功能**: HTTP 网络请求，支持 GET、POST、PUT、DELETE 等

**使用场景**:
- 请求 API 数据
- 上传/下载文件
- WebSocket 通信

**基础用法**:
```typescript
import http from '@ohos.net.http'

// 创建 HTTP 请求对象
const httpRequest = http.createHttp()

// 发送 GET 请求
httpRequest.request('https://api.example.com/data', {
  method: http.RequestMethod.GET,
  header: {
    'Content-Type': 'application/json'
  }
})
  .then((data) => {
    console.log(JSON.stringify(data.result))
  })
  .catch((err) => {
    console.error(`Error: ${err.message}`)
  })
```

**API 说明**:
| API | 说明 |
|-----|------|
| `http.createHttp()` | 创建 HTTP 请求对象 |
| `request(url, options)` | 发起请求 |
| `RequestMethod.GET` | GET 请求 |
| `RequestMethod.POST` | POST 请求 |
| `destroy()` | 销毁请求对象 |

**Demo 建议**: 天气应用、新闻列表、API 调用演示

---

### 🖼️ Image Kit - 图片服务

**功能**: 图片加载、解码、缓存、处理

**使用场景**:
- 加载网络图片
- 图片缓存
- 图片压缩/裁剪
- GIF/WebP 动图支持

**基础用法**:
```typescript
import { image } from '@kit.ImageKit'

// 创建 ImageSource
const imageSource = image.createImageSource(buffer)

// 解码为 PixelMap
imageSource.createPixelMap()
  .then((pixelMap) => {
    // 使用 pixelMap
  })

// 从 URL 加载图片
Image('https://example.com/image.jpg')
  .width(200)
  .height(200)
  // 自动缓存
```

**API 说明**:
| API | 说明 |
|-----|------|
| `createImageSource()` | 创建图片源 |
| `createPixelMap()` | 解码为像素图 |
| `Image()` 组件 | 图片显示组件（自动缓存） |

**Demo 建议**: 图片列表、头像显示、图片查看器

---

### 💾 Preferences Kit - 轻量级存储

**功能**: Key-Value 数据持久化存储

**使用场景**:
- 用户设置
- 应用配置
- 简单数据缓存

**基础用法**:
```typescript
import preferences from '@ohos.data.preferences'

// 获取 Preferences 实例
preferences.getPreferences(context, 'mystore')
  .then((pref) => {
    // 存储数据
    pref.put('key', 'value')

    // 读取数据
    pref.get('key', 'defaultValue')

    // 删除数据
    pref.delete('key')

    // 持久化到磁盘
    pref.flush()
  })
```

**API 说明**:
| API | 说明 |
|-----|------|
| `getPreferences()` | 获取存储实例 |
| `put(key, value)` | 存储数据 |
| `get(key, default)` | 读取数据 |
| `delete(key)` | 删除数据 |
| `flush()` | 同步到磁盘 |

**支持的数据类型**: number, string, boolean, Array<number>

**Demo 建议**: 记账应用、设置页面、主题切换

---

### 🔔 Notification Kit - 通知服务

**功能**: 应用内通知、系统级通知推送

**使用场景**:
- 消息提醒
- 定时通知
- 进度通知
- 后台任务通知

**基础用法**:
```typescript
import notificationManager from '@ohos.notificationManager'

// 发布通知
const notificationRequest = {
  id: 1,
  content: {
    contentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
    normal: {
      title: '标题',
      text: '内容',
      additionalText: '附加信息'
    }
  }
}

notificationManager.publish(notificationRequest)
  .then(() => {
    console.log('通知发布成功')
  })

// 取消通知
notificationManager.cancel(1)
```

**API 说明**:
| API | 说明 |
|-----|------|
| `publish(request)` | 发布通知 |
| `cancel(id)` | 取消通知 |
| `cancelAll()` | 取消所有通知 |
| `isEnabled()` | 检查通知权限 |

**Demo 建议**: 提醒应用、待办事项、闹钟

---

### 📍 Location Kit - 位置服务

**功能**: 地理定位、逆地理编码

**使用场景**:
- 获取当前位置
- 地址解析
- 地理围栏

**基础用法**:
```typescript
import geoLocationManager from '@ohos.geoLocationManager'

// 获取当前位置
geoLocationManager.getCurrentLocation({
  priority: geoLocationManager.LocationRequestPriority.FIRST_FIX,
  timeout: 10000
})
  .then((location) => {
    console.log(`纬度: ${location.latitude}`)
    console.log(`经度: ${location.longitude}`)
  })

// 持续定位
const requestInfo: geoLocationManager.LocationRequest = {
  'priority': 0x200,
  'scenario': 0x301,
  'timeInterval': 1,
  'distanceInterval': 0,
  'maxAccuracy': 0
}

let locationChange = (location) => {
  console.log(`位置更新: ${location.latitude}, ${location.longitude}`)
}

geoLocationManager.on('locationChange', requestInfo, locationChange)
```

**API 说明**:
| API | 说明 |
|-----|------|
| `getCurrentLocation()` | 获取当前位置 |
| `on('locationChange')` | 持续定位监听 |
| `off('locationChange')` | 取消监听 |
| `getAddressesFromLocation()` | 逆地理编码 |

**权限要求**:
```json5
{
  "requestPermissions": [
    {
      "name": "ohos.permission.LOCATION",
      "reason": "$string:location_reason"
    }
  ]
}
```

**Demo 建议**: 地图应用、签到应用、附近的人

---

### 🔊 Audio Kit - 音频服务

**功能**: 音频播放、录制、音效管理

**使用场景**:
- 音乐播放
- 录音功能
- 音效播放

**基础用法**:
```typescript
import media from '@ohos.multimedia.media'

// 创建播放器
let player = null

media.createAudioPlayer()
  .then((audioPlayer) => {
    player = audioPlayer
    // 设置播放源
    player.src = 'http://example.com/audio.mp3'
    // 播放
    player.play()
    // 暂停
    player.pause()
    // 停止
    player.stop()
  })
```

**API 说明**:
| API | 说明 |
|-----|------|
| `createAudioPlayer()` | 创建音频播放器 |
| `play()` | 播放 |
| `pause()` | 暂停 |
| `stop()` | 停止 |
| `seek()` | 跳转进度 |

**Demo 建议**: 音乐播放器、录音机、白噪音应用

---

## 三、学习路径建议

### 阶段一：基础 Kit (推荐先学)

| Kit | 难度 | 实用性 | 预计时间 |
|-----|------|--------|----------|
| Network Kit | ⭐⭐ | ⭐⭐⭐⭐⭐ | 1-2天 |
| Image Kit | ⭐⭐ | ⭐⭐⭐⭐⭐ | 1天 |
| Preferences Kit | ⭐ | ⭐⭐⭐⭐ | 1天 |

### 阶段二：进阶 Kit

| Kit | 难度 | 实用性 | 预计时间 |
|-----|------|--------|----------|
| Notification Kit | ⭐⭐ | ⭐⭐⭐⭐ | 1-2天 |
| Location Kit | ⭐⭐⭐ | ⭐⭐⭐ | 1-2天 |
| Audio Kit | ⭐⭐⭐ | ⭐⭐⭐ | 2-3天 |

### 阶段三：高级 Kit

| Kit | 难度 | 实用性 | 预计时间 |
|-----|------|--------|----------|
| Camera Kit | ⭐⭐⭐⭐ | ⭐⭐⭐ | 3-5天 |
| Media Kit | ⭐⭐⭐⭐ | ⭐⭐⭐ | 2-3天 |
| AVCodec Kit | ⭐⭐⭐⭐⭐ | ⭐⭐ | 5-7天 |

---

## 四、实战项目建议

### 入门级

**天气应用** - 使用 Network Kit
- 请求天气 API
- 显示天气信息
- 城市切换

**记账应用** - 使用 Preferences Kit
- 记账功能
- 数据本地存储
- 统计展示

### 进阶级

**图片浏览器** - 使用 Image Kit
- 图片列表展示
- 图片预览
- 缓存机制

**提醒应用** - 使用 Notification Kit
- 创建提醒
- 定时通知
- 通知管理

### 高级

**音乐播放器** - 使用 Audio Kit
- 音乐播放/暂停
- 进度控制
- 播放列表

**打卡应用** - 使用 Location Kit
- 获取位置
- 地理围栏
- 打卡记录

---

## 五、参考资源

### 官方文档

| 资源 | 链接 |
|------|------|
| API 参考文档 | https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ |
| 开发指南 | https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/ |
| Kit 专题 | https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/kit-overview |

### 模拟器支持情况

⚠️ 注意：部分 Kit 在模拟器上不支持或功能受限

| Kit | 模拟器支持 |
|-----|-----------|
| Network Kit | ✅ 完全支持 |
| Image Kit | ✅ 完全支持 |
| Preferences Kit | ✅ 完全支持 |
| Notification Kit | ✅ 完全支持 |
| Location Kit | ⚠️ 部分支持（X86不支持逆编码）|
| Audio Kit | ✅ 完全支持 |
| Camera Kit | ❌ 不支持 |
| Media Kit | ⚠️ 部分支持 |

---

> **更新日期**: 2025-02-11
> **文档路径**: `/Users/a0000/Desktop/dk/ty/MyApplication/plan/鸿蒙Kit学习指南.md`
