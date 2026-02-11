import router from '@ohos.router'

/**
 * Column 布局演示
 *
 * Column 是垂直方向的线性布局容器
 * 子元素按照垂直方向依次排列
 */

@Entry
@Component
struct ColumnLayoutDemo {
  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.BackButton()
        this.SectionTitle('Column 垂直布局')

        this.InfoCard('Column 沿垂直方向排列子元素，是最常用的布局容器')

        // 示例1：基础用法
        this.BasicSection()

        // 示例2：对齐方式
        this.AlignSection()

        // 示例3：间距设置
        this.SpacingSection()

        // 示例4：实战案例
        this.ProfileCardSection()

        this.TipCard('Column 要点：垂直排列、space设置间距、alignItems控制水平对齐')
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

      // 演示 Column
      Column() {
        Text('第一行')
          .fontSize(14)
        Text('第二行')
          .fontSize(14)
        Text('第三行')
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
      Text('示例2：对齐方式 (alignItems)')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      // Start 对齐
      this.AlignDemo('Start (默认)', HorizontalAlign.Start)

      // Center 对齐
      this.AlignDemo('Center', HorizontalAlign.Center)

      // End 对齐
      this.AlignDemo('End', HorizontalAlign.End)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  AlignDemo(label: string, align: HorizontalAlign) {
    Column({ space: 8 }) {
      Text(label)
        .fontSize(12)
        .fontColor('#666')

      Column() {
        Text('短文本')
          .fontSize(12)
        Text('中等长度的文本内容')
          .fontSize(12)
        Text('很长的文本内容用于演示对齐效果')
          .fontSize(12)
      }
      .width('100%')
      .padding(12)
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

      Row({ space: 12 }) {
        // 无间距
        Column() {
          Text('A')
          Text('B')
          Text('C')
        }
        .width('100%')
        .height(80)
        .padding(8)
        .backgroundColor('#FFF7E6')
        .borderRadius(6)
        .justifyContent(FlexAlign.SpaceAround)

        // space: 8
        Column({ space: 8 }) {
          Text('A')
          Text('B')
          Text('C')
        }
        .width('100%')
        .height(80)
        .padding(8)
        .backgroundColor('#F6FFED')
        .borderRadius(6)
        .justifyContent(FlexAlign.SpaceAround)

        // space: 16
        Column({ space: 16 }) {
          Text('A')
          Text('B')
          Text('C')
        }
        .width('100%')
        .height(80)
        .padding(8)
          .backgroundColor('#F9F0FF')
        .borderRadius(6)
        .justifyContent(FlexAlign.SpaceAround)
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  ProfileCardSection() {
    Column({ space: 12 }) {
      Text('示例4：实战案例 - 个人资料卡片')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Column({ space: 12 }) {
        // 头像
        Text('头像')
          .fontSize(40)
          .width(80)
          .height(80)
          .backgroundColor('#E6E6E6')
          .borderRadius(40)
          .textAlign(TextAlign.Center)

        // 用户名
        Text('张三')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        // 简介
        Text('鸿蒙开发工程师')
          .fontSize(14)
          .fontColor('#666')

        // 统计数据
        Row({ space: 24 }) {
          this.StatItem('文章', '128')
          this.StatItem('粉丝', '1.2k')
          this.StatItem('关注', '56')
        }
      }
      .width('100%')
      .padding(20)
      .backgroundColor(Color.White)
      .borderRadius(12)
    }
    .width('100%')
  }

  @Builder
  StatItem(label: string, value: string) {
    Column({ space: 4 }) {
      Text(value)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
      Text(label)
        .fontSize(12)
        .fontColor('#999')
    }
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
      .fontColor('#007DFF')
      .width('100%')
      .padding(12)
      .backgroundColor('#E6F7FF')
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
