import router from '@ohos.router'

/**
 * 导航与切换组件演示
 * 展示 Tabs、TabContent 等组件的用法
 */

@Entry
@Component
struct NavigationDemo {
  @State currentIndex: number = 0
  @State verticalIndex: number = 0

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
          // Tabs 标签页
          this.TabsSection()

          // 垂直 Tabs
          this.VerticalTabsSection()

          this.TipCard('导航与切换组件要点：掌握 Tabs 实现页面切换和标签导航')
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

      Text('导航与切换组件')
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

      // Tabs 示例
      Tabs({ index: this.currentIndex }) {
        TabContent() {
          Column({ space: 12 }) {
            Text('首页内容')
              .fontSize(16)
            Text('这是第一个标签页')
              .fontSize(14)
              .fontColor('#666')
          }
          .width('100%')
          .height(150)
          .justifyContent(FlexAlign.Center)
        }
        .tabBar('首页')

        TabContent() {
          Column({ space: 12 }) {
            Text('发现内容')
              .fontSize(16)
            Text('这是第二个标签页')
              .fontSize(14)
              .fontColor('#666')
          }
          .width('100%')
          .height(150)
          .justifyContent(FlexAlign.Center)
        }
        .tabBar('发现')

        TabContent() {
          Column({ space: 12 }) {
            Text('我的内容')
              .fontSize(16)
            Text('这是第三个标签页')
              .fontSize(14)
              .fontColor('#666')
          }
          .width('100%')
          .height(150)
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
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  VerticalTabsSection() {
    Column({ space: 12 }) {
      Text('Tabs 垂直模式')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 垂直 Tabs 示例
      Tabs({ index: this.verticalIndex }) {
        TabContent() {
          Column({ space: 12 }) {
            Text('推荐内容')
              .fontSize(16)
            Text('推荐列表')
              .fontSize(14)
              .fontColor('#666')
          }
          .width('100%')
          .height(120)
          .justifyContent(FlexAlign.Center)
        }
        .tabBar('推荐')

        TabContent() {
          Column({ space: 12 }) {
            Text('热门内容')
              .fontSize(16)
            Text('热门列表')
              .fontSize(14)
              .fontColor('#666')
          }
          .width('100%')
          .height(120)
          .justifyContent(FlexAlign.Center)
        }
        .tabBar('热门')

        TabContent() {
          Column({ space: 12 }) {
            Text('关注内容')
              .fontSize(16)
            Text('关注列表')
              .fontSize(14)
              .fontColor('#666')
          }
          .width('100%')
          .height(120)
          .justifyContent(FlexAlign.Center)
        }
        .tabBar('关注')
      }
      .width('100%')
      .height(200)
      .vertical(true)
      .barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.verticalIndex = index
      })
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
