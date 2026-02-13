import router from '@ohos.router'

/**
 * Badge 徽标组件演示
 * 展示数字和圆点徽标的效果
 */

@Entry
@Component
struct BadgeDemo {
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
          // Badge 基础演示
          this.BadgeSection()

          this.TipCard('徽标要点：使用Badge组件在文字或图标上添加提示')
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

      Text('徽标组件')
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
  BadgeSection() {
    Column({ space: 12 }) {
      Text('Badge 徽标')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('在文字或图标上添加数字/圆点提示')
        .fontSize(14)
        .fontColor('#666')

      // 数字徽标示例
      Column({ space: 16 }) {
        Text('数字徽标示例:')
          .fontSize(14)
          .fontColor('#666')
          .width('100%')

        Row({ space: 12 }) {
          this.BadgeItem('消息', 99, '#FF4D4F')
          this.BadgeItem('通知', 5, '#52C41A')
          this.BadgeItem('邮件', 12, '#FAAD14')
          this.BadgeItem('日历', 3, '#FA541C')
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)

        // 圆点徽标示例
        Column({ space: 16 }) {
          Text('圆点徽标示例:')
            .fontSize(14)
            .fontColor('#666')
            .width('100%')

          Row({ space: 12 }) {
            this.DotBadgeItem('新', true)
            this.DotBadgeItem('状态', false)
            this.DotBadgeItem('提醒', true)
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceAround)
        }
      }
      .width('100%')
      .padding(16)
      .backgroundColor(Color.White)
      .borderRadius(12)
      .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })

      // 说明
      Column({ space: 8 }) {
        Text('使用说明:')
          .fontSize(14)
          .fontColor('#666')

        Text('• Badge - 数字徽标组件')
          .fontSize(12)
          .fontColor('#999')

        Text('• position - 徽标位置')
          .fontSize(12)
          .fontColor('#999')

        Text('• style - Number数字/Dot圆点')
          .fontSize(12)
          .fontColor('#999')

        Text('• 常用于消息、通知、更新提示等')
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
  BadgeItem(label: string, count: number, color: string) {
    Row({ space: 8 }) {
      Text(label)
        .fontSize(16)
        .fontColor('#333')

      // 模拟 Badge
      Stack() {
        Text(`${count}`)
          .fontSize(12)
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
          .padding({ top: 2, left: 6, right: 6, bottom: 2 })
          .backgroundColor(color)
          .borderRadius(10)
      }
      .width(30)
      .height(30)
    }
    .width('60')
    .height(40)
    .padding({ left: 16, right: 16 })
    .backgroundColor('#F8F8F8')
    .borderRadius(8)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  DotBadgeItem(label: string, showDot: boolean) {
    Row({ space: 8 }) {
      Text(label)
        .fontSize(16)
        .fontColor('#333')

      // 模拟圆点徽标
      Stack() {
        if (showDot) {
          Text('')
            .fontSize(12)
            .fontColor(Color.White)
            .width(10)
            .height(10)
            .borderRadius(5)
            .backgroundColor('#FF4D4F')
        }
      }
      .width(30)
      .height(30)
    }
    .width('60')
    .height(40)
    .padding({ left: 16, right: 16 })
    .backgroundColor('#F8F8F8')
    .borderRadius(8)
    .justifyContent(FlexAlign.Center)
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
