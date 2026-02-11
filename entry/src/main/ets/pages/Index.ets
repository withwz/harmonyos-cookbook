import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    RelativeContainer() {
      Column({ space: 20 }) {
        Text(this.message)
          .id('HelloWorld')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.message = 'Welcome'
          })

        // 装饰器学习入口
        Column({ space: 12 }) {
          Text('鸿蒙装饰器学习')
            .fontSize(20)
            .fontWeight(FontWeight.Medium)

          Text('点击下方按钮开始学习 ArkTS 装饰器')
            .fontSize(14)
            .fontColor('#666666')

          Button('开始学习 →')
            .fontSize(16)
            .width(200)
            .height(44)
            .backgroundColor('#007DFF')
            .borderRadius(22)
            .onClick(() => {
              router.pushUrl({
                url: 'pages/DecoratorDemo'
              })
            })
        }
        .padding(24)
        .backgroundColor(Color.White)
        .borderRadius(16)
        .shadow({ radius: 8, color: '#1F000000', offsetX: 0, offsetY: 2 })
      }
      .width('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F5F5F5')
  }
}