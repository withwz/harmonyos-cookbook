import router from '@ohos.router'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Scroll() {
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

          Row({ space: 12 }) {
            // 路由学习入口
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

            // 语法学习入口
            Column({ space: 12 }) {
              Text('📝')
                .fontSize(32)
              Text('语法学习')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('ArkTS vs TS')
                .fontSize(12)
                .fontColor('#999')

              Button('开始学习')
                .fontSize(12)
                .width('100%')
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/ArkTSSyntaxDemo'
                  })
                })
            }
            .layoutWeight(1)
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)
          }

          Row({ space: 12 }) {
            // 按钮与选择组件入口
            Column({ space: 12 }) {
              Text('🔘')
                .fontSize(32)
              Text('按钮与选择')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('Button/Toggle/Checkbox等')
                .fontSize(12)
                .fontColor('#999')

              Button('开始学习')
                .fontSize(12)
                .width('100%')
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/ButtonAndSelectDemo'
                  })
                })
            }
            .layoutWeight(1)
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)

            // 文本与输入组件入口
            Column({ space: 12 }) {
              Text('📝')
                .fontSize(32)
              Text('文本与输入')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('Text/TextArea/Search等')
                .fontSize(12)
                .fontColor('#999')

              Button('开始学习')
                .fontSize(12)
                .width('100%')
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/TextAndInputDemo'
                  })
                })
            }
            .layoutWeight(1)
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)
          }

          Row({ space: 12 }) {
            // 图片与视频组件入口
            Column({ space: 12 }) {
              Text('🖼️')
                .fontSize(32)
              Text('图片与视频')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('Image/Video等')
                .fontSize(12)
                .fontColor('#999')

              Button('开始学习')
                .fontSize(12)
                .width('100%')
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/MediaDemo'
                  })
                })
            }
            .layoutWeight(1)
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)

            // 占位
            Column({ space: 12 }) {
              Text('📦')
                .fontSize(32)
              Text('更多组件')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('敬请期待')
                .fontSize(12)
                .fontColor('#999')
            }
            .layoutWeight(1)
            .padding(16)
            .backgroundColor('#F5F5F5')
            .borderRadius(12)
          }

          Row({ space: 12 }) {
            // 导航与切换组件入口
            Column({ space: 12 }) {
              Text('🧭')
                .fontSize(32)
              Text('导航与切换')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('Tabs/TabContent等')
                .fontSize(12)
                .fontColor('#999')

              Button('开始学习')
                .fontSize(12)
                .width('100%')
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/NavigationDemo'
                  })
                })
            }
            .layoutWeight(1)
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)

            // 信息展示组件入口
            Column({ space: 12 }) {
              Text('📊')
                .fontSize(32)
              Text('信息展示')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('Progress/Dialog等')
                .fontSize(12)
                .fontColor('#999')

              Button('开始学习')
                .fontSize(12)
                .width('100%')
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/InfoDisplayDemo'
                  })
                })
            }
            .layoutWeight(1)
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)
          }

          Row({ space: 12 }) {
            // 手势组件入口
            Column({ space: 12 }) {
              Text('👆')
                .fontSize(32)
              Text('手势组件')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('Tap/Pan/Pinch等')
                .fontSize(12)
                .fontColor('#999')

              Button('开始学习')
                .fontSize(12)
                .width('100%')
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/GestureDemo'
                  })
                })
            }
            .layoutWeight(1)
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)

            // 占位
            Column({ space: 12 }) {
              Text('📦')
                .fontSize(32)
              Text('敬请期待')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('更多组件')
                .fontSize(12)
                .fontColor('#999')
            }
            .layoutWeight(1)
            .padding(16)
            .backgroundColor('#F5F5F5')
            .borderRadius(12)
          }

          Row({ space: 12 }) {
            // 动画组件入口
            Column({ space: 12 }) {
              Text('🎬')
                .fontSize(32)
              Text('动画组件')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('animateTo/animation等')
                .fontSize(12)
                .fontColor('#999')

              Button('开始学习')
                .fontSize(12)
                .width('100%')
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/AnimationDemo'
                  })
                })
            }
            .layoutWeight(1)
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)

            // 占位
            Column({ space: 12 }) {
              Text('📦')
                .fontSize(32)
              Text('敬请期待')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('更多组件')
                .fontSize(12)
                .fontColor('#999')
            }
            .layoutWeight(1)
            .padding(16)
            .backgroundColor('#F5F5F5')
            .borderRadius(12)
          }

          Row({ space: 12 }) {
            // 弹窗组件入口
            Column({ space: 12 }) {
              Text('💬')
                .fontSize(32)
              Text('弹窗组件')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('AlertDialog/Popup等')
                .fontSize(12)
                .fontColor('#999')

              Button('开始学习')
                .fontSize(12)
                .width('100%')
                .onClick(() => {
                  router.pushUrl({
                    url: 'pages/DialogDemo'
                  })
                })
            }
            .layoutWeight(1)
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(12)

            // 占位
            Column({ space: 12 }) {
              Text('📦')
                .fontSize(32)
              Text('敬请期待')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('更多组件')
                .fontSize(12)
                .fontColor('#999')
            }
            .layoutWeight(1)
            .padding(16)
            .backgroundColor('#F5F5F5')
            .borderRadius(12)
          }

          // Kit 学习入口
          Column({ space: 12 }) {
            Text('📦')
              .fontSize(32)
            Text('Kit学习')
              .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('Network/Image等')
                .fontSize(12)
                .fontColor('#999')

            Button('开始学习')
              .fontSize(12)
              .width('100%')
              .onClick(() => {
                router.pushUrl({
                  url: 'pages/KitLearningPage'
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
      .padding({ left: 20, right: 20, top: 20, bottom: 40 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .scrollBar(BarState.Auto)
    .edgeEffect(EdgeEffect.Spring)
  }
}
