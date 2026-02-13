import router from '@ohos.router'

/**
 * Toggle 开关组件演示
 */

@Entry
@Component
struct ToggleDemo {
  @State isOn: boolean = false
  @State switchType: ToggleType = ToggleType.Switch

  build() {
    Column() {
      Row() {
        this.Header()
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20 })

      Scroll() {
        Column({ space: 20 }) {
          this.ToggleSection()
          this.TipCard('Toggle要点：用于二状态开关切换')
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

      Text('开关组件')
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
  ToggleSection() {
    Column({ space: 12 }) {
      Text('Toggle 开关')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('用于二状态切换')
        .fontSize(14)
        .fontColor('#666')

      // Switch 类型
      Column({ space: 16 }) {
        Text('Switch 样式:')
          .fontSize(14)
          .fontColor('#666')
          .width('100%')

        Row() {
          Text('状态: ' + (this.isOn ? '开' : '关'))
            .fontSize(16)
            .fontColor('#333')

          Blank()

          Toggle({ type: ToggleType.Switch, isOn: this.isOn })
            .selectedColor('#007DFF')
            .onChange((isOn: boolean) => {
              this.isOn = isOn
            })
        }
        .width('100%')
        .height(60)
        .padding({ left: 16, right: 16 })
        .backgroundColor('#F8F8F8')
        .borderRadius(8)
      }
      .width('100%')

      // Checkbox 类型
      Row() {
        Text('同意协议')
          .fontSize(16)
          .fontColor('#333')

        Blank()

        Toggle({ type: ToggleType.Checkbox, isOn: this.isOn })
          .selectedColor('#007DFF')
          .onChange((isOn: boolean) => {
            this.isOn = isOn
          })
      }
      .width('100%')
      .height(50)
      .padding({ left: 16, right: 16 })
      .backgroundColor('#F8F8F8')
        .borderRadius(8)

      // Button 类型
      Row() {
        Text('模式: ' + (this.switchType === ToggleType.Switch ? 'Switch' : 'Checkbox'))
          .fontSize(16)
          .fontColor('#333')

        Blank()

        Button('切换类型')
          .fontSize(14)
          .onClick(() => {
            this.switchType = this.switchType === ToggleType.Switch ? ToggleType.Checkbox : ToggleType.Switch
          })
      }
      .width('100%')
      .height(50)
      .padding({ left: 16, right: 16 })
      .backgroundColor('#E6F7FF')
        .borderRadius(8)

      // 说明
      Column({ space: 8 }) {
        Text('类型说明:')
          .fontSize(14)
          .fontColor('#666')

        Text('• Switch - 开关滑块样式')
          .fontSize(12)
          .fontColor('#999')

        Text('• Checkbox - 复选框样式')
          .fontSize(12)
          .fontColor('#999')

        Text('• Button - 按钮样式')
          .fontSize(12)
          .fontColor('#999')

        Text('• 常用于设置项、协议同意')
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
