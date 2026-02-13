import router from '@ohos.router'

/**
 * PersistentStorage 持久化存储演示
 * 展示数据持久化到本地存储
 */

@Entry
@Component
struct PersistentStorageDemo {
  @State userName: string = '未设置'
  @State counter: number = 0
  @State inputName: string = ''

  aboutToAppear() {
    // 从持久化存储初始化
    const savedName: string | null = AppStorage.get('persistUserName') as string | null
    if (savedName) {
      this.userName = savedName
    }
    const savedCounter: string | null = AppStorage.get('persistCounter') as string | null
    if (savedCounter) {
      this.counter = Number(savedCounter)
    }
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.Header()

        // PersistentStorage 读写
        this.StorageRW()

        this.TipCard('PersistentStorage要点：数据持久化存储，应用重启后保留')
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

      Text('持久化存储')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .margin({ right: 40 })
    }
    .width('100%')
  }

  @Builder
  StorageRW() {
    Column({ space: 12 }) {
      Text('PersistentStorage 读写')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('应用重启后数据仍然保留')
        .fontSize(14)
        .fontColor('#666')

      // 当前值
      Column({ space: 8 }) {
        Row() {
          Text('存储的用户名:')
            .fontSize(14)
            .fontColor('#666')

          Text(this.userName)
            .fontSize(14)
            .fontColor('#007DFF')
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')

        Row() {
          Text('计数器:')
            .fontSize(14)
            .fontColor('#666')

          Text(`${this.counter}`)
            .fontSize(14)
            .fontColor('#52C41A')
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 操作区域
      Column({ space: 12 }) {
        TextInput({ placeholder: '输入用户名', text: this.inputName })
          .onChange((value: string) => {
            this.inputName = value
          })

        Button('保存用户名')
          .fontSize(14)
          .width('100%')
          .height(44)
          .backgroundColor('#007DFF')
          .borderRadius(8)
          .onClick(() => {
            AppStorage.setOrCreate('persistUserName', this.inputName)
            this.userName = this.inputName
          })

        Row({ space: 12 }) {
          Button('-')
            .fontSize(16)
            .width('48%')
            .height(44)
            .backgroundColor('#FF6B6B')
            .borderRadius(8)
            .onClick(() => {
              const newVal = this.counter - 1
              AppStorage.setOrCreate('persistCounter', newVal.toString())
              this.counter = newVal
            })

          Button('+')
            .fontSize(16)
            .width('48%')
            .height(44)
            .backgroundColor('#52C41A')
            .borderRadius(8)
            .onClick(() => {
              const newVal = this.counter + 1
              AppStorage.setOrCreate('persistCounter', newVal.toString())
              this.counter = newVal
            })
        }
        .width('100%')

        Button('清除所有数据')
          .fontSize(14)
          .width('100%')
          .height(44)
          .backgroundColor('#999')
          .borderRadius(8)
          .onClick(() => {
            this.userName = '未设置'
            this.counter = 0
          })
      }
      .width('100%')

      // 说明
      Column({ space: 8 }) {
        Text('持久化说明:')
          .fontSize(14)
          .fontColor('#666')

        Text('• AppStorage 可配合 PersistentStorage 使用')
          .fontSize(12)
          .fontColor('#999')

        Text('• 需在 entryability 前初始化持久化字段')
          .fontSize(12)
          .fontColor('#999')

        Text('• 数据写入本地磁盘，应用重启保留')
          .fontSize(12)
          .fontColor('#999')

        Text('• 用于用户设置、本地缓存等场景')
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
