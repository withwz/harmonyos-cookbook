import router from '@ohos.router'

/**
 * 画布绘制演示
 * 展示 Canvas 和 CanvasRenderingContext2D 的用法
 */

@Entry
@Component
struct CanvasDemo {
  private canvasWidth: number = 300
  private canvasHeight: number = 200

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
          // Canvas 基础绘制
          this.CanvasSection()

          this.TipCard('画布组件要点：掌握 Canvas 2D 绘图上下文的使用')
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

      Text('画布绘制')
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
  CanvasSection() {
    Column({ space: 12 }) {
      Text('Canvas 画布')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('Canvas 绘制功能需要使用 CanvasRenderingContext2D')
        .fontSize(14)
        .fontColor('#666')

      // Canvas 占位说明
      Column() {
        Text('Canvas 画布区域')
          .fontSize(20)
          .fontColor(Color.White)
      }
      .width('100%')
      .height(this.canvasHeight)
      .backgroundColor('#007DFF')
      .borderRadius(12)
      .justifyContent(FlexAlign.Center)

      // 说明文字
      Column({ space: 8 }) {
        Text('Canvas 功能说明:')
          .fontSize(14)
          .fontColor('#666')
          .width('100%')

        Text('• fillRect - 填充矩形')
          .fontSize(12)
          .fontColor('#999')
          .width('100%')

        Text('• arc - 绘制圆形/弧线')
          .fontSize(12)
          .fontColor('#999')
          .width('100%')

        Text('• stroke - 绘制线条')
          .fontSize(12)
          .fontColor('#999')
          .width('100%')

        Text('• fillText - 绘制文本')
          .fontSize(12)
          .fontColor('#999')
          .width('100%')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)
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
