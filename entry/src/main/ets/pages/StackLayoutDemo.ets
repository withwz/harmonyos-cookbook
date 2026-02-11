import router from '@ohos.router'

/**
 * Stack 布局演示
 *
 * Stack 是层叠布局容器
 * 子元素可以堆叠显示，后添加的元素在上层
 */

@Entry
@Component
struct StackLayoutDemo {
  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.BackButton()
        this.SectionTitle('Stack 层叠布局')

        this.InfoCard('Stack 让子元素堆叠显示，常用于图片上的文字、卡片标签等')

        // 示例1：基础用法
        this.BasicSection()

        // 示例2：对齐方式
        this.AlignSection()

        // 示例3：实战案例
        this.ImageCardSection()
        this.BadgeSection()

        this.TipCard('Stack 要点：子元素堆叠、alignContent控制对齐顺序')
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  BasicSection() {
    Column({ space: 12 }) {
      Text('示例1：基础用法')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Stack() {
        // 底层
        Text('底层元素')
          .width(200)
          .height(100)
          .backgroundColor('#E6E6E6')
          .textAlign(TextAlign.Center)

        // 中层
        Text('中层元素')
          .width(150)
          .height(80)
          .backgroundColor('#D9D9D9')
          .textAlign(TextAlign.Center)

        // 顶层
        Text('顶层元素')
          .width(100)
          .height(60)
          .backgroundColor('#007DFF')
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
      }
      .width(220)
      .height(120)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  AlignSection() {
    Column({ space: 12 }) {
      Text('示例2：对齐方式 (alignContent)')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Row({ space: 12 }) {
        this.AlignDemo('TopStart', Alignment.TopStart)
        this.AlignDemo('Center', Alignment.Center)
        this.AlignDemo('BottomEnd', Alignment.BottomEnd)
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  AlignDemo(label: string, align: Alignment) {
    Column({ space: 8 }) {
      Text(label)
        .fontSize(12)
        .fontColor('#666')

      Stack({ alignContent: align }) {
        Text('容器')
          .width(80)
          .height(80)
          .backgroundColor('#F8F8F8')
          .fontSize(12)
          .textAlign(TextAlign.Center)

        Text('内容')
          .width(40)
          .height(40)
          .backgroundColor('#007DFF')
          .fontColor(Color.White)
          .fontSize(12)
          .textAlign(TextAlign.Center)
      }
      .width(80)
      .height(80)
    }
  }

  @Builder
  ImageCardSection() {
    Column({ space: 12 }) {
      Text('示例3：实战案例 - 图片卡片')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Stack({ alignContent: Alignment.BottomStart }) {
        // 图片背景
        Column()
          .width('100%')
          .height(150)
          .backgroundColor('#722ED1')
          .borderRadius(8)

        // 渐变遮罩
        Column()
          .width('100%')
          .height(60)
          .linearGradient({
            angle: 90,
            colors: [['#00000000', 0.0], ['#99000000', 1.0]]
          })
          .position({ x: 0, y: '100%' })
          .translate({ y: '-100%' })

        // 文字内容
        Column({ space: 4 }) {
          Text('精美风景')
            .fontSize(18)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)

          Text('大自然的美景')
            .fontSize(12)
            .fontColor('#E6E6E6')
        }
        .padding(12)
      }
      .width('100%')
    }
    .width('100%')
  }

  @Builder
  BadgeSection() {
    Column({ space: 12 }) {
      Text('示例4：实战案例 - 消息角标')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Row({ space: 20 }) {
        // 消息图标
        Stack({ alignContent: Alignment.TopEnd }) {
          Text('💬')
            .fontSize(40)

          Text('3')
            .width(20)
            .height(20)
            .fontSize(12)
            .fontColor(Color.White)
            .backgroundColor('#FF6B6B')
            .borderRadius(10)
            .textAlign(TextAlign.Center)
        }
        .width(50)
        .height(50)

        // 通知图标
        Stack({ alignContent: Alignment.TopEnd }) {
          Text('🔔')
            .fontSize(40)

          Text('99+')
            .width(28)
            .height(18)
            .fontSize(10)
            .fontColor(Color.White)
            .backgroundColor('#FF6B6B')
            .borderRadius(9)
            .textAlign(TextAlign.Center)
        }
        .width(50)
        .height(50)

        // 购物车图标
        Stack({ alignContent: Alignment.TopEnd }) {
          Text('🛒')
            .fontSize(40)

          Text('5')
            .width(20)
            .height(20)
            .fontSize(12)
            .fontColor(Color.White)
            .backgroundColor('#52C41A')
            .borderRadius(10)
            .textAlign(TextAlign.Center)
        }
        .width(50)
        .height(50)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .padding(20)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  BackButton() {
    Row() {
      Button('← 返回')
        .fontSize(14)
        .onClick(() => {
          router.back()
        })
    }
    .width('100%')
    .margin({ bottom: 10 })
  }

  @Builder
  SectionTitle(title: string) {
    Text(title)
      .fontSize(24)
      .fontWeight(FontWeight.Bold)
      .width('100%')
  }

  @Builder
  InfoCard(info: string) {
    Text(info)
      .fontSize(14)
      .fontColor('#FF6B6B')
      .width('100%')
      .padding(12)
      .backgroundColor('#FFF5F5')
      .borderRadius(8)
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
  }
}
