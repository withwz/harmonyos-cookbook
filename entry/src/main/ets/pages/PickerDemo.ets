import router from '@ohos.router'

/**
 * Picker 选择器演示
 * 展示基础选择器用法
 */

@Entry
@Component
struct PickerDemo {
  @State selectedOption: number = 0
  @State options: Array<string> = ['选项1', '选项2', '选项3', '选项4', '选项5']

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.Header()

        // 选择器演示
        this.PickerSection()

        this.TipCard('选择器要点：掌握各种选择组件的使用')
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

      Text('选择器')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .margin({ right: 40 })
    }
    .width('100%')
  }

  @Builder
  PickerSection() {
    Column({ space: 12 }) {
      Text('基础选择器')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('从预定义选项中选择')
        .fontSize(14)
        .fontColor('#666')

      // 选项列表展示
      Column({ space: 8 }) {
        ForEach(this.options, (option: string, index: number) => {
          Row() {
            Text(option)
              .fontSize(16)
              .fontColor(this.selectedOption === index ? '#007DFF' : '#333')
              .layoutWeight(1)

            if (this.selectedOption === index) {
              Text('✓')
                .fontSize(16)
                .fontColor('#007DFF')
            }
          }
          .width('100%')
          .height(50)
          .padding({ left: 16, right: 16 })
          .backgroundColor(this.selectedOption === index ? '#E6F7FF' : '#F8F8F8')
          .borderRadius(8)
          .onClick(() => {
            this.selectedOption = index
          })
        }, (option: string, index: number) => index.toString())
      }
      .width('100%')

      // 显示当前选择
      Text(`当前选择: ${this.options[this.selectedOption]}`)
        .fontSize(14)
        .fontColor('#007DFF')
        .width('100%')
        .textAlign(TextAlign.Center)
        .margin({ top: 8 })

      // 说明
      Column({ space: 8 }) {
        Text('选择器类型:')
          .fontSize(14)
          .fontColor('#666')

        Text('• Select - 下拉选择器 (见按钮Demo)')
          .fontSize(12)
          .fontColor('#999')

        Text('• DatePicker - 日期选择器')
          .fontSize(12)
          .fontColor('#999')

        Text('• TimePicker - 时间选择器')
          .fontSize(12)
          .fontColor('#999')

        Text('• TextPicker - 文本选择器')
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
