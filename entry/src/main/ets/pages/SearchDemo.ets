import router from '@ohos.router'

/**
 * Search 搜索框组件演示
 */

@Entry
@Component
struct SearchDemo {
  @State searchValue: string = ''

  build() {
    Column() {
      Row() {
        this.Header()
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20 })

      Scroll() {
        Column({ space: 20 }) {
          this.SearchSection()
          this.TipCard('Search要点：用于搜索内容输入')
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

      Text('搜索框')
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
  SearchSection() {
    Column({ space: 12 }) {
      Text('Search 搜索框')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('用于内容搜索的输入框')
        .fontSize(14)
        .fontColor('#666')

      // Search 示例
      Column({ space: 16 }) {
        Search({ value: this.searchValue, placeholder: '请输入搜索内容' })
          .searchButton('搜索')
          .width('100%')
          .backgroundColor('#F5F5F5')
          .onChange((value: string) => {
            this.searchValue = value
          })
          .onSubmit((value: string) => {
            console.info('搜索: ' + value)
          })

        // 当前搜索值
        if (this.searchValue) {
          Text('当前搜索值: ' + this.searchValue)
            .fontSize(14)
            .fontColor('#007DFF')
            .width('100%')
        }
      }
      .width('100%')

      // 说明
      Column({ space: 8 }) {
        Text('属性说明:')
          .fontSize(14)
          .fontColor('#666')

        Text('• placeholder - 提示文字')
          .fontSize(12)
          .fontColor('#999')

        Text('• searchButton - 搜索按钮文字')
          .fontSize(12)
          .fontColor('#999')

        Text('• onChange - 输入变化回调')
          .fontSize(12)
          .fontColor('#999')

        Text('• 常用于搜索功能')
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
