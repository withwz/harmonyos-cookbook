# Image Kit 学习指南

> HarmonyOS 图片加载、缓存和显示组件详解

---

## 一、Image Kit 概述

### 什么是 Image Kit？

Image Kit 提供了图片的加载、解码、缓存和显示能力，支持多种图片格式和来源。

### 导入方式

```typescript
// 方式1：导入组件（推荐）
import { Image } from '@kit.ImageKit'

// 方式2：直接使用（简单场景）
Image('https://example.com/image.jpg')
```

---

## 二、支持的图片格式

| 格式 | 扩展名 | 说明 |
|--------|---------|------|
| **JPEG** | .jpg, .jpeg | 有损压缩，适合照片 |
| **PNG** | .png | 无损压缩，支持透明通道 |
| **GIF** | .gif | 支持动画 |
| **BMP** | .bmp | 无损位图 |
| **WEBP** | .webp | 新一代格式，更小体积 |
| **SVG** | .svg | 矢量图标，任意缩放 |
| **HEIF** | .heif | 高效图片格式（华为专有） |

---

## 三、图片来源

### 1. 本地资源图片

```typescript
// 从资源目录加载
Image($r('app.media.app_icon'))
  .width(100)
  .height(100)

// 支持的目录
// $r('app.media.xxx')  - media 目录
// $r('app.layer.xxx')  - layered image 目录
// $r('app.file.xxx')  - file directory（仅应用沙箱）
```

### 2. 网络图片

```typescript
// 从网络 URL 加载
Image('https://example.com/image.jpg')
  .width(200)
  .height(200)
```

### 3. Base64 字符串

```typescript
// Base64 编码的图片
Image('data:image/png;base64,iVBORw0KGgoAAAANSUhEUg...')
  .width(100)
  .height(100)
```

### 4. PixelMap 图片

```typescript
// 使用 PixelMap 类型
@State pixelMap: PixelMap | null = null

// 创建并使用 PixelMap
this.pixelMap = pixelMap
Image(this.pixelMap)
  .width(100)
  .height(100)
```

---

## 四、核心属性

### 基础属性

| 属性 | 类型 | 说明 |
|------|------|------|
| `width` | Length | 图片宽度 |
| `height` | Length | 图片高度 |
| `alt` | string | 占位文本或失败时显示 |
| `objectFit` | ImageFit | 图片缩放模式 |

### 图片缩放模式 (ImageFit)

| 值 | 说明 | 图示 |
|------|------|------|
| `Cover` | 保持比例缩放至完全覆盖，可能裁剪 | [图片] |
| `Contain` | 保持比例缩放至完全显示，可能有留白 | [图片] |
| `Fill` | 拉伸填充，不保持比例 | [图片=====] |
| `None` | 不缩放，原始尺寸 | [图片] |
| `ScaleDown` | 仅缩小，不放大 | [图片] |

### 边框样式

```typescript
Image('https://example.com/image.jpg')
  .borderRadius(8)           // 圆角
  .border({ width: 2, color: '#E6E6E6' })  // 边框
```

---

## 五、事件回调

| 事件 | 触发时机 | 用途 |
|------|----------|------|
| `onStart` | 图片开始加载 | 显示加载动画 |
| `onComplete` | 图片加载成功 | 隐藏加载动画 |
| `onError` | 图片加载失败 | 显示错误占位图 |
| `onSuccess` | 图片加载成功（部分场景） | 数据处理 |

### 事件使用示例

```typescript
@State loading: boolean = false
@State errorMsg: string = ''

Image('https://example.com/image.jpg')
  .width(200)
  .height(200)
  .onStart(() => {
    this.loading = true      // 开始加载
  })
  .onComplete(() => {
    this.loading = false     // 加载完成
  })
  .onError((errorArgs: Record<string, string>) => {
    this.loading = false
    this.errorMsg = '加载失败: ' + errorArgs.componentWidth
  })
  .onSuccess(() => {
    console.log('图片加载成功')
  })
```

---

## 六、占位图

### alt 属性

```typescript
// 文本占位
Image('https://example.com/avatar.jpg')
  .alt('用户头像')
  .width(80)
  .height(80)

// 图片资源占位（失败时显示）
Image('https://example.com/photo.jpg')
  .alt($r('app.media.placeholder'))
  .width(200)
  .height(200)
```

### 占位图策略

```typescript
Column({ space: 8 }) {
  // 默认占位图
  Image('')
    .width(100)
    .height(100)
    .alt('加载中...')
    .borderRadius(8)
    .backgroundColor('#F0F0F0')

  // 实际图片
  Image('https://example.com/real.jpg')
    .width(100)
    .height(100)
    .borderRadius(8)
    .alt('真实图片')
    .onComplete(() => {
      // 图片加载完成后替换
    })
}
```

---

## 七、同步加载与异步加载

### 同步加载（默认）

```typescript
// 图片直接显示
Image($r('app.media.icon'))
```

### 异步加载

```typescript
// 使用 ImageSource
import { image } from '@kit.ImageKit'

@State asyncImage: image.ImageSource = image.createImageSource(0)

aboutToAppear() {
  // 异步创建图片源
  image.createImageSource('https://example.com/image.jpg')
    .then((source: image.ImageSource) => {
      this.asyncImage = source
    })
    .catch((err: Error) => {
      console.error('图片加载失败')
    })
}
```

---

## 八、缓存机制

### 自动缓存

```typescript
// 系统自动缓存已加载的图片
// 第二次访问时直接从缓存读取，无需重新下载
Image('https://example.com/image.jpg')
  .width(200)
  .height(200)
```

### 缓存策略

| 策略 | 说明 | 适用场景 |
|--------|------|----------|
| **内存缓存** | 已解码的图片缓存在内存中 | 快速访问 |
| **磁盘缓存** | 原始图片文件缓存在本地 | 离线可用 |
| **预加载** | 提前加载可能需要的图片 | 提升体验 |

---

## 九、性能优化

### 1. 使用合适的图片格式

| 场景 | 推荐格式 |
|--------|----------|
| 图标 | SVG 或 PNG |
| 照片 | JPEG |
| 透明图片 | PNG 或 WEBP |
| 动画图 | GIF |

### 2. 图片尺寸优化

```typescript
// 根据屏幕密度加载不同尺寸
Image($r('app.media.icon'))
  .width(48)     // 小尺寸图标
  .height(48)
```

### 3. 按需加载

```typescript
// 列表使用缩略图，点击查看大图
@State showDetail: boolean = false

if (this.showDetail) {
  // 显示大图
  Image('https://example.com/large.jpg')
} else {
  // 显示缩略图
  Image('https://example.com/thumb.jpg')
}
```

---

## 十、常见问题

### Q1: 图片不显示？

**可能原因**:
1. 路径错误
2. 网络权限未配置
3. 图片格式不支持
4. 网络地址需要 https

**解决方案**:
```json5
// module.json5 中配置网络权限
{
  "requestPermissions": [
    {
      "name": "ohos.permission.INTERNET"
    }
  ]
}
```

### Q2: 图片模糊？

**原因**: 图片分辨率低于屏幕密度

**解决**: 使用高分辨率图片或 @2x/@3x 资源

### Q3: 加载慢？

**解决**:
1. 使用缩略图
2. 启用缓存
3. 压缩图片大小
4. 使用 CDN

---

## 十一、Demo 页面说明

### ImageKitDemo.ets 包含示例

| 示例 | 内容 |
|------|------|
| 示例1 | 基础本地图片加载 |
| 示例2 | 网络图片 + 加载状态 |
| 示例3 | 占位图设置 |
| 示例4 | 缓存机制说明 |
| 示例5 | objectFit 缩放模式对比 |
| 示例6 | SVG 图片使用 |

---

## 十二、学习检查清单

- [ ] 了解 Image 组件基础用法
- [ ] 掌握 objectFit 缩放模式
- [ ] 理解图片事件（onStart/onComplete/onError）
- [ ] 学会占位图设置
- [ ] 了解缓存机制
- [ ] 掌握网络图片加载
- [ ] 理解 SVG 优势

---

> **更新日期**: 2025-02-11
> **相关资源**: [HarmonyOS Image 组件文档](https://developer.huawei.com/consumer/cn/doc/harmonyos-references/ts-basic-components-image)
