import router from '@ohos.router'

/**
 * ActionSheet 操作列表演示
 */

@Entry
@Component
struct ActionSheetDemo {
  @State showSheet: boolean = false

  build() {
    Column() {
      Row() {
        this.Header()
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20 })

      Scroll() {
        Column({ space: 20 }) {
          this.ActionSheetSection()
          this.TipCard('ActionSheet要点：底部弹出的操作列表')
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

      Text('操作列表')
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
  ActionSheetSection() {
    Column({ space: 12 }) {
      Text('ActionSheet 操作列表')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('底部弹出的选项列表')
        .fontSize(14)
        .fontColor('#666')

      // 触发按钮
      Button('显示操作列表')
        .fontSize(16)
        .width('100%')
        .height(50)
        .backgroundColor('#007DFF')
        .borderRadius(8)
        .onClick(() => {
          this.showSheet = true
        })

      // 说明
      Column({ space: 8 }) {
        Text('常见用途:')
          .fontSize(14)
          .fontColor('#666')

        Text('• 分享到微信/朋友圈')
          .fontSize(12)
          .fontColor('#999')

        Text('• 退出登录确认')
          .fontSize(12)
          .fontColor('#999')

        Text('• 删除确认操作')
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
