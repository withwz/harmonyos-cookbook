import router from '@ohos.router'

/**
 * Row 布局演示
 *
 * Row 是水平方向的线性布局容器
 * 子元素按照水平方向依次排列
 */

@Entry
@Component
struct RowLayoutDemo {
  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.BackButton()
        this.SectionTitle('Row 水平布局')

        this.InfoCard('Row 沿水平方向排列子元素，常用于导航栏、工具栏等')

        // 示例1：基础用法
        this.BasicSection()

        // 示例2：对齐方式
        this.AlignSection()

        // 示例3：space 间距
        this.SpacingSection()

        // 示例4：实战案例
        this.NavBarSection()
        this.ButtonRowSection()

        this.TipCard('Row 要点：水平排列、space设置间距、alignItems控制垂直对齐')
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

      Row() {
        Text('元素1')
          .fontSize(14)
        Text('元素2')
          .fontSize(14)
        Text('元素3')
          .fontSize(14)
      }
      .width('100%')
      .padding(16)
      .backgroundColor('#E6F7FF')
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
      Text('示例2：垂直对齐方式 (alignItems)')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      this.AlignDemo('Top (默认)', VerticalAlign.Top)
      this.AlignDemo('Center', VerticalAlign.Center)
      this.AlignDemo('Bottom', VerticalAlign.Bottom)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  AlignDemo(label: string, align: VerticalAlign) {
    Column({ space: 8 }) {
      Text(label)
        .fontSize(12)
        .fontColor('#666')

      Row() {
        Text('小')
          .fontSize(12)
          .padding(8)
          .backgroundColor('#E6F7FF')

        Text('中等高度')
          .fontSize(12)
          .padding(16)
          .backgroundColor('#F6FFED')

        Text('大高度的文本')
          .fontSize(12)
          .padding(24)
          .backgroundColor('#FFF7E6')
      }
      .width('100%')
      .height(80)
      .padding(8)
      .backgroundColor('#F8F8F8')
      .borderRadius(6)
      .alignItems(align)
    }
    .width('100%')
  }

  @Builder
  SpacingSection() {
    Column({ space: 12 }) {
      Text('示例3：间距设置 (space)')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Column({ space: 12 }) {
        // 无间距
        Row() {
          Text('A').padding(8).backgroundColor('#E6E6E6')
          Text('B').padding(8).backgroundColor('#E6E6E6')
          Text('C').padding(8).backgroundColor('#E6E6E6')
        }
        .width('100%')

        // space: 8
        Row({ space: 8 }) {
          Text('A').padding(8).backgroundColor('#E6E6E6')
          Text('B').padding(8).backgroundColor('#E6E6E6')
          Text('C').padding(8).backgroundColor('#E6E6E6')
        }
        .width('100%')

        // space: 16
        Row({ space: 16 }) {
          Text('A').padding(8).backgroundColor('#E6E6E6')
          Text('B').padding(8).backgroundColor('#E6E6E6')
          Text('C').padding(8).backgroundColor('#E6E6E6')
        }
        .width('100%')
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  NavBarSection() {
    Column({ space: 12 }) {
      Text('示例4：实战案例 - 导航栏')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Row() {
        Text('☰')
          .fontSize(24)

        Text('标题')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)

        Text('⋯')
          .fontSize(24)
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor(Color.White)
      .borderRadius(8)
    }
    .width('100%')
  }

  @Builder
  ButtonRowSection() {
    Column({ space: 12 }) {
      Text('示例5：按钮组')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Row({ space: 12 }) {
        Button('取消')
          .fontSize(14)
          .backgroundColor('#E6E6E6')
          .fontColor('#333')
          .layoutWeight(1)

        Button('确定')
          .fontSize(14)
          .backgroundColor('#007DFF')
          .layoutWeight(1)
      }
      .width('100%')
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
      .fontColor('#52C41A')
      .width('100%')
      .padding(12)
      .backgroundColor('#F6FFED')
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
