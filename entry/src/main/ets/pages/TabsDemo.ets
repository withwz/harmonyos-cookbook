import router from '@ohos.router'

/**
 * Tabs 标签页组件演示
 */

@Entry
@Component
struct TabsDemo {
  @State currentIndex: number = 0

  build() {
    Column() {
      Row() {
        this.Header()
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20 })

      Scroll() {
        Column({ space: 20 }) {
          this.TabsSection()
          this.TipCard('Tabs要点：用于内容分类和切换')
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

      Text('标签页')
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
  TabsSection() {
    Column({ space: 12 }) {
      Text('Tabs 标签页')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('可滑动的标签页容器')
        .fontSize(14)
        .fontColor('#666')

      // Tabs 示例
      Tabs({ index: this.currentIndex }) {
        TabContent() {
          Column({ space: 10 }) {
            Text('首页内容')
              .fontSize(16)
            Text('这是首页的Tab内容')
              .fontSize(14)
              .fontColor('#666')
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
        }
        .tabBar('首页')

        TabContent() {
          Column({ space: 10 }) {
            Text('发现内容')
              .fontSize(16)
            Text('这是发现的Tab内容')
              .fontSize(14)
              .fontColor('#666')
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
        }
        .tabBar('发现')

        TabContent() {
          Column({ space: 10 }) {
            Text('消息内容')
              .fontSize(16)
            Text('这是消息的Tab内容')
              .fontSize(14)
              .fontColor('#666')
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
        }
        .tabBar('消息')

        TabContent() {
          Column({ space: 10 }) {
            Text('我的内容')
              .fontSize(16)
            Text('这是我的Tab内容')
              .fontSize(14)
              .fontColor('#666')
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
        }
        .tabBar('我的')
      }
      .width('100%')
      .height(200)
      .barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.currentIndex = index
      })

      // 说明
      Column({ space: 8 }) {
        Text('属性说明:')
          .fontSize(14)
          .fontColor('#666')

        Text('• TabContent - 标签页内容')
          .fontSize(12)
          .fontColor('#999')

        Text('• tabBar - 标签文字')
          .fontSize(12)
          .fontColor('#999')

        Text('• barMode - 标签栏模式')
          .fontSize(12)
          .fontColor('#999')

        Text('• 常用于首页分类切换')
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
