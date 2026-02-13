import router from '@ohos.router'

/**
 * Divider 分割线组件演示
 * 展示不同样式的分割线效果
 */

@Entry
@Component
struct DividerDemo {
  build() {
    Column() {
      // Header 固定在顶部，包含左右边距
      Row() {
        this.Header()
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20 })

      // 内容区域可滚动
      Scroll() {
        Column({ space: 20 }) {
          // Divider 基础演示
          this.DividerSection()

          this.TipCard('Divider要点：用于分隔内容区域的分割线组件')
        }
        .width('100%')
        .padding({ left: 16, right: 16, bottom: 20 })
      }
      .layoutWeight(1)
      .width('100%')
      .scrollBar(BarState.Auto)
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

      Text('分割线')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .margin({ right: 40 })
    }
    .width('100%')
    .padding({ left: 0, right: 0, top: 0, bottom: 12 })
    .backgroundColor('#F5F5F5')
  }

  @Builder
  DividerSection() {
    Column({ space: 12 }) {
      Text('Divider 分割线')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('用于分隔不同内容区域')
        .fontSize(14)
        .fontColor('#666')

      // 默认分割线
      Column({ space: 8 }) {
        Text('默认分割线')
          .fontSize(14)
          .fontColor('#666')

        Text('上方内容')
          .fontSize(14)

        Divider()

        Text('下方内容')
          .fontSize(14)
      }
      .width('100%')
      .padding(16)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 不同颜色
      Column({ space: 8 }) {
        Text('不同颜色')
          .fontSize(14)
          .fontColor('#666')

        Divider().strokeWidth(2).color('#FF4D4F')
        Divider().strokeWidth(2).color('#52C41A')
        Divider().strokeWidth(2).color('#007DFF')
        Divider().strokeWidth(2).color('#FAAD14')
      }
      .width('100%')
      .padding(16)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 不同粗细
      Column({ space: 8 }) {
        Text('不同粗细')
          .fontSize(14)
          .fontColor('#666')

        Divider().strokeWidth(1)
        Divider().strokeWidth(3)
        Divider().strokeWidth(5)
        Divider().strokeWidth(8)
      }
      .width('100%')
      .padding(16)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 垂直分割线
      Row({ space: 12 }) {
        Text('左边')
          .fontSize(14)
          .layoutWeight(1)

        Divider().vertical(true).height(40)

        Text('右边')
          .fontSize(14)
          .layoutWeight(1)
      }
      .width('100%')
      .padding(16)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 说明
      Column({ space: 8 }) {
        Text('属性说明:')
          .fontSize(14)
          .fontColor('#666')

        Text('• strokeWidth - 线条粗细')
          .fontSize(12)
          .fontColor('#999')

        Text('• color - 线条颜色')
          .fontSize(12)
          .fontColor('#999')

        Text('• vertical - 是否垂直')
          .fontSize(12)
          .fontColor('#999')

        Text('• 常用于列表分隔、布局分组')
          .fontSize(12)
          .fontColor('#999')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#E6F7FF')
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
