import router from '@ohos.router'

/**
 * Navigator 导航组件演示
 * 展示 Navigator 组件的路由跳转用法
 */

@Entry
@Component
struct NavigatorDemo {
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
          // Navigator 基础演示
          this.BasicNavigator()

          // Navigator 跳转方式
          this.NavTypes()

          this.TipCard('Navigator要点：掌握Navigator组件的路由跳转方式')
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

      Text('导航组件')
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
  BasicNavigator() {
    Column({ space: 12 }) {
      Text('Navigator 基础用法')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('使用 Navigator 组件进行页面跳转')
        .fontSize(14)
        .fontColor('#666')

      // Navigator 组件
      Column({ space: 12 }) {
        Navigator({ target: 'pages/RouterTargetPage' }) {
          Row() {
            Text('跳转到目标页面')
              .fontSize(16)
              .fontColor(Color.White)
              .layoutWeight(1)

            Text('→')
              .fontSize(20)
              .fontColor(Color.White)
          }
          .width('100%')
          .height(50)
          .padding({ left: 16, right: 16 })
          .backgroundColor('#007DFF')
          .borderRadius(8)
        }
        .type(NavigationType.Push)

        Navigator({ target: '' }) {
          Row() {
            Text('普通按钮（无跳转）')
              .fontSize(16)
              .fontColor('#666')
              .layoutWeight(1)
          }
          .width('100%')
          .height(50)
          .padding({ left: 16, right: 16 })
          .backgroundColor('#F0F0F0')
          .borderRadius(8)
        }
        .type(NavigationType.Push)
        .active(false)
      }
      .width('100%')

      // 说明
      Column({ space: 8 }) {
        Text('配置说明:')
          .fontSize(14)
          .fontColor('#666')

        Text('• target - 目标页面路径')
          .fontSize(12)
          .fontColor('#999')

        Text('• type: Push - 推入新页面')
          .fontSize(12)
          .fontColor('#999')

        Text('• type: Replace - 替换当前页面')
          .fontSize(12)
          .fontColor('#999')

        Text('• active: false - 禁用跳转')
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
  NavTypes() {
    Column({ space: 12 }) {
      Text('跳转方式对比')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('Push 和 Replace 的区别')
        .fontSize(14)
        .fontColor('#666')

      // 跳转方式示例
      Column({ space: 16 }) {
        Row({ space: 12 }) {
          Navigator({ target: 'pages/RouterTargetPage' }) {
            Column({ space: 4 }) {
              Text('Push')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)

              Text('保留当前页面')
                .fontSize(10)
                .fontColor(Color.White)
            }
            .width('48%')
            .height(70)
            .backgroundColor('#52C41A')
            .borderRadius(8)
            .justifyContent(FlexAlign.Center)
          }
          .type(NavigationType.Push)

          Navigator({ target: 'pages/RouterTargetPage' }) {
            Column({ space: 4 }) {
              Text('Replace')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.White)

              Text('替换当前页面')
                .fontSize(10)
                .fontColor(Color.White)
            }
            .width('48%')
            .height(70)
            .backgroundColor('#FF6B6B')
            .borderRadius(8)
            .justifyContent(FlexAlign.Center)
          }
          .type(NavigationType.Replace)
        }
        .width('100%')

        // 说明
        Column({ space: 8 }) {
          Row() {
            Column({ space: 4 }) {
              Text('Push')
                .fontSize(12)
                .fontColor('#52C41A')
                .fontWeight(FontWeight.Bold)
              Text('新页面入栈，可返回')
                .fontSize(10)
                .fontColor('#999')
            }
            .layoutWeight(1)

            Column({ space: 4 }) {
              Text('Replace')
                .fontSize(12)
                .fontColor('#FF6B6B')
                .fontWeight(FontWeight.Bold)
              Text('替换页面，不可返回')
                .fontSize(10)
                .fontColor('#999')
            }
            .layoutWeight(1)
          }
          .width('100%')

          Text('params - 传递参数到目标页面')
            .fontSize(12)
            .fontColor('#999')
        }
        .width('100%')
        .padding(12)
        .backgroundColor('#FFF3E0')
        .borderRadius(8)
      }
      .width('100%')
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
