import router from '@ohos.router'

// 全局用户信息
class UserInfo {
  name: string = ''
  age: number = 0
}

/**
 * AppStorage 全局状态演示
 * 展示跨页面状态共享
 */

@Entry
@Component
struct AppStorageDemo {
  @StorageLink('userName') userName: string = '未设置'
  @StorageProp('userAge') userAge: number = 0
  @State inputName: string = ''

  aboutToAppear() {
    AppStorage.setOrCreate('userName', '鸿蒙开发者')
    AppStorage.setOrCreate('userAge', 25)
  }

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
          // AppStorage 读写
          this.StorageRW()

          // StorageLink/StorageProp
          this.StorageDecorators()

          this.TipCard('AppStorage要点：掌握全局状态的存取和监听')
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

      Text('全局状态')
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
  StorageRW() {
    Column({ space: 12 }) {
      Text('AppStorage 读写操作')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('跨页面共享的全局状态')
        .fontSize(14)
        .fontColor('#666')

      // 当前值显示
      Column({ space: 8 }) {
        Row() {
          Text('用户名:')
            .fontSize(14)
            .fontColor('#666')

          Text(this.userName)
            .fontSize(14)
            .fontColor('#007DFF')
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')

        Row() {
          Text('年龄:')
            .fontSize(14)
            .fontColor('#666')

          Text(`${this.userAge}`)
            .fontSize(14)
            .fontColor('#007DFF')
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 输入区域
      Column({ space: 12 }) {
        TextInput({ placeholder: '输入用户名', text: this.inputName })
          .onChange((value: string) => {
            this.inputName = value
          })

        Button('保存到 AppStorage')
          .fontSize(14)
          .width('100%')
          .height(44)
          .backgroundColor('#007DFF')
          .borderRadius(8)
          .onClick(() => {
            AppStorage.setOrCreate('userName', this.inputName)
            this.userName = this.inputName
          })

        Button('保存年龄')
          .fontSize(14)
          .width('100%')
          .height(44)
          .backgroundColor('#52C41A')
          .borderRadius(8)
          .onClick(() => {
            const newAge = this.userAge + 1
            AppStorage.setOrCreate('userAge', newAge)
            this.userAge = newAge
          })
      }
      .width('100%')

      // 说明
      Column({ space: 8 }) {
        Text('API说明:')
          .fontSize(14)
          .fontColor('#666')

        Text('• AppStorage.setOrCreate(key, value) - 保存')
          .fontSize(12)
          .fontColor('#999')

        Text('• AppStorage.get(key) - 读取')
          .fontSize(12)
          .fontColor('#999')

        Text('• 全局唯一，应用级别共享')
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
  StorageDecorators() {
    Column({ space: 12 }) {
      Text('@StorageLink 和 @StorageProp')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('装饰器方式绑定全局状态')
        .fontSize(14)
        .fontColor('#666')

      // 装饰器说明
      Column({ space: 8 }) {
        Text('本页使用的装饰器:')
          .fontSize(14)
          .fontColor('#666')

        Text('@StorageLink("userName") - 双向绑定')
          .fontSize(12)
          .fontColor('#007DFF')
          .width('100%')

        Text('@StorageProp("userAge") - 只读绑定')
          .fontSize(12)
          .fontColor('#52C41A')
          .width('100%')

        Text('修改会自动同步到 AppStorage')
          .fontSize(12)
          .fontColor('#999')
          .width('100%')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 修改按钮
      Button('修改用户名（双向绑定）')
        .fontSize(14)
        .width('100%')
        .height(44)
        .backgroundColor('#007DFF')
        .borderRadius(8)
        .onClick(() => {
          this.userName = `用户_${Date.now().toString().slice(-4)}`
        })

      // 说明
      Column({ space: 8 }) {
        Text('装饰器对比:')
          .fontSize(14)
          .fontColor('#666')

        Text('• @StorageLink - 双向绑定，可修改')
          .fontSize(12)
          .fontColor('#999')

        Text('• @StorageProp - 单向绑定，只读')
          .fontSize(12)
          .fontColor('#999')

        Text('• 自动响应 AppStorage 变化')
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
