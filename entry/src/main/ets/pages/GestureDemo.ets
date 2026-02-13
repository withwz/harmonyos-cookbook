import router from '@ohos.router'

/**
 * 手势组件演示
 * 展示 TapGesture、LongPressGesture、PanGesture 等手势的用法
 */

@Entry
@Component
struct GestureDemo {
  @State tapCount: number = 0
  @State longPressMessage: string = ''
  @State panOffset: string = '{ x: 0, y: 0 }'
  @State scaleValue: number = 1

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.Header()

        // TapGesture 点击手势
        this.TapGestureSection()

        // LongPressGesture 长按手势
        this.LongPressGestureSection()

        // PanGesture 拖动手势
        this.PanGestureSection()

        // PinchGesture 缩放手势
        this.PinchGestureSection()

        this.TipCard('手势组件要点：掌握各种手势事件的监听和处理')
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

      Text('手势组件')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .margin({ right: 40 })
    }
    .width('100%')
  }

  @Builder
  TapGestureSection() {
    Column({ space: 12 }) {
      Text('TapGesture 点击手势')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 点击区域
      Column() {
        Text('点击我')
          .fontSize(20)
          .fontColor(Color.White)
      }
      .width('100%')
      .height(100)
      .backgroundColor('#007DFF')
      .borderRadius(12)
      .justifyContent(FlexAlign.Center)
      .gesture(
        TapGesture()
          .onAction(() => {
            this.tapCount++
          })
      )

      // 显示点击次数
      Text(`点击次数: ${this.tapCount}`)
        .fontSize(14)
        .fontColor('#007DFF')
        .width('100%')
        .textAlign(TextAlign.Center)
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
  LongPressGestureSection() {
    Column({ space: 12 }) {
      Text('LongPressGesture 长按手势')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 长按区域
      Column() {
        Text(this.longPressMessage || '长按我')
          .fontSize(20)
          .fontColor(Color.White)
      }
      .width('100%')
      .height(100)
      .backgroundColor('#52C41A')
      .borderRadius(12)
      .justifyContent(FlexAlign.Center)
      .gesture(
        LongPressGesture()
          .onAction(() => {
            this.longPressMessage = '长按触发！'
          })
      )

      // 重置按钮
      if (this.longPressMessage) {
        Button('重置')
          .fontSize(14)
          .onClick(() => {
            this.longPressMessage = ''
          })
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  PanGestureSection() {
    Column({ space: 12 }) {
      Text('PanGesture 拖动手势')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 拖动区域
      Column() {
        Text(`拖动我\n${this.panOffset}`)
          .fontSize(16)
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .height(100)
      .backgroundColor('#FAAD14')
      .borderRadius(12)
      .justifyContent(FlexAlign.Center)
      .gesture(
        PanGesture()
          .onActionUpdate((event: GestureEvent) => {
            this.panOffset = `{ x: ${Math.round(event.offsetX)}, y: ${Math.round(event.offsetY)} }`
          })
      )
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  PinchGestureSection() {
    Column({ space: 12 }) {
      Text('PinchGesture 缩放手势')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 缩放区域
      Column() {
        Text(`缩放: ${(this.scaleValue * 100).toFixed(0)}%`)
          .fontSize(20)
          .fontColor(Color.White)
      }
      .width('100%')
      .height(100)
      .backgroundColor('#FF6B6B')
      .borderRadius(12)
      .justifyContent(FlexAlign.Center)
      .gesture(
        PinchGesture()
          .onActionUpdate((event: GestureEvent) => {
            this.scaleValue = event.scale
          })
      )

      // 重置按钮
      if (this.scaleValue !== 1) {
        Button('重置')
          .fontSize(14)
          .onClick(() => {
            this.scaleValue = 1
          })
      }
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
