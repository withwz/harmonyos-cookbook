import router from '@ohos.router'

/**
 * Panel 半模态面板演示
 * 展示底部弹出面板的用法
 */

@Entry
@Component
struct PanelDemo {
  @State panelVisible: boolean = false

  build() {
    Column() {
      Stack({ alignContent: Alignment.Bottom }) {
        // 主内容区
        Column({ space: 20 }) {
          this.Header()

          // Panel 演示区
          Column({ space: 12 }) {
            Text('半模态面板')
              .fontSize(18)
              .fontWeight(FontWeight.Medium)
              .width('100%')

            Text('点击按钮打开底部弹出面板')
              .fontSize(14)
              .fontColor('#666')

            // 打开按钮
            Button('打开面板')
              .fontSize(16)
              .width('100%')
              .height(50)
              .backgroundColor('#007DFF')
              .borderRadius(8)
              .onClick(() => {
                this.panelVisible = true
              })
          }
          .width('100%')

          // 说明
          Column({ space: 8 }) {
            Text('半模态面板特点:')
              .fontSize(14)
              .fontColor('#666')

            Text('• 从底部弹出，占据部分屏幕')
              .fontSize(12)
              .fontColor('#999')

            Text('• 半透明遮罩，保留背景可见')
              .fontSize(12)
              .fontColor('#999')

            Text('• 适用于分享、菜单、设置等场景')
              .fontSize(12)
              .fontColor('#999')
          }
          .width('100%')
          .padding(12)
          .backgroundColor('#E6F7FF')
          .borderRadius(8)
        }
        .width('100%')
        .padding(16)
        .backgroundColor('#F5F5F5')
      }
      .width('100%')
      .layoutWeight(1)
      .height('100%')

      // 半模态面板
      Column() {
        // 遮罩层
        Column()
          .width('100%')
          .height('100%')
          .backgroundColor('rgba(0, 0, 0, 0.5)')
          .onClick(() => {
            this.panelVisible = false
          })

        // 面板内容
        Column() {
          Text('面板标题')
            .fontSize(18)
            .fontColor('#333')
            .fontWeight(FontWeight.Bold)
            .margin({ top: 16, bottom: 12 })

          Divider()
            .color('#F0F0F0')

          Column({ space: 16 }) {
            this.PanelItem('分享到朋友圈', '📱')
            this.PanelItem('分享给好友', '👥')
            this.PanelItem('保存到相册', '🖼️')
            this.PanelItem('复制链接', '📋')
          }
          .width('100%')
          .padding(20)

          // 关闭按钮
          Button('关闭')
            .fontSize(16)
            .width('90%')
            .height(44)
            .backgroundColor('#FF6B6B')
            .borderRadius(8)
            .margin({ top: 20, bottom: 20 })
            .onClick(() => {
              this.panelVisible = false
            })
        }
        .width('100%')
        .height('60%')
        .backgroundColor(Color.White)
        .borderRadius({ topLeft: 16, topRight: 16 })
      }
      .width('100%')
      .height('100%')
      .position({ x: 0, y: '80%' })
      .alignItems(HorizontalAlign.Center)
      .opacity(this.panelVisible ? 1 : 0)
    }
    .width('100%')
    .height('100%')
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

      Text('半模态面板')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .margin({ right: 40 })
    }
    .width('100%')
  }

  @Builder
  PanelItem(title: string, icon: string) {
    Row({ space: 12 }) {
      Text(icon)
        .fontSize(24)

      Text(title)
        .fontSize(16)
        .fontColor('#333')
        .layoutWeight(1)

      Text('→')
        .fontSize(16)
        .fontColor('#999')
    }
    .width('100%')
    .height(50)
    .padding({ left: 16, right: 16 })
    .backgroundColor('#F8F8F8')
    .borderRadius(8)
  }
}
