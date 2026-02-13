import router from '@ohos.router'

/**
 * 按钮与选择组件演示
 * 展示 Button、Toggle、Checkbox、Radio、Slider、Select、DatePicker、TimePicker 的用法
 */

@Entry
@Component
struct ButtonAndSelectDemo {
  // Button 相关状态
  @State buttonText: string = '点击我'
  @State clickCount: number = 0

  // Toggle 相关状态
  @State toggleOn: boolean = false
  @State switchOn: boolean = false
  @State checkboxOn: boolean = false

  // Checkbox 多选状态
  @State selectedHobbies: Array<string> = []

  // Radio 单选状态
  @State selectedGender: string = 'male'

  // Slider 滑动条状态
  @State sliderValue: number = 50
  @State volumeValue: number = 30

  // Select 下拉选择状态
  @State selectIndex: number = 0
  @State selectedCity: string = '北京'

  // DatePicker 日期选择状态
  @State selectedDate: Date = new Date()

  // TimePicker 时间选择状态
  @State selectedTime: Date = new Date()

  // 可选城市列表
  private cities: Array<string> = ['北京', '上海', '广州', '深圳', '杭州']

  // 爱好列表
  private hobbies: Array<string> = ['阅读', '运动', '音乐', '旅行', '游戏']

  aboutToAppear() {
    this.selectedHobbies = []
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.Header()

        // Button 演示
        this.ButtonSection()

        // Toggle 演示
        this.ToggleSection()

        // Checkbox 演示
        this.CheckboxSection()

        // Radio 演示
        this.RadioSection()

        // Slider 演示
        this.SliderSection()

        // Select 演示
        this.SelectSection()

        // DatePicker 演示
        this.DatePickerSection()

        // TimePicker 演示
        this.TimePickerSection()

        this.TipCard('按钮与选择组件要点：掌握各种交互组件的状态管理和事件处理')
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  // ==================== 头部 ====================

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

      Text('按钮与选择组件')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .margin({ right: 40 })
    }
    .width('100%')
  }

  // ==================== Button 按钮 ====================

  @Builder
  ButtonSection() {
    Column({ space: 12 }) {
      Text('Button 按钮')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 普通按钮
      Column({ space: 8 }) {
        Text('普通按钮类型')
          .fontSize(14)
          .fontColor('#666')

        Row({ space: 12 }) {
          Button('普通按钮')
            .fontSize(14)

          Button('胶囊按钮')
            .fontSize(14)
            .type(ButtonType.Capsule)

          Button('圆形按钮')
            .fontSize(14)
            .type(ButtonType.Circle)
            .width(50)
            .height(50)
        }
        .width('100%')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 不同状态按钮
      Column({ space: 8 }) {
        Text('按钮状态')
          .fontSize(14)
          .fontColor('#666')

        Row({ space: 12 }) {
          Button('普通')
            .fontSize(14)
            .enabled(true)

          Button('禁用')
            .fontSize(14)
            .enabled(false)

          Button('点击次数: ' + this.clickCount)
            .fontSize(14)
            .backgroundColor('#007DFF')
            .onClick(() => {
              this.clickCount++
            })
        }
        .width('100%')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 自定义样式按钮
      Column({ space: 8 }) {
        Text('自定义样式')
          .fontSize(14)
          .fontColor('#666')

        Row({ space: 12 }) {
          Button('主要')
            .fontSize(14)
            .backgroundColor('#007DFF')
            .borderRadius(8)

          Button('成功')
            .fontSize(14)
            .backgroundColor('#52C41A')
            .borderRadius(8)

          Button('警告')
            .fontSize(14)
            .backgroundColor('#FAAD14')
            .borderRadius(8)

          Button('危险')
            .fontSize(14)
            .backgroundColor('#FF4D4F')
            .borderRadius(8)
        }
        .width('100%')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  // ==================== Toggle 开关 ====================

  @Builder
  ToggleSection() {
    Column({ space: 12 }) {
      Text('Toggle 开关')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // Toggle 类型
      Row({ space: 24 }) {
        // Checkbox 类型
        Column({ space: 8 }) {
          Toggle({ type: ToggleType.Checkbox, isOn: this.checkboxOn })
            .selectedColor('#007DFF')
            .onChange((isOn: boolean) => {
              this.checkboxOn = isOn
            })
          Text('Checkbox')
            .fontSize(12)
            .fontColor('#666')
        }

        // Switch 类型
        Column({ space: 8 }) {
          Toggle({ type: ToggleType.Switch, isOn: this.switchOn })
            .selectedColor('#007DFF')
            .onChange((isOn: boolean) => {
              this.switchOn = isOn
            })
          Text('Switch')
            .fontSize(12)
            .fontColor('#666')
        }

        // Button 类型
        Column({ space: 8 }) {
          Toggle({ type: ToggleType.Button, isOn: this.toggleOn })
            .selectedColor('#007DFF')
            .onChange((isOn: boolean) => {
              this.toggleOn = isOn
            })
          Text('Button')
            .fontSize(12)
            .fontColor('#666')
        }
      }
      .width('100%')
      .padding(20)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 状态显示
      Row() {
        Text('当前状态: ')
          .fontSize(14)
          .fontColor('#666')
        Text(`Checkbox: ${this.checkboxOn}, Switch: ${this.switchOn}, Button: ${this.toggleOn}`)
          .fontSize(14)
          .fontColor('#007DFF')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#E6F7FF')
      .borderRadius(8)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  // ==================== Checkbox 多选框 ====================

  @Builder
  CheckboxSection() {
    Column({ space: 12 }) {
      Text('Checkbox 多选框')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('选择你的爱好（可多选）:')
        .fontSize(14)
        .fontColor('#666')

      // 爱好选择
      Column({ space: 12 }) {
        ForEach(this.hobbies, (hobby: string) => {
          Row() {
            Checkbox({ name: hobby })
              .select(this.selectedHobbies.includes(hobby))
              .selectedColor('#007DFF')
              .onChange((isSelected: boolean) => {
                if (isSelected) {
                  this.selectedHobbies.push(hobby)
                } else {
                  const index = this.selectedHobbies.indexOf(hobby)
                  if (index > -1) {
                    const newHobbies: string[] = []
                    for (let i = 0; i < this.selectedHobbies.length; i++) {
                      if (i !== index) {
                        newHobbies.push(this.selectedHobbies[i])
                      }
                    }
                    this.selectedHobbies = newHobbies
                  }
                }
              })

            Text(hobby)
              .fontSize(16)
              .margin({ left: 8 })
          }
          .width('100%')
        })
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 选中结果
      if (this.selectedHobbies.length > 0) {
        Text(`已选择: ${this.selectedHobbies.join(', ')}`)
          .fontSize(14)
          .fontColor('#52C41A')
          .width('100%')
          .padding(12)
          .backgroundColor('#F6FFED')
          .borderRadius(8)
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  // ==================== Radio 单选框 ====================

  @Builder
  RadioSection() {
    Column({ space: 12 }) {
      Text('Radio 单选框')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('选择性别:')
        .fontSize(14)
        .fontColor('#666')

      // 性别选择
      Row({ space: 24 }) {
        Row({ space: 8 }) {
          Radio({ value: 'male', group: 'gender' })
            .checked(this.selectedGender === 'male')
            .onChange((isChecked: boolean) => {
              if (isChecked) {
                this.selectedGender = 'male'
              }
            })

          Text('男')
            .fontSize(16)
        }

        Row({ space: 8 }) {
          Radio({ value: 'female', group: 'gender' })
            .checked(this.selectedGender === 'female')
            .onChange((isChecked: boolean) => {
              if (isChecked) {
                this.selectedGender = 'female'
              }
            })

          Text('女')
            .fontSize(16)
        }
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 选中结果
      Text(`已选择: ${this.selectedGender === 'male' ? '男' : '女'}`)
        .fontSize(14)
        .fontColor('#007DFF')
        .width('100%')
        .padding(12)
        .backgroundColor('#E6F7FF')
        .borderRadius(8)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  // ==================== Slider 滑动条 ====================

  @Builder
  SliderSection() {
    Column({ space: 12 }) {
      Text('Slider 滑动条')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 进度条示例
      Column({ space: 8 }) {
        Row() {
          Text('进度')
            .fontSize(14)
            .fontColor('#666')

          Text(`${Math.round(this.sliderValue)}%`)
            .fontSize(14)
            .fontColor('#007DFF')
            .margin({ left: 'auto' })
        }
        .width('100%')

        Slider({
          value: this.sliderValue,
          min: 0,
          max: 100,
          step: 1
        })
          .width('100%')
          .trackColor('#E6E6E6')
          .selectedColor('#007DFF')
          .showSteps(true)
          .onChange((value: number) => {
            this.sliderValue = value
          })
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 音量控制示例
      Column({ space: 8 }) {
        Row() {
          Text('🔊')
            .fontSize(20)

          Text(`${Math.round(this.volumeValue)}`)
            .fontSize(14)
            .fontColor('#007DFF')
            .margin({ left: 'auto' })
        }
        .width('100%')

        Slider({
          value: this.volumeValue,
          min: 0,
          max: 100,
          step: 1
        })
          .width('100%')
          .trackColor('#E6E6E6')
          .selectedColor('#52C41A')
          .blockColor('#52C41A')
          .onChange((value: number) => {
            this.volumeValue = value
          })
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  // ==================== Select 下拉选择 ====================

  @Builder
  SelectSection() {
    Column({ space: 12 }) {
      Text('Select 下拉选择')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 城市选择
      Column({ space: 8 }) {
        Text('选择城市')
          .fontSize(14)
          .fontColor('#666')

        Select([
          { value: '北京' },
          { value: '上海' },
          { value: '广州' },
          { value: '深圳' },
          { value: '杭州' }
        ])
          .selected(this.selectIndex)
          .value('请选择城市')
          .font({ size: 16 })
          .selectedOptionFont({ size: 16 })
          .optionFont({ size: 16 })
          .onSelect((index: number, value: string) => {
            this.selectIndex = index
            this.selectedCity = value
          })

        // 选中结果
        if (this.selectedCity) {
          Text(`已选择: ${this.selectedCity}`)
            .fontSize(14)
            .fontColor('#007DFF')
            .margin({ top: 8 })
        }
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  // ==================== DatePicker 日期选择 ====================

  @Builder
  DatePickerSection() {
    Column({ space: 12 }) {
      Text('DatePicker 日期选择')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 日期选择器
      DatePicker({
        start: new Date('2000-01-01'),
        end: new Date('2030-12-31'),
        selected: this.selectedDate
      })
        .onChange((value: DatePickerResult) => {
          const year = value.year ?? 2000
          const month = value.month ?? 0
          const day = value.day ?? 1
          this.selectedDate = new Date(year, month, day)
        })

      // 选中结果显示
      Text(`已选择日期: ${this.selectedDate.getFullYear()}-${(this.selectedDate.getMonth() + 1).toString().padStart(2, '0')}-${this.selectedDate.getDate().toString().padStart(2, '0')}`)
        .fontSize(14)
        .fontColor('#007DFF')
        .width('100%')
        .textAlign(TextAlign.Center)
        .padding(12)
        .backgroundColor('#E6F7FF')
        .borderRadius(8)
        .margin({ top: 8 })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  // ==================== TimePicker 时间选择 ====================

  @Builder
  TimePickerSection() {
    Column({ space: 12 }) {
      Text('TimePicker 时间选择')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 时间选择器
      TimePicker({
        selected: this.selectedTime
      })
        .onChange((value: TimePickerResult) => {
          this.selectedTime = new Date(value.hour, value.minute)
        })

      // 选中结果显示
      Text(`已选择时间: ${this.selectedTime.getHours().toString().padStart(2, '0')}:${this.selectedTime.getMinutes().toString().padStart(2, '0')}`)
        .fontSize(14)
        .fontColor('#007DFF')
        .width('100%')
        .textAlign(TextAlign.Center)
        .padding(12)
        .backgroundColor('#E6F7FF')
        .borderRadius(8)
        .margin({ top: 8 })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  // ==================== 提示卡片 ====================

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
