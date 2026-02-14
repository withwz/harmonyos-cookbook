import router from '@ohos.router'

/**
 * LocalStorage 页面级状态演示
 */

// 创建 LocalStorage 实例
const storage = new LocalStorage()

@Entry(storage)
@Component
struct LocalStorageDemo {
  @StorageLink('localCount') localCount: number = 0
  @State inputCount: number = 0

  build() {
    Column() {
      Row() {
        this.Header()
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20 })

      Scroll() {
        Column({ space: 20 }) {
          this.StorageSection()
          this.TipCard('LocalStorage要点：页面级状态共享')
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

      Text('页面状态')
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
  StorageSection() {
    Column({ space: 12 }) {
      Text('LocalStorage 页面级状态')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('同一页面内组件共享状态')
        .fontSize(14)
        .fontColor('#666')

      // 当前值
      Column({ space: 8 }) {
        Row() {
          Text('存储的计数:')
            .fontSize(14)
            .fontColor('#666')

          Text(`${this.localCount}`)
            .fontSize(18)
            .fontColor('#52C41A')
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
        .padding(12)
        .backgroundColor('#F8F8F8')
        .borderRadius(8)
      }
      .width('100%')

      // 操作区域
      Column({ space: 12 }) {
        TextInput({ placeholder: '输入新值', text: this.inputCount.toString() })
          .type(InputType.Number)
          .onChange((value: string) => {
            this.inputCount = parseInt(value) || 0
          })

        Row({ space: 12 }) {
          Button('保存到 LocalStorage')
            .fontSize(14)
            .width('48%')
            .height(44)
            .backgroundColor('#007DFF')
            .borderRadius(8)
            .onClick(() => {
              this.localCount = this.inputCount
            })

          Button('+1')
            .fontSize(14)
            .width('48%')
            .height(44)
            .backgroundColor('#52C41A')
            .borderRadius(8)
            .onClick(() => {
              this.localCount++
            })
        }
        .width('100%')
      }
      .width('100%')

      // 说明
      Column({ space: 8 }) {
        Text('属性说明:')
          .fontSize(14)
          .fontColor('#666')

        Text('• @Entry(storage) - 绑定 LocalStorage')
          .fontSize(12)
          .fontColor('#999')

        Text('• @StorageLink - 双向绑定状态')
          .fontSize(12)
          .fontColor('#999')

        Text('• 页面内组件共享，页面外隔离')
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
