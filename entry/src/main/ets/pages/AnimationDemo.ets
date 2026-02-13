import router from '@ohos.router'

/**
 * 动画组件演示
 * 展示 animateTo、animation 等动画的用法
 */

@Entry
@Component
struct AnimationDemo {
  @State rotateAngle: number = 0
  @State scaleValue: number = 1
  @State translateX: number = 0
  @State opacityValue: number = 1

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.Header()

        // animateTo 属性动画
        this.AnimateToSection()

        this.TipCard('动画组件要点：掌握 animateTo 实现平滑的属性过渡动画')
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 20 })
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

      Text('动画组件')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .margin({ right: 40 })
    }
    .width('100%')
  }

  @Builder
  AnimateToSection() {
    Column({ space: 12 }) {
      Text('animateTo 属性动画')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 旋转动画
      Column({ space: 16 }) {
        Text('旋转动画')
          .fontSize(14)
          .fontColor('#666')

        Column() {
          Text('旋转')
            .fontSize(20)
            .fontColor(Color.White)
        }
        .width(80)
        .height(80)
        .backgroundColor('#007DFF')
        .borderRadius(12)
        .justifyContent(FlexAlign.Center)
        .rotate({ angle: this.rotateAngle })

        Button('开始旋转')
          .fontSize(14)
          .onClick(() => {
            animateTo({
              duration: 1000,
              curve: Curve.EaseInOut
            }, () => {
              this.rotateAngle += 90
            })
          })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)

      // 缩放动画
      Column({ space: 16 }) {
        Text('缩放动画')
          .fontSize(14)
          .fontColor('#666')

        Column() {
          Text('缩放')
            .fontSize(20)
            .fontColor(Color.White)
        }
        .width(80)
        .height(80)
        .backgroundColor('#52C41A')
        .borderRadius(12)
        .justifyContent(FlexAlign.Center)
        .scale({ x: this.scaleValue, y: this.scaleValue })

        Button('开始缩放')
          .fontSize(14)
          .onClick(() => {
            animateTo({
              duration: 1000,
              curve: Curve.EaseInOut
            }, () => {
              this.scaleValue = this.scaleValue === 1 ? 1.5 : 1
            })
          })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)

      // 平移动画
      Column({ space: 16 }) {
        Text('平移动画')
          .fontSize(14)
          .fontColor('#666')

        Column() {
          Text('平移')
            .fontSize(20)
            .fontColor(Color.White)
        }
        .width(80)
        .height(80)
        .backgroundColor('#FAAD14')
        .borderRadius(12)
        .justifyContent(FlexAlign.Center)
        .translate({ x: this.translateX })

        Button('开始平移')
          .fontSize(14)
          .onClick(() => {
            animateTo({
              duration: 1000,
              curve: Curve.EaseInOut
            }, () => {
              this.translateX = this.translateX === 0 ? 50 : 0
            })
          })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)

      // 透明度动画
      Column({ space: 16 }) {
        Text('透明度动画')
          .fontSize(14)
          .fontColor('#666')

        Column() {
          Text('透明')
            .fontSize(20)
            .fontColor(Color.White)
        }
        .width(80)
        .height(80)
        .backgroundColor('#FF6B6B')
        .borderRadius(12)
        .justifyContent(FlexAlign.Center)
        .opacity(this.opacityValue)

        Button('开始渐变')
          .fontSize(14)
          .onClick(() => {
            animateTo({
              duration: 1000,
              curve: Curve.EaseInOut
            }, () => {
              this.opacityValue = this.opacityValue === 1 ? 0.2 : 1
            })
          })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
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
