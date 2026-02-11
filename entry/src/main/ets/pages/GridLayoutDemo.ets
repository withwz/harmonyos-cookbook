import router from '@ohos.router'

/**
 * Grid 布局演示
 *
 * Grid 是网格布局容器
 * 子元素按行列网格排列
 */

@Entry
@Component
struct GridLayoutDemo {
  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.BackButton()
        this.SectionTitle('Grid 网格布局')

        this.InfoCard('Grid 将子元素按网格排列，适用于相册、九宫格等场景')

        // 示例1：基础用法
        this.BasicSection()

        // 示例2：固定列数
        this.FixedColumnsSection()

        // 示例3：行列跨度
        this.SpanSection()

        // 示例4：实战案例
        this.PhotoGallerySection()

        this.TipCard('Grid 要点：columnsTemplate设置列数、columnsGap行间距、rowsGap列间距')
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
      Text('示例1：基础用法 - 3列网格')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Grid() {
        ForEach(['1', '2', '3', '4', '5', '6'], (item: string) => {
          GridItem() {
            Text(item)
              .fontSize(24)
              .fontColor(Color.White)
              .width('100%')
              .height('100%')
              .backgroundColor('#007DFF')
              .borderRadius(8)
              .textAlign(TextAlign.Center)
          }
          .height(80)
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('100%')
      .height(280)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  FixedColumnsSection() {
    Column({ space: 12 }) {
      Text('示例2：不同列数')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Column({ space: 10 }) {
        this.GridDemo('2列', '1fr 1fr', '#007DFF')
        this.GridDemo('3列', '1fr 1fr 1fr', '#52C41A')
        this.GridDemo('4列', '1fr 1fr 1fr 1fr', '#722ED1')
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  GridDemo(label: string, template: string, color: string) {
    Column({ space: 6 }) {
      Text(label)
        .fontSize(12)
        .fontColor('#666')

      Grid() {
        ForEach(['1', '2', '3', '4'], (item: string) => {
          GridItem() {
            Text(item)
              .fontSize(16)
              .fontColor(Color.White)
              .width('100%')
              .height('100%')
              .backgroundColor(color)
              .borderRadius(6)
              .textAlign(TextAlign.Center)
          }
          .height(50)
        }, (item: string) => item)
      }
      .columnsTemplate(template)
      .columnsGap(6)
      .rowsGap(6)
      .width('100%')
      .height(120)
    }
  }

  @Builder
  SpanSection() {
    Column({ space: 12 }) {
      Text('示例3：行列跨度 (columnStart/rowStart)')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Grid() {
        // 跨2列
        GridItem() {
          Text('跨2列')
            .fontSize(14)
            .fontColor(Color.White)
            .width('100%')
            .height('100%')
            .backgroundColor('#007DFF')
            .textAlign(TextAlign.Center)
        }
        .columnStart(0)
        .columnEnd(1)
        .height(60)

        // 普通格子
        GridItem() {
          Text('3')
            .fontSize(14)
            .fontColor(Color.White)
            .width('100%')
            .height('100%')
            .backgroundColor('#52C41A')
            .textAlign(TextAlign.Center)
        }
        .height(60)

        GridItem() {
          Text('4')
            .fontSize(14)
            .fontColor(Color.White)
            .width('100%')
            .height('100%')
            .backgroundColor('#52C41A')
            .textAlign(TextAlign.Center)
        }
        .height(60)

        // 跨2行
        GridItem() {
          Text('跨2行')
            .fontSize(14)
            .fontColor(Color.White)
            .width('100%')
            .height('100%')
            .backgroundColor('#FA8C16')
            .textAlign(TextAlign.Center)
        }
        .rowStart(1)
        .rowEnd(2)
        .height(60)

        // 普通格子
        GridItem() {
          Text('7')
            .fontSize(14)
            .fontColor(Color.White)
            .width('100%')
            .height('100%')
            .backgroundColor('#13C2C2')
            .textAlign(TextAlign.Center)
        }
        .height(60)

        GridItem() {
          Text('8')
            .fontSize(14)
            .fontColor(Color.White)
            .width('100%')
            .height('100%')
            .backgroundColor('#13C2C2')
            .textAlign(TextAlign.Center)
        }
        .height(60)
      }
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(8)
      .rowsGap(8)
      .width('100%')
      .height(200)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  PhotoGallerySection() {
    Column({ space: 12 }) {
      Text('示例4：实战案例 - 相册网格')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Grid() {
        ForEach(['🌄', '🌅', '🌠', '🌇', '🌉', '🏔️', '🏖️', '🌊', '🌺'], (item: string) => {
          GridItem() {
            Column() {
              Text(item)
                .fontSize(32)
              Text('风景')
                .fontSize(12)
                .fontColor('#666')
                .margin({ top: 4 })
            }
            .width('100%')
            .height('100%')
            .justifyContent(FlexAlign.Center)
            .backgroundColor('#F8F8F8')
            .borderRadius(8)
          }
          .height(100)
        }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('100%')
      .height(350)
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
      .fontColor('#722ED1')
      .width('100%')
      .padding(12)
      .backgroundColor('#F9F0FF')
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
