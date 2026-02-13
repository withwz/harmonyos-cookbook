import router from '@ohos.router'

/**
 * Swiper 轮播组件演示
 * 展示轮播图的基础用法
 */

@Entry
@Component
struct SwiperDemo {
  @State currentIndex: number = 0
  @State customIndex: number = 0
  private swiperController: SwiperController = new SwiperController()

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.Header()

        // Swiper 基础演示
        this.BasicSwiper()

        // Swiper 纵向轮播
        this.VerticalSwiper()

        // Swiper 自定义指示器
        this.CustomIndicatorSwiper()

        // Swiper 手动控制
        this.ManualControlSwiper()

        this.TipCard('轮播组件要点：掌握自动播放、指示器、循环播放等常用配置')
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

      Text('轮播组件')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .margin({ right: 40 })
    }
    .width('100%')
  }

  @Builder
  BasicSwiper() {
    Column({ space: 12 }) {
      Text('Swiper 基础轮播')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('自动循环播放的轮播图')
        .fontSize(14)
        .fontColor('#666')

      // Swiper 组件
      Swiper() {
        ForEach([1, 2, 3, 4], (item: number) => {
          Column() {
            Text(`页面 ${item}`)
              .fontSize(32)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .height(200)
          .backgroundColor(item === 1 ? '#007DFF' : item === 2 ? '#52C41A' : item === 3 ? '#FAAD14' : '#FF6B6B')
          .borderRadius(12)
          .justifyContent(FlexAlign.Center)
        }, (item: number) => item.toString())
      }
      .width('100%')
      .height(200)
      .loop(true)
      .autoPlay(true)
      .interval(3000)
      .indicator(new DotIndicator())
      .onChange((index: number) => {
        this.currentIndex = index
      })

      // 说明
      Column({ space: 8 }) {
        Text('配置说明:')
          .fontSize(14)
          .fontColor('#666')

        Text('• loop: true - 循环播放')
          .fontSize(12)
          .fontColor('#999')

        Text('• autoPlay: true - 自动播放')
          .fontSize(12)
          .fontColor('#999')

        Text('• interval: 3000 - 3秒切换')
          .fontSize(12)
          .fontColor('#999')

        Text('• indicator: DotIndicator() - 圆点指示器')
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
  VerticalSwiper() {
    Column({ space: 12 }) {
      Text('Swiper 纵向轮播')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('上下滑动切换的轮播图')
        .fontSize(14)
        .fontColor('#666')

      // 纵向 Swiper
      Swiper() {
        ForEach([1, 2, 3], (item: number) => {
          Column() {
            Text(`纵向 ${item}`)
              .fontSize(32)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .height(120)
          .backgroundColor(item === 1 ? '#9C27B0' : item === 2 ? '#FF6B6B' : '#4CAF50')
          .borderRadius(12)
          .justifyContent(FlexAlign.Center)
        }, (item: number) => item.toString())
      }
      .width('100%')
      .height(120)
      .vertical(true)
      .loop(false)
      .indicator(false)

      // 说明
      Column({ space: 8 }) {
        Text('纵向配置:')
          .fontSize(14)
          .fontColor('#666')

        Text('• vertical: true - 纵向滑动')
          .fontSize(12)
          .fontColor('#999')

        Text('• loop: false - 不循环')
          .fontSize(12)
          .fontColor('#999')

        Text('• indicator: false - 隐藏指示器')
          .fontSize(12)
          .fontColor('#999')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F3E5F5')
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
  CustomIndicatorSwiper() {
    Column({ space: 12 }) {
      Text('Swiper 自定义指示器')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('使用数字指示器显示当前页码')
        .fontSize(14)
        .fontColor('#666')

      // 自定义指示器 Swiper
      Swiper() {
        ForEach([1, 2, 3, 4, 5], (item: number) => {
          Column() {
            Text(`内容 ${item}`)
              .fontSize(28)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .height(180)
          .backgroundColor(item === 1 ? '#E91E63' : item === 2 ? '#9C27B0' : item === 3 ? '#673AB7' : item === 4 ? '#3F51B5' : '#2196F3')
          .borderRadius(12)
          .justifyContent(FlexAlign.Center)
        }, (item: number) => item.toString())
      }
      .width('100%')
      .height(180)
      .loop(true)
      .indicator(
        new DotIndicator()
          .itemWidth(8)
          .itemHeight(8)
          .selectedItemWidth(20)
          .selectedItemHeight(8)
          .color('#FFFFFF')
          .selectedColor('#FF4081')
      )

      // 说明
      Column({ space: 8 }) {
        Text('自定义指示器配置:')
          .fontSize(14)
          .fontColor('#666')

        Text('• itemWidth/itemHeight - 普通点大小')
          .fontSize(12)
          .fontColor('#999')

        Text('• selectedItemWidth/Height - 选中点大小')
          .fontSize(12)
          .fontColor('#999')

        Text('• color/selectedColor - 颜色设置')
          .fontSize(12)
          .fontColor('#999')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#FCE4EC')
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
  ManualControlSwiper() {
    Column({ space: 12 }) {
      Text('Swiper 手动控制')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('通过按钮控制轮播翻页')
        .fontSize(14)
        .fontColor('#666')

      // 手动控制 Swiper
      Swiper(this.swiperController) {
        ForEach(['A', 'B', 'C'], (item: string) => {
          Column() {
            Text(`页面 ${item}`)
              .fontSize(32)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .height(150)
          .backgroundColor(item === 'A' ? '#009688' : item === 'B' ? '#FF9800' : '#795548')
          .borderRadius(12)
          .justifyContent(FlexAlign.Center)
        }, (item: string) => item)
      }
      .width('100%')
      .height(150)
      .loop(false)
      .indicator(false)
      .onChange((index: number) => {
        this.customIndex = index
      })

      // 当前页码
      Text(`当前页码: ${this.customIndex + 1} / 3`)
        .fontSize(14)
        .fontColor('#666')
        .width('100%')
        .textAlign(TextAlign.Center)
        .margin({ top: 8 })

      // 控制按钮
      Row({ space: 12 }) {
        Button('上一页')
          .fontSize(14)
          .width('48%')
          .height(40)
          .backgroundColor('#009688')
          .borderRadius(8)
          .onClick(() => {
            this.swiperController.showPrevious()
          })

        Button('下一页')
          .fontSize(14)
          .width('48%')
          .height(40)
          .backgroundColor('#FF9800')
          .borderRadius(8)
          .onClick(() => {
            this.swiperController.showNext()
          })
      }
      .width('100%')
      .margin({ top: 12 })

      // 说明
      Column({ space: 8 }) {
        Text('手动控制:')
          .fontSize(14)
          .fontColor('#666')

        Text('• SwiperController - 控制器对象')
          .fontSize(12)
          .fontColor('#999')

        Text('• showPrevious() - 上一页')
          .fontSize(12)
          .fontColor('#999')

        Text('• showNext() - 下一页')
          .fontSize(12)
          .fontColor('#999')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#E0F2F1')
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
