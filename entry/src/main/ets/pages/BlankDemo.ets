import router from '@ohos.router'

/**
 * Blank 空白填充组件演示
 */

@Entry
@Component
struct BlankDemo {
  build() {
    Column() {
      Row() {
        this.Header()
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20 })

      Scroll() {
        Column({ space: 20 }) {
          this.BlankSection()
          this.TipCard('Blank要点：自动填充布局中的剩余空间')
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

      Text('空白填充')
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
  BlankSection() {
    Column({ space: 12 }) {
      Text('Blank 空白填充')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // Row 中使用
      Column({ space: 8 }) {
        Text('Row 中自动填充剩余空间:')
          .fontSize(14)
          .fontColor('#666')

        Row() {
          Text('左边')
          Blank()
          Text('右边')
        }
        .width('100%')
        .height(50)
        .backgroundColor('#F8F8F8')
        .borderRadius(8)
      }
      .width('100%')

      // Column 中使用
      Column({ space: 8 }) {
        Text('Column 中自动填充剩余空间:')
          .fontSize(14)
          .fontColor('#666')

        Column() {
          Text('顶部')
          Blank()
          Text('底部')
        }
        .width('100%')
        .height(100)
        .backgroundColor('#E6F7FF')
        .borderRadius(8)
      }
      .width('100%')

      // 说明
      Column({ space: 8 }) {
        Text('属性说明:')
          .fontSize(14)
          .fontColor('#666')

        Text('• Blank - 自动填充剩余空间')
          .fontSize(12)
          .fontColor('#999')

        Text('• 常用于布局间距、对齐')
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
