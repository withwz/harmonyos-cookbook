import router from '@ohos.router'

/**
 * 信息展示组件演示
 * 展示 Progress、AlertDialog、ActionSheet、Popup 等组件的用法
 */

@Entry
@Component
struct InfoDisplayDemo {
  @State progressValue: number = 50
  @State showDialog: boolean = false

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.Header()

        // Progress 进度条
        this.ProgressSection()

        // AlertDialog 对话框
        this.AlertDialogSection()

        this.TipCard('信息展示组件要点：掌握进度条、对话框、弹窗等组件的使用')
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

      Text('信息展示组件')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .margin({ right: 40 })
    }
    .width('100%')
  }

  @Builder
  ProgressSection() {
    Column({ space: 12 }) {
      Text('Progress 进度条')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 进度条
      Row({ space: 12 }) {
        Button('-')
          .fontSize(16)
          .width(40)
          .height(40)
          .onClick(() => {
            if (this.progressValue > 0) {
              this.progressValue -= 10
            }
          })

        Progress({ value: this.progressValue, total: 100 })
          .width(200)
          .color('#007DFF')
          .backgroundColor('#E6E6E6')

        Button('+')
          .fontSize(16)
          .width(40)
          .height(40)
          .onClick(() => {
            if (this.progressValue < 100) {
              this.progressValue += 10
            }
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)

      // 显示进度值
      Text(`当前进度: ${this.progressValue}%`)
        .fontSize(14)
        .fontColor('#007DFF')
        .width('100%')
        .textAlign(TextAlign.Center)
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
  AlertDialogSection() {
    Column({ space: 12 }) {
      Text('AlertDialog 对话框')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 触发对话框的按钮
      Button('显示提示')
        .fontSize(16)
        .width('100%')
        .height(48)
        .backgroundColor('#007DFF')
        .borderRadius(8)
        .onClick(() => {
          AlertDialog.show({
            title: '提示',
            message: '这是一个 AlertDialog 对话框示例',
            autoCancel: true,
            alignment: DialogAlignment.Center,
            primaryButton: {
              value: '确定',
              action: () => {
                console.info('点击确定')
              }
            },
            secondaryButton: {
              value: '取消',
              action: () => {
                console.info('点击取消')
              }
            }
          })
        })

      // 显示状态提示
      if (this.showDialog) {
        Text('对话框已触发，请查看控制台')
          .fontSize(14)
          .fontColor('#007DFF')
          .width('100%')
          .padding(12)
          .backgroundColor('#E6F7FF')
          .borderRadius(8)
          .margin({ top: 12 })
          .onClick(() => {
            this.showDialog = false
          })
      }
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
