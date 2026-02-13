import router from '@ohos.router'

/**
 * 弹窗组件演示
 * 展示 AlertDialog、ActionSheet、BindSheet、Popup 等弹窗的用法
 */

@Entry
@Component
struct DialogDemo {
  @State alertVisible: boolean = false
  @State actionSheetVisible: boolean = false
  @State popupVisible: boolean = false

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
          // AlertDialog 对话框
          this.AlertDialogSection()

          // ActionSheet 操作列表
          this.ActionSheetSection()

          // Popup 气泡弹窗
          this.PopupSection()

          this.TipCard('弹窗组件要点：掌握各种弹窗的显示和交互方式')
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

      Text('弹窗组件')
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
  AlertDialogSection() {
    Column({ space: 12 }) {
      Text('AlertDialog 对话框')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Button('显示 AlertDialog')
        .fontSize(16)
        .width('100%')
        .height(48)
        .backgroundColor('#007DFF')
        .borderRadius(8)
        .onClick(() => {
          this.showAlertDialog()
        })

      // 状态提示
      if (this.alertVisible) {
        Text('AlertDialog 已显示（已关闭）')
          .fontSize(14)
          .fontColor('#52C41A')
          .width('100%')
          .padding(12)
          .backgroundColor('#F6FFED')
          .borderRadius(8)
          .onClick(() => {
            this.alertVisible = false
          })
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  showAlertDialog() {
    AlertDialog.show({
      title: '提示',
      message: '这是一个 AlertDialog 对话框示例',
      autoCancel: true,
      alignment: DialogAlignment.Center,
      primaryButton: {
        value: '确定',
        action: () => {
          this.alertVisible = true
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
  }

  @Builder
  ActionSheetSection() {
    Column({ space: 12 }) {
      Text('ActionSheet 操作列表')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Button('显示 ActionSheet')
        .fontSize(16)
        .width('100%')
        .height(48)
        .backgroundColor('#52C41A')
        .borderRadius(8)
        .onClick(() => {
          this.showActionSheet()
        })

      if (this.actionSheetVisible) {
        Text('ActionSheet 已关闭')
          .fontSize(14)
          .fontColor('#52C41A')
          .width('100%')
          .padding(12)
          .backgroundColor('#F6FFED')
          .borderRadius(8)
          .onClick(() => {
            this.actionSheetVisible = false
          })
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  showActionSheet() {
    ActionSheet.show({
      title: '选择操作',
      message: '请选择一个操作',
      autoCancel: true,
      alignment: DialogAlignment.Bottom,
      sheets: [
        {
          title: '拍照',
          action: () => {
            this.actionSheetVisible = true
            console.info('选择拍照')
          }
        },
        {
          title: '从相册选择',
          action: () => {
            this.actionSheetVisible = true
            console.info('选择相册')
          }
        },
        {
          title: '取消',
          action: () => {
            console.info('取消操作')
          }
        }
      ]
    })
  }

  @Builder
  PopupSection() {
    Column({ space: 12 }) {
      Text('Popup 气泡弹窗')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // Popup 触发按钮
      Stack() {
        Button('点击显示 Popup')
          .fontSize(16)
          .width('100%')
          .height(48)
          .backgroundColor('#FAAD14')
          .borderRadius(8)

        if (this.popupVisible) {
          Column() {
            Text('这是 Popup 内容')
              .fontSize(14)
              .fontColor(Color.White)
          }
          .width(120)
          .height(50)
          .backgroundColor('#333333')
          .borderRadius(8)
          .justifyContent(FlexAlign.Center)
          .position({ x: '50%', y: 60 })
          .markAnchor({ x: '50%', y: 0 })
          .offset({ x: '-50%', y: 0 })
        }
      }
      .width('100%')
      .height(80)
      .alignContent(Alignment.Top)

      // 关闭 Popup 按钮
      if (this.popupVisible) {
        Button('关闭 Popup')
          .fontSize(14)
          .onClick(() => {
            this.popupVisible = false
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
