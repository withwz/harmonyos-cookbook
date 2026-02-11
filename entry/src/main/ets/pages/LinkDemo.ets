import router from '@ohos.router'

/**
 * @Link 装饰器演示
 */

// ==================== 子组件1：双向计数器 ====================
@Component
struct CounterComponent {
  @Link count: number

  build() {
    Column({ space: 10 }) {
      Text(`当前值: ${this.count}`)
        .fontSize(20)

      Row({ space: 10 }) {
        Button('-')
          .width(50)
          .onClick(() => {
            this.count--
          })

        Button('+')
          .width(50)
          .onClick(() => {
            this.count++
          })
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor('#F8F8F8')
    .borderRadius(12)
  }
}

// ==================== 子组件2：开关控制 ====================
@Component
struct ToggleSwitch {
  @Link isEnabled: boolean

  build() {
    Row() {
      Text(this.isEnabled ? '已开启' : '已关闭')
        .fontSize(16)
        .fontColor(this.isEnabled ? '#52C41A' : '#999')
        .layoutWeight(1)

      Toggle({ type: ToggleType.Switch, isOn: this.isEnabled })
        .selectedColor('#007DFF')
        .onChange((isOn: boolean) => {
          this.isEnabled = isOn
        })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }
}

// ==================== 子组件3：滑动条 ====================
@Component
struct SliderControl {
  @Link value: number

  build() {
    Column({ space: 8 }) {
      Text(`进度: ${Math.round(this.value)}%`)
        .fontSize(14)
        .fontColor('#666')

      Slider({
        value: this.value,
        min: 0,
        max: 100,
        step: 1,
        style: SliderStyle.OutSet
      })
        .blockColor('#007DFF')
        .trackColor('#E6E6E6')
        .selectedColor('#007DFF')
        .showSteps(false)
        .onChange((value: number) => {
          this.value = value
        })
    }
    .width('100%')
    .padding(16)
    .backgroundColor('#F8F8F8')
    .borderRadius(12)
  }
}

// ==================== 主页面 ====================
@Entry
@Component
struct LinkDemo {
  @State count: number = 0
  @State isEnabled: boolean = false
  @State sliderValue: number = 50
  @State taskText: string = '完成鸿蒙学习'
  @State taskDone: boolean = false

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.BackButton()
        this.SectionTitle('@Link 装饰器演示')
        this.InfoCard('@Link 实现父子组件双向数据绑定，子组件修改会同步到父组件')

        // 示例1：双向计数器
        this.CounterSection()

        // 示例2：双向开关
        this.ToggleSection()

        // 示例3：双向滑动条
        this.SliderSection()

        this.CompareCard()
        this.TipCard('@Link 要点：双向绑定、使用$传递、子组件修改同步父组件')
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  CounterSection() {
    Column({ space: 12 }) {
      Text(`父组件显示的值: ${this.count}`)
        .fontSize(14)
        .fontColor('#666')
        .width('100%')

      CounterComponent({ count: $count })

      Text('点击子组件的按钮，父组件的值也会变化')
        .fontSize(12)
        .fontColor('#999')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  ToggleSection() {
    Column({ space: 12 }) {
      Row() {
        Text('父组件状态:')
          .fontSize(14)
          .fontColor('#666')

        Text(this.isEnabled ? '开启' : '关闭')
          .fontSize(14)
          .fontColor(this.isEnabled ? '#52C41A' : '#999')
          .margin({ left: 8 })
      }

      ToggleSwitch({ isEnabled: $isEnabled })

      Button('父组件切换')
        .onClick(() => {
          this.isEnabled = !this.isEnabled
        })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  SliderSection() {
    Column({ space: 12 }) {
      Text(`父组件显示: ${Math.round(this.sliderValue)}%`)
        .fontSize(14)
        .fontColor('#666')

      SliderControl({ value: $sliderValue })

      Row({ space: 8 }) {
        Button('0%')
          .fontSize(12)
          .onClick(() => {
            this.sliderValue = 0
          })

        Button('50%')
          .fontSize(12)
          .onClick(() => {
            this.sliderValue = 50
          })

        Button('100%')
          .fontSize(12)
          .onClick(() => {
            this.sliderValue = 100
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
  CompareCard() {
    Column({ space: 8 }) {
      Text('@Prop vs @Link 对比')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)

      Row({ space: 8 }) {
        Column({ space: 4 }) {
          Text('@Prop')
            .fontSize(12)
            .fontColor('#007DFF')
          Text('父→子')
            .fontSize(10)
            .fontColor('#666')
          Text('只读')
            .fontSize(10)
            .fontColor('#666')
        }
        .padding(8)
        .backgroundColor('#E6F7FF')
        .borderRadius(8)
        .layoutWeight(1)

        Column({ space: 4 }) {
          Text('@Link')
            .fontSize(12)
            .fontColor('#52C41A')
          Text('双向')
            .fontSize(10)
            .fontColor('#666')
          Text('可修改')
            .fontSize(10)
            .fontColor('#666')
        }
        .padding(8)
        .backgroundColor('#F6FFED')
        .borderRadius(8)
        .layoutWeight(1)
      }
    }
    .width('100%')
    .padding(12)
    .backgroundColor(Color.White)
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
      .margin({ top: 10 })
  }
}
