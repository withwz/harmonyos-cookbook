import router from '@ohos.router'

/**
 * Image Kit 演示
 *
 * 基于 HarmonyOS 官方文档整理
 * https://developer.huawei.com/consumer/cn/doc/harmonyos-references/arkts-apis-image-image
 */

interface ObjectFitItem {
  name: string
  value: ImageFit
  description: string
}

interface ImageSourceItem {
  name: string
  description: string
  code: string
}

@Entry
@Component
struct ImageKitDemo {
  @State selectedIndex: number = 0
  @State loadingIndex: number = -1

  // objectFit 缩放模式列表
  private objectFitList: Array<ObjectFitItem> = [
    { name: 'Cover', value: ImageFit.Cover, description: '保持宽高比，放大或缩小，直到填满容器' },
    { name: 'Contain', value: ImageFit.Contain, description: '保持宽高比，缩小或放大，直到完全显示' },
    { name: 'Fill', value: ImageFit.Fill, description: '不保持宽高比，填满容器' },
    { name: 'None', value: ImageFit.None, description: '保持原有尺寸，不缩放' },
    { name: 'ScaleDown', value: ImageFit.ScaleDown, description: '保持宽高比，仅缩小不放大' }
  ]

  // 图片来源示例
  private imageSources: Array<ImageSourceItem> = [
    {
      name: '本地资源',
      description: '使用 $r() 加载 resources/base/media 目录下的图片',
      code: "Image($r('app.media.icon'))"
    },
    {
      name: '网络图片',
      description: '使用 http/https URL 加载网络图片（需配置网络权限）',
      code: "Image('https://example.com/image.jpg')"
    },
    {
      name: 'Base64 字符串',
      description: '使用 Base64 编码的图片数据',
      code: "Image('data:image/png;base64,iVBOR...')"
    },
    {
      name: 'PixelMap',
      description: '使用图像解码后的 PixelMap 对象',
      code: 'Image(this.pixelMap)'
    }
  ]

  // 获取颜色
  private getColor(index: number): string {
    const colors: Array<string> = ['#FF6B6B', '#4ECDC4', '#45B7D1', '#96CEB4', '#FFEEAD', '#D4A5A5', '#9B59B6', '#3498DB']
    return colors[index % colors.length]
  }

  build() {
    Scroll() {
      Column({ space: 0 }) {
        // 顶部导航
        this.Header()

        // 主要内容
        Column({ space: 16 }) {
          // 1. 图片来源
          this.ImageSourcesSection()

          // 2. 基础属性
          this.BasicPropsSection()

          // 3. objectFit 缩放模式
          this.ObjectFitSection()

          // 4. 事件回调
          this.EventsSection()

          // 5. 高级属性
          this.AdvancedPropsSection()
        }
        .width('100%')
        .padding({ left: 16, right: 16, bottom: 20 })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  Header() {
    Column({ space: 12 }) {
      Row() {
        Button() {
          Text('←')
            .fontSize(18)
            .fontColor(Color.White)
        }
        .width(32)
        .height(32)
        .backgroundColor('#007DFF')
        .borderRadius(16)
        .onClick(() => {
          router.back()
        })
      }
      .width('100%')

      Text('Image 组件')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor('#1F1F1F')

      Text('图片渲染与管理')
        .fontSize(14)
        .fontColor('#999999')
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius({ bottomLeft: 20, bottomRight: 20 })
  }

  @Builder
  ImageSourcesSection() {
    Column({ space: 12 }) {
      Text('图片来源')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor('#1F1F1F')

      ForEach(this.imageSources, (item: ImageSourceItem, index: number) => {
        Column({ space: 8 }) {
          Row({ space: 12 }) {
            // 色块图标
            Column() {
              Text((index + 1).toString())
                .fontSize(16)
                .fontColor(Color.White)
                .fontWeight(FontWeight.Bold)
            }
            .width(40)
            .height(40)
            .backgroundColor(this.getColor(index))
            .borderRadius(8)
            .justifyContent(FlexAlign.Center)

            Column({ space: 4 }) {
              Text(item.name)
                .fontSize(15)
                .fontWeight(FontWeight.Medium)
                .fontColor('#1F1F1F')

              Text(item.description)
                .fontSize(12)
                .fontColor('#999999')
            }
            .alignItems(HorizontalAlign.Start)
            .layoutWeight(1)
          }
          .width('100%')
          .padding(12)
          .backgroundColor('#F8F8F8')
          .borderRadius(12)
        }
      }, (item: ImageSourceItem, index: number) => `${index}`)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(16)
  }

  @Builder
  BasicPropsSection() {
    Column({ space: 12 }) {
      Text('基础属性')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor('#1F1F1F')

      Column({ space: 8 }) {
        this.PropRow('width / height', 'Length', '设置图片的宽度和高度')
        this.PropRow('alt', 'string', '加载失败时显示的替代文本')
        this.PropRow('objectFit', 'ImageFit', '图片的缩放模式')
        this.PropRow('syncLoad', 'boolean', '是否同步加载图片')
        this.PropRow('borderRadius', 'Length', '图片圆角半径')
        this.PropRow('border', 'BorderOptions', '图片边框样式')
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(16)
  }

  @Builder
  PropRow(name: string, type: string, desc: string) {
    Row({ space: 12 }) {
      Text(name)
        .fontSize(13)
        .fontFamily('monospace')
        .fontColor('#007DFF')
        .fontWeight(FontWeight.Medium)
        .width(100)

      Text(type)
        .fontSize(11)
        .fontColor('#999999')
        .fontFamily('monospace')
        .width(70)

      Text(desc)
        .fontSize(12)
        .fontColor('#666666')
        .layoutWeight(1)
    }
    .width('100%')
    .padding({ top: 8, bottom: 8 })
    .borderRadius(8)
  }

  @Builder
  ObjectFitSection() {
    Column({ space: 12 }) {
      Text('objectFit 缩放模式')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor('#1F1F1F')

      ForEach(this.objectFitList, (item: ObjectFitItem, index: number) => {
        Row({ space: 12 }) {
          // 演示区域
          Column() {
            Text(item.name.substring(0, 2))
              .fontSize(12)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)
          }
          .width(70)
          .height(70)
          .backgroundColor(this.getColor(index + 5))
          .borderRadius(12)
          .justifyContent(FlexAlign.Center)

          // 说明
          Column({ space: 4 }) {
            Text(item.name)
              .fontSize(14)
              .fontWeight(FontWeight.Medium)
              .fontColor('#1F1F1F')

            Text(item.description)
              .fontSize(11)
              .fontColor('#999999')

            Text(`ImageFit.${item.name}`)
              .fontSize(10)
              .fontColor('#007DFF')
              .fontFamily('monospace')
              .margin({ top: 4 })
          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1)
        }
        .width('100%')
        .padding(12)
        .backgroundColor('#F8F8F8')
        .borderRadius(12)
      }, (item: ObjectFitItem, index: number) => `${index}`)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(16)
  }

  @Builder
  EventsSection() {
    Column({ space: 12 }) {
      Text('事件回调')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor('#1F1F1F')

      Column({ space: 10 }) {
        this.EventRow('onComplete', '图片数据加载成功', '#52C41A')
        this.EventRow('onError', '图片加载异常', '#FF3B30')
        this.EventRow('onFinish', '图片加载完成，不论成功或失败', '#007DFF')
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(16)
  }

  @Builder
  EventRow(name: string, desc: string, color: string) {
    Row({ space: 12 }) {
      Column() {
        Text('●')
          .fontSize(8)
          .fontColor(color)
      }
      .width(20)

      Column({ space: 2 }) {
        Text(name)
          .fontSize(13)
          .fontFamily('monospace')
          .fontColor(color)
          .fontWeight(FontWeight.Medium)

        Text(desc)
          .fontSize(12)
          .fontColor('#666666')
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }
    .width('100%')
    .padding({ top: 6, bottom: 6 })
  }

  @Builder
  AdvancedPropsSection() {
    Column({ space: 12 }) {
      Text('高级属性')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor('#1F1F1F')

      Column({ space: 8 }) {
        this.PropRow('matchTextDirection', 'boolean', '图片是否跟随文字方向')
        this.PropRow('fitOriginalSize', 'boolean', '组件尺寸与图片原始尺寸相同')
        this.PropRow('autoResize', 'boolean', '是否自动适配组件大小')
        this.PropRow('objectRepeat', 'ImageRepeat', '图片重复模式')
        this.PropRow('colorFilter', 'ColorFilter', '图片颜色滤镜效果')
        this.PropRow('draggable', 'boolean', '图片是否可拖拽')
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(16)
  }

  aboutToAppear() {
    console.log('ImageKitDemo aboutToAppear')
  }
}
