import router from '@ohos.router'

/**
 * 菜单组件演示
 * 展示 Menu、ContextMenu 等菜单的用法
 */

@Entry
@Component
struct MenuDemo {
  @State selectedItem: string = ''

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
          // 简单菜单示例
          this.SimpleMenuSection()

          this.TipCard('菜单组件要点：掌握 Menu 和 ContextMenu 的使用方式')
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

      Text('菜单组件')
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
  SimpleMenuSection() {
    Column({ space: 12 }) {
      Text('简单菜单示例')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('点击下方按钮选择操作')
        .fontSize(14)
        .fontColor('#666')

      // 菜单选项按钮
      Row({ space: 12 }) {
        Button('新建')
          .fontSize(14)
          .width('100%')
          .height(48)
          .backgroundColor('#52C41A')
          .borderRadius(8)
          .layoutWeight(1)
          .onClick(() => {
            this.selectedItem = '新建'
          })

        Button('编辑')
          .fontSize(14)
          .width('100%')
          .height(48)
          .backgroundColor('#007DFF')
          .borderRadius(8)
          .layoutWeight(1)
          .onClick(() => {
            this.selectedItem = '编辑'
          })

        Button('删除')
          .fontSize(14)
          .width('100%')
          .height(48)
          .backgroundColor('#FF4D4F')
          .borderRadius(8)
          .layoutWeight(1)
          .onClick(() => {
            this.selectedItem = '删除'
          })
      }
      .width('100%')

      // 显示选中结果
      if (this.selectedItem) {
        Text(`已选择: ${this.selectedItem}`)
          .fontSize(14)
          .fontColor('#007DFF')
          .width('100%')
          .textAlign(TextAlign.Center)
          .padding(12)
          .backgroundColor('#E6F7FF')
          .borderRadius(8)
          .margin({ top: 12 })
          .onClick(() => {
            this.selectedItem = ''
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
