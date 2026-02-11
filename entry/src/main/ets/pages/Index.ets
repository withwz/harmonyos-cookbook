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

        // 学习入口
        Column({ space: 12 }) {
          Row({ space: 12 }) {
            // 装饰器学习入口
            Column({ space: 12 }) {
              Text('🎨')
                .fontSize(32)
              Text('装饰器学习')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('State/Prop/Link等')
                .fontSize(12)
                .fontColor('#999')

              Button('开始学习')
                .fontSize(12)
                .width('100%')
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/DecoratorDemo'
                  })
                })
            }
            .layoutWeight(1)
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)

            // 布局学习入口
            Column({ space: 12 }) {
              Text('📐')
                .fontSize(32)
              Text('布局学习')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('Column/Row/Grid等')
                .fontSize(12)
                .fontColor('#999')

              Button('开始学习')
                .fontSize(12)
                .width('100%')
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/LayoutDemo'
                  })
                })
            }
            .layoutWeight(1)
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)
          }

          // 路由学习入口
          Row({ space: 12 }) {
            Column({ space: 12 }) {
              Text('🔗')
                .fontSize(32)
              Text('路由学习')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('页面跳转/生命周期')
                .fontSize(12)
                .fontColor('#999')

              Button('开始学习')
                .fontSize(12)
                .width('100%')
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/RouterDemo'
                  })
                })
            }
            .layoutWeight(1)
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)
          }
          .width('100%')
        }
        .width('100%')
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