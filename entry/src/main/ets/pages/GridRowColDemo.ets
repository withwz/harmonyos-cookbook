import router from '@ohos.router'

/**
 * 栅格布局演示
 * 展示 GridRow 和 GridCol 的用法
 */

@Entry
@Component
struct GridRowColDemo {
  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.Header()

        // GridRow 栅格布局
        this.GridRowSection()

        this.TipCard('栅格布局要点：掌握响应式栅格布局，实现不同屏幕适配')
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

      Text('栅格布局')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .margin({ right: 40 })
    }
    .width('100%')
  }

  @Builder
  GridRowSection() {
    Column({ space: 12 }) {
      Text('GridRow 栅格布局')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('响应式栅格布局 - 12列布局示例')
        .fontSize(14)
        .fontColor('#666')

      // GridRow 示例
      GridRow({
        columns: 12,
        gutter: 10
      }) {
        GridCol() {
          Column() {
            Text('1')
              .fontSize(16)
              .fontColor(Color.White)
          }
          .width('100%')
          .height(60)
          .backgroundColor('#007DFF')
          .borderRadius(8)
          .justifyContent(FlexAlign.Center)
        }
        .span(2)

        GridCol() {
          Column() {
            Text('2')
              .fontSize(16)
              .fontColor(Color.White)
          }
          .width('100%')
          .height(60)
          .backgroundColor('#52C41A')
          .borderRadius(8)
          .justifyContent(FlexAlign.Center)
        }
        .span(4)

        GridCol() {
          Column() {
            Text('3')
              .fontSize(16)
              .fontColor(Color.White)
          }
          .width('100%')
          .height(60)
          .backgroundColor('#FAAD14')
          .borderRadius(8)
          .justifyContent(FlexAlign.Center)
        }
        .span(3)

        GridCol() {
          Column() {
            Text('4')
              .fontSize(16)
              .fontColor(Color.White)
          }
          .width('100%')
          .height(60)
          .backgroundColor('#FF6B6B')
          .borderRadius(8)
          .justifyContent(FlexAlign.Center)
        }
        .span(3)
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 说明文字
      Column({ space: 8 }) {
        Text('栅格说明:')
          .fontSize(14)
          .fontColor('#666')

        Text('• columns: 12 - 将容器分为12列')
          .fontSize(12)
          .fontColor('#999')

        Text('• gutter: 10 - 列间距10vp')
          .fontSize(12)
          .fontColor('#999')

        Text('• span: 列跨度的占位数')
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
