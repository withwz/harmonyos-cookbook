import router from '@ohos.router'

/**
 * Flex 布局演示
 *
 * Flex 是弹性布局容器
 * 子元素可以按比例分配空间，实现自适应布局
 */

@Entry
@Component
struct FlexLayoutDemo {
  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.BackButton()
        this.SectionTitle('Flex 弹性布局')

        this.InfoCard('Flex 提供强大的弹性布局能力，子元素可按比例分配空间')

        // 示例1：主轴方向
        this.DirectionSection()

        // 示例2：换行
        this.WrapSection()

        // 示例3：主轴对齐
        this.MainAxisAlignmentSection()

        // 示例4：交叉轴对齐
        this.CrossAxisAlignmentSection()

        // 示例5：实战案例
        this.ProgressBarSection()

        this.TipCard('Flex 要点：direction设置方向、wrap控制换行、justifyContent主轴对齐')
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  DirectionSection() {
    Column({ space: 12 }) {
      Text('示例1：主轴方向 (direction)')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Column({ space: 10 }) {
        this.DirectionDemo('Row (默认)', FlexDirection.Row)
        this.DirectionDemo('RowReverse', FlexDirection.RowReverse)
        this.DirectionDemo('Column', FlexDirection.Column)
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  DirectionDemo(label: string, direction: FlexDirection) {
    Column({ space: 6 }) {
      Text(label)
        .fontSize(12)
        .fontColor('#666')

      Flex({ direction: direction }) {
        Text('A')
          .width(40)
          .height(40)
          .backgroundColor('#007DFF')
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)

        Text('B')
          .width(40)
          .height(40)
          .backgroundColor('#52C41A')
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)

        Text('C')
          .width(40)
          .height(40)
          .backgroundColor('#FA8C16')
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(8)
      .backgroundColor('#F8F8F8')
      .borderRadius(6)
    }
  }

  @Builder
  WrapSection() {
    Column({ space: 12 }) {
      Text('示例2：换行 (wrap)')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Column({ space: 10 }) {
        this.WrapDemo('NoWrap (默认)', FlexWrap.NoWrap)
        this.WrapDemo('Wrap', FlexWrap.Wrap)
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  WrapDemo(label: string, wrap: FlexWrap) {
    Column({ space: 6 }) {
      Text(label)
        .fontSize(12)
        .fontColor('#666')

      Flex({ wrap: wrap }) {
        ForEach(['标签1', '标签2', '标签3', '标签4', '标签5'], (item: string) => {
          Text(item)
            .padding({ left: 12, right: 12, top: 6, bottom: 6 })
            .backgroundColor('#007DFF')
            .fontColor(Color.White)
            .borderRadius(4)
            .margin({ right: 8, bottom: 8 })
        }, (item: string) => item)
      }
      .width('100%')
      .padding(8)
      .backgroundColor('#F8F8F8')
      .borderRadius(6)
    }
  }

  @Builder
  MainAxisAlignmentSection() {
    Column({ space: 12 }) {
      Text('示例3：主轴对齐 (justifyContent)')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Column({ space: 8 }) {
        this.JustifyDemo('Start', FlexAlign.Start)
        this.JustifyDemo('Center', FlexAlign.Center)
        this.JustifyDemo('End', FlexAlign.End)
        this.JustifyDemo('SpaceBetween', FlexAlign.SpaceBetween)
        this.JustifyDemo('SpaceAround', FlexAlign.SpaceAround)
        this.JustifyDemo('SpaceEvenly', FlexAlign.SpaceEvenly)
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  JustifyDemo(label: string, align: FlexAlign) {
    Column({ space: 6 }) {
      Text(label)
        .fontSize(12)
        .fontColor('#666')

      Flex({ justifyContent: align }) {
        Text('A')
          .width(30)
          .height(30)
          .backgroundColor('#007DFF')
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)

        Text('B')
          .width(30)
          .height(30)
          .backgroundColor('#52C41A')
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)

        Text('C')
          .width(30)
          .height(30)
          .backgroundColor('#FA8C16')
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .height(40)
      .padding(8)
      .backgroundColor('#F8F8F8')
      .borderRadius(6)
    }
  }

  @Builder
  CrossAxisAlignmentSection() {
    Column({ space: 12 }) {
      Text('示例4：交叉轴对齐 (alignItems)')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Column({ space: 8 }) {
        this.AlignDemo('Start', ItemAlign.Start)
        this.AlignDemo('Center', ItemAlign.Center)
        this.AlignDemo('End', ItemAlign.End)
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  AlignDemo(label: string, align: ItemAlign) {
    Column({ space: 6 }) {
      Text(label)
        .fontSize(12)
        .fontColor('#666')

      Flex({ alignItems: align }) {
        Text('小')
          .width(40)
          .height(30)
          .backgroundColor('#007DFF')
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)

        Text('中')
          .width(40)
          .height(50)
          .backgroundColor('#52C41A')
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)

        Text('大')
          .width(40)
          .height(70)
          .backgroundColor('#FA8C16')
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .height(80)
      .padding(8)
      .backgroundColor('#F8F8F8')
      .borderRadius(6)
    }
  }

  @Builder
  ProgressBarSection() {
    Column({ space: 12 }) {
      Text('示例5：实战案例 - 自适应进度条')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Column({ space: 16 }) {
        // 进度条 1
        Column({ space: 8 }) {
          Row() {
            Text('下载中...')
              .fontSize(12)
              .fontColor('#666')
            Text('65%')
              .fontSize(12)
              .fontColor('#666')
          }
          .width('100%')

          Flex() {
            Column()
              .height(8)
              .backgroundColor('#007DFF')
              .borderRadius(4)

            Column()
              .layoutWeight(1)
              .height(8)
              .backgroundColor('#E6E6E6')
              .borderRadius(4)
          }
          .width('100%')
        }

        // 进度条 2
        Column({ space: 8 }) {
          Row() {
            Text('上传中...')
              .fontSize(12)
              .fontColor('#666')
            Text('80%')
              .fontSize(12)
              .fontColor('#666')
          }
          .width('100%')

          Flex() {
            Column()
              .height(8)
              .backgroundColor('#52C41A')
              .borderRadius(4)

            Column()
              .layoutWeight(1)
              .height(8)
              .backgroundColor('#E6E6E6')
              .borderRadius(4)
          }
          .width('100%')
        }
      }
      .width('100%')
      .padding(16)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)
    }
    .width('100%')
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
      .fontColor('#FA8C16')
      .width('100%')
      .padding(12)
      .backgroundColor('#FFF7E6')
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
