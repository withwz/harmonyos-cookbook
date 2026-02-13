import router from '@ohos.router'

/**
 * 图片与视频组件演示
 * 展示 Image、Video 等组件的用法
 */

@Entry
@Component
struct MediaDemo {
  @State currentFit: ImageFit = ImageFit.Cover

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.Header()

        // Image 图片显示
        this.ImageSection()

        // Image 缩放模式
        this.ImageFitSection()

        this.TipCard('图片与视频组件要点：掌握不同来源的图片加载和视频播放控制')
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  Header() {
    Row() {
      Button() {
        Text('←')
          .fontSize(20)
          .fontColor(Color.White)
      }
      .width(40)
      .height(40)
      .backgroundColor('#007DFF')
      .borderRadius(20)
      .onClick(() => {
        router.back()
      })

      Text('图片与视频组件')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .margin({ right: 40 })
    }
    .width('100%')
  }

  @Builder
  ImageSection() {
    Column({ space: 12 }) {
      Text('Image 图片显示')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 本地图片
      Column({ space: 8 }) {
        Text('网络图片')
          .fontSize(14)
          .fontColor('#666')

        Image('https://via.placeholder.com/300x150/007DFF/FFFFFF?text=Network+Image')
          .width('100%')
          .height(150)
          .borderRadius(8)
          .objectFit(ImageFit.Cover)
      }
      .width('100%')

      // Base64 图片
      Column({ space: 8 }) {
        Text('占位图')
          .fontSize(14)
          .fontColor('#666')

        Text('🖼️')
          .fontSize(80)
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(20)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)
      .margin({ top: 12 })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  ImageFitSection() {
    Column({ space: 12 }) {
      Text('Image objectFit 缩放模式')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 缩放模式选择
      Row({ space: 8 }) {
        Button('Cover')
          .fontSize(12)
          .backgroundColor(this.currentFit === ImageFit.Cover ? '#007DFF' : '#E6E6E6')
          .fontColor(this.currentFit === ImageFit.Cover ? Color.White : '#333333')
          .onClick(() => {
            this.currentFit = ImageFit.Cover
          })

        Button('Contain')
          .fontSize(12)
          .backgroundColor(this.currentFit === ImageFit.Contain ? '#007DFF' : '#E6E6E6')
          .fontColor(this.currentFit === ImageFit.Contain ? Color.White : '#333333')
          .onClick(() => {
            this.currentFit = ImageFit.Contain
          })

        Button('Fill')
          .fontSize(12)
          .backgroundColor(this.currentFit === ImageFit.Fill ? '#007DFF' : '#E6E6E6')
          .fontColor(this.currentFit === ImageFit.Fill ? Color.White : '#333333')
          .onClick(() => {
            this.currentFit = ImageFit.Fill
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)

      // 示例图片
      Column({ space: 8 }) {
        Text('当前模式: ' + this.getImageFitName())
          .fontSize(14)
          .fontColor('#666')

        Text('🖼️')
          .fontSize(60)
          .width(200)
          .height(120)
          .textAlign(TextAlign.Center)
          .backgroundColor('#E6F7FF')
          .borderRadius(8)
      }
      .width('100%')
      .padding(20)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)
      .margin({ top: 12 })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  private getImageFitName(): string {
    if (this.currentFit === ImageFit.Cover) {
      return 'Cover 覆盖'
    } else if (this.currentFit === ImageFit.Contain) {
      return 'Contain 包含'
    } else {
      return 'Fill 填充'
    }
  }

  @Builder
  TipCard(tip: string) {
    Text(tip)
      .fontSize(12)
      .fontColor('#FF6B6B')
      .width('100%')
      .padding(12)
      .backgroundColor('#FFF5F5')
      .borderRadius(8)
      .margin({ top: 10 })
  }
}
