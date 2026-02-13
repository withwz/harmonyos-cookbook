import router from '@ohos.router'

/**
 * Scroll 滚动容器组件演示
 * 展示滚动容器的基础用法和事件监听
 */

@Entry
@Component
struct ScrollDemo {
  @State scrollOffset: number = 0
  @State listItems: Array<string> = []

  aboutToAppear() {
    for (let i = 1; i <= 30; i++) {
      this.listItems.push(`列表项 ${i}`)
    }
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.Header()

        // Scroll 基础演示
        this.BasicScroll()

        // 滚动位置控制
        this.ScrollControl()

        // 滚动事件
        this.ScrollEvent()

        this.TipCard('滚动组件要点：掌握滚动事件监听和位置控制')
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

      Text('滚动容器')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .margin({ right: 40 })
    }
    .width('100%')
  }

  @Builder
  BasicScroll() {
    Column({ space: 12 }) {
      Text('Scroll 基础滚动')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('内容超出容器时自动滚动')
        .fontSize(14)
        .fontColor('#666')

      // 基础 Scroll
      Scroll() {
        Column({ space: 8 }) {
          ForEach([1, 2, 3, 4, 5, 6, 7, 8], (item: number) => {
            Column() {
              Text(`内容项 ${item}`)
                .fontSize(16)
                .fontColor(Color.White)
            }
            .width('100%')
            .height(60)
            .backgroundColor(item % 2 === 0 ? '#007DFF' : '#52C41A')
            .borderRadius(8)
            .justifyContent(FlexAlign.Center)
          }, (item: number) => item.toString())
        }
        .width('100%')
        .padding(8)
      }
      .width('100%')
      .height(250)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)
      .backgroundColor('#F8F8F8')
      .borderRadius(12)

      // 说明
      Column({ space: 8 }) {
        Text('配置说明:')
          .fontSize(14)
          .fontColor('#666')

        Text('• scrollable: Vertical - 纵向滚动')
          .fontSize(12)
          .fontColor('#999')

        Text('• scrollBar: Auto - 自动显示滚动条')
          .fontSize(12)
          .fontColor('#999')

        Text('• Horizontal - 横向滚动')
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
  ScrollControl() {
    Column({ space: 12 }) {
      Text('滚动位置控制')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('通过按钮控制滚动位置')
        .fontSize(14)
        .fontColor('#666')

      // 当前滚动位置
      Text(`滚动位置: ${Math.round(this.scrollOffset)}px`)
        .fontSize(14)
        .fontColor('#007DFF')
        .width('100%')

      // 控制按钮
      Row({ space: 12 }) {
        Button('顶部')
          .fontSize(14)
          .width('31%')
          .height(40)
          .backgroundColor('#007DFF')
          .borderRadius(8)
          .onClick(() => {
            this.scrollOffset = 0
          })

        Button('中部')
          .fontSize(14)
          .width('31%')
          .height(40)
          .backgroundColor('#52C41A')
          .borderRadius(8)
          .onClick(() => {
            this.scrollOffset = 250
          })

        Button('底部')
          .fontSize(14)
          .width('31%')
          .height(40)
          .backgroundColor('#FAAD14')
          .borderRadius(8)
          .onClick(() => {
            this.scrollOffset = 500
          })
      }
      .width('100%')

      // 说明
      Column({ space: 8 }) {
        Text('位置控制:')
          .fontSize(14)
          .fontColor('#666')

        Text('• 使用 @State 绑定 scrollOffset')
          .fontSize(12)
          .fontColor('#999')

        Text('• 修改 offset 属性控制位置')
          .fontSize(12)
          .fontColor('#999')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#FFF3E0')
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
  ScrollEvent() {
    Column({ space: 12 }) {
      Text('滚动事件监听')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('监听滚动位置变化')
        .fontSize(14)
        .fontColor('#666')

      // 带事件监听的 Scroll
      Scroll() {
        Column({ space: 8 }) {
          ForEach(this.listItems.slice(0, 10), (item: string, index: number) => {
            Row() {
              Text(`${index + 1}. ${item}`)
                .fontSize(14)
                .fontColor('#333')
            }
            .width('100%')
            .height(50)
            .padding({ left: 16 })
            .backgroundColor(Color.White)
            .borderRadius(8)
          }, (item: string, index: number) => index.toString())
        }
        .width('100%')
        .padding(8)
      }
      .width('100%')
      .height(200)
      .onScroll((xOffset: number, yOffset: number) => {
        this.scrollOffset = yOffset
      })
      .onScrollEdge((side: Edge) => {
        if (side === Edge.Top) {
          console.log('滚动到顶部')
        } else if (side === Edge.Bottom) {
          console.log('滚动到底部')
        }
      })
      .backgroundColor('#F8F8F8')
      .borderRadius(12)

      // 说明
      Column({ space: 8 }) {
        Text('事件说明:')
          .fontSize(14)
          .fontColor('#666')

        Text('• onScroll - 滚动时触发')
          .fontSize(12)
          .fontColor('#999')

        Text('• onScrollEdge - 滚动到边缘触发')
          .fontSize(12)
          .fontColor('#999')

        Text('• Edge.Top/Bottom - 顶部/底部')
          .fontSize(12)
          .fontColor('#999')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#FCE4EC')
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
