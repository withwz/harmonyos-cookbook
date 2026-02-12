import router from '@ohos.router'
import { image } from '@kit.ImageKit'

/**
 * Image Kit 演示
 *
 * 展示图片加载、缓存、占位图等功能
 */

interface ImageItem {
  url: string
  name: string
  description: string
}

@Entry
@Component
struct ImageKitDemo {
  @State currentImageIndex: number = 0
  @State imageLoading: boolean = false
  @State showError: boolean = false
  @State selectedScale: number = 1

  // 本地图片示例
  private localImages: Array<string> = [
    'app.media.app_icon',  // 使用资源
    'app.media.app_icon',  // 可以重复使用
  ]

  // 网络图片列表
  private networkImages: Array<ImageItem> = [
    {
      url: 'https://img.yzcdn.cn/iconv2/157588/pic.go.png',
      name: '头像占位图',
      description: '用户默认头像'
    },
    {
      url: 'https://img.yzcdn.cn/iconv2/157588/pic.go.png',
      name: '示例图片1',
      description: '风景图片'
    }
  ]

  // 常用网络图片URL（实际开发时使用真实地址）
  private sampleUrls: Array<string> = [
    'https://example.com/image1.jpg',
    'https://example.com/image2.jpg'
  ]

  build() {
    Scroll() {
      Column({ space: 16 }) {
        // 返回按钮
        this.BackButton()

        // 标题
        this.SectionTitle('Image Kit - 图片服务')

        // 说明卡片
        this.InfoCard('Image Kit 提供图片加载、缓存、占位图等功能')

        // 示例1：基础图片加载
        this.BasicImageSection()

        // 示例2：网络图片
        this.NetworkImageSection()

        // 示例3：占位图
        this.PlaceholderSection()

        // 示例4：图片缓存
        this.CacheSection()

        // 示例5：图片缩放
        this.ScaleSection()

        // 示例6：SVG图片
        this.SVGSection()

        // API说明
        this.APISection()

        this.TipCard('💡 提示：实际开发中使用真实图片URL')
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  BackButton() {
    Row() {
      Button('← 返回')
        .fontSize(14)
        .onClick(() => {
          router.back()
        })
    }
    .width('100%')
    .margin({ bottom: 10 })
  }

  @Builder
  SectionTitle(title: string) {
    Text(title)
      .fontSize(24)
      .fontWeight(FontWeight.Bold)
      .width('100%')
  }

  @Builder
  InfoCard(info: string) {
    Text(info)
      .fontSize(14)
      .fontColor('#13C2C2')
      .width('100%')
      .padding(12)
      .backgroundColor('#E6FFFE')
      .borderRadius(8)
  }

  @Builder
  BasicImageSection() {
    Column({ space: 12 }) {
      Text('示例1：基础图片加载')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Column({ space: 12 }) {
        // 本地图片
        Column({ space: 8 }) {
          Text('本地资源图片')
            .fontSize(14)
            .fontColor('#666')

          Row({ space: 12 }) {
            Image($r('app.media.app_icon'))
              .width(80)
              .height(80)
              .borderRadius(8)
              .objectFit(ImageFit.Cover)

            Column({ space: 4 }) {
              Text('app.media.app_icon')
                .fontSize(12)
                .fontFamily('monospace')
                .fontColor('#999')

              Text('从资源目录加载')
                .fontSize(11)
                .fontColor('#666')
            }
          }
        }
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  NetworkImageSection() {
    Column({ space: 12 }) {
      Text('示例2：网络图片加载')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Column({ space: 12 }) {
        // 单张图片
        Column({ space: 8 }) {
          Text('单张网络图片')
            .fontSize(14)
            .fontColor('#666')

          if (this.imageLoading) {
            Row({ space: 8 }) {
              LoadingProgress()
                .width(20)
                .height(20)
                .color('#007DFF')

              Text('加载中...')
                .fontSize(14)
                .fontColor('#666')
            }
            .justifyContent(FlexAlign.Center)
          }

          Image('https://img.yzcdn.cn/iconv2/157588/pic.go.png')
            .width(120)
            .height(120)
            .borderRadius(8)
            .objectFit(ImageFit.Cover)
            .onStart(() => {
              this.imageLoading = true
              this.showError = false
            })
            .onComplete(() => {
              this.imageLoading = false
            })
            .onError(() => {
              this.imageLoading = false
              this.showError = true
            })
            .onError((errorArgs: Record<string, string>) => {
              console.error('图片加载失败:', JSON.stringify(errorArgs))
            })

          if (this.showError) {
            Text('图片加载失败')
              .fontSize(12)
              .fontColor('#FF6B6B')
              .margin({ top: 8 })
          }
        }
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  PlaceholderSection() {
    Column({ space: 12 }) {
      Text('示例3：占位图设置')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Column({ space: 12 }) {
        Column({ space: 8 }) {
          Row({ space: 12 }) {
            Column({ space: 4 }) {
              Text('默认占位图')
                .fontSize(14)
                .fontColor('#666')

              Text('加载前显示的图片')
                .fontSize(11)
                .fontColor('#999')
            }
            .layoutWeight(1)

            Image('https://img.yzcdn.cn/iconv2/157588/pic.go.png')
              .width(100)
              .height(100)
              .borderRadius(8)
              .objectFit(ImageFit.Cover)
              .alt('默认占位图')
              .onError(() => {
                // 占位图加载失败时的处理
              })
          }

          Row({ space: 12 }) {
            Column({ space: 4 }) {
              Text('加载失败占位图')
                .fontSize(14)
                .fontColor('#666')

              Text('网络图片加载失败时显示')
                .fontSize(11)
                .fontColor('#999')
            }
            .layoutWeight(1)

            Image('https://img.yzcdn.cn/iconv2/157588/pic.go.png')
              .width(100)
              .height(100)
              .borderRadius(8)
              .objectFit(ImageFit.Cover)
              .alt('错误占位图')
              .onError(() => {
                // 这里用错误图片替换
              })
          }
        }
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  CacheSection() {
    Column({ space: 12 }) {
      Text('示例4：图片缓存说明')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Column({ space: 8 }) {
        this.CacheItem(
          '内存缓存',
          '已解码的图片缓存在内存中，下次访问更快',
          '#52C41A'
        )

        this.CacheItem(
          '磁盘缓存',
          '图片文件缓存在本地，避免重复下载',
          '#007DFF'
        )

        this.CacheItem(
          '自动清理',
          '系统会自动管理缓存大小',
          '#FA8C16'
        )
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  CacheItem(title: string, desc: string, color: string) {
    Row({ space: 12 }) {
      Column({ space: 4 }) {
        Text(title)
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor(color)

        Text(desc)
          .fontSize(12)
          .fontColor('#666')
      }
    }
    .layoutWeight(1)
  }

  @Builder
  ScaleSection() {
    Column({ space: 12 }) {
      Text('示例5：图片缩放模式')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Column({ space: 12 }) {
        Row({ space: 8 }) {
          Column({ space: 6 }) {
            Text('Cover')
              .fontSize(13)
              .fontColor('#666')

            Image('https://img.yzcdn.cn/iconv2/157588/pic.go.png')
              .width(100)
              .height(80)
              .objectFit(ImageFit.Cover)
              .border({ width: 2, color: '#E6E6E6' })
          }

          Column({ space: 6 }) {
            Text('Contain')
              .fontSize(13)
              .fontColor('#666')

            Image('https://img.yzcdn.cn/iconv2/157588/pic.go.png')
              .width(100)
              .height(80)
              .objectFit(ImageFit.Contain)
              .border({ width: 2, color: '#E6E6E6' })
          }

          Column({ space: 6 }) {
            Text('Fill')
              .fontSize(13)
              .fontColor('#666')

            Image('https://img.yzcdn.cn/iconv2/157588/pic.go.png')
              .width(100)
              .height(80)
              .objectFit(ImageFit.Fill)
              .border({ width: 2, color: '#E6E6E6' })
          }
        }

        Row({ space: 8 }) {
          Column({ space: 6 }) {
            Text('None')
              .fontSize(13)
              .fontColor('#666')

            Image('https://img.yzcdn.cn/iconv2/157588/pic.go.png')
              .width(100)
              .height(80)
              .objectFit(ImageFit.None)
              .border({ width: 2, color: '#E6E6E6' })
          }

          Column({ space: 6 }) {
            Text('ScaleDown')
              .fontSize(13)
              .fontColor('#666')

            Image('https://img.yzcdn.cn/iconv2/157588/pic.go.png')
              .width(100)
              .height(80)
              .objectFit(ImageFit.ScaleDown)
              .border({ width: 2, color: '#E6E6E6' })
          }
        }
      }

      Text('objectFit 参数说明')
        .fontSize(12)
        .fontColor('#999')
        .width('100%')
        .textAlign(TextAlign.Center)
        .margin({ top: 8 })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  SVGSection() {
    Column({ space: 12 }) {
      Text('示例6：SVG 图片支持')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Column({ space: 8 }) {
        Text('SVG 矢量图标')
          .fontSize(14)
          .fontColor('#666')

        Row({ space: 12 }) {
          Column({ space: 4 }) {
            Text('SVG 图标')
              .fontSize(12)
              .fontColor('#999')

            Text('推荐使用 SVG，任意缩放不失真')
              .fontSize(11)
              .fontColor('#666')
          }

          Image($r('sys.symbol.ohos_ic_public_phone'))
            .width(60)
            .height(60)
            .fillColor('#007DFF')
        }
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  APISection() {
    Column({ space: 12 }) {
      Text('常用 API 说明')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Column({ space: 8 }) {
        this.APIItem('onStart()', '图片开始加载')
        this.APIItem('onComplete()', '图片加载完成')
        this.APIItem('onError()', '图片加载失败')
        this.APIItem('onSuccess()', '图片加载成功（部分场景）')
        this.APIItem('objectFit', '图片缩放模式：Cover/Contain/Fill/None/ScaleDown')
        this.APIItem('alt', '占位文本或占位图片资源')
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  APIItem(name: string, desc: string) {
    Row({ space: 8 }) {
      Text(name)
        .fontSize(13)
        .fontFamily('monospace')
        .fontColor('#722ED1')
        .width(140)

      Text(desc)
        .fontSize(12)
        .fontColor('#666')
        .layoutWeight(1)
    }
    .width('100%')
  }

  @Builder
  TipCard(tip: string) {
    Text(tip)
      .fontSize(12)
      .fontColor('#FA8C16')
      .width('100%')
      .padding(12)
      .backgroundColor('#FFF7E6')
      .borderRadius(8)
      .margin({ top: 10 })
  }
}
