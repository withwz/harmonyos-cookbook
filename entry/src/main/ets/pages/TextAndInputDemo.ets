import router from '@ohos.router'

/**
 * 文本与输入组件演示
 * 展示 Text、TextInput、TextArea、Search、Span 等组件的用法
 */

@Entry
@Component
struct TextAndInputDemo {
  // 输入框状态
  @State inputText: string = ''
  @State textAreaText: string = ''
  @State searchText: string = ''
  @State passwordText: string = ''
  @State numberText: string = ''

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.Header()

        // Text 文本显示
        this.TextSection()

        // TextInput 单行输入
        this.TextInputSection()

        // TextInput 高级用法
        this.TextInputAdvancedSection()

        // TextArea 多行输入
        this.TextAreaSection()

        // Search 搜索框
        this.SearchSection()

        // Span 富文本
        this.SpanSection()

        this.TipCard('文本与输入组件要点：掌握各种文本样式和输入验证')
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

      Text('文本与输入组件')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .margin({ right: 40 })
    }
    .width('100%')
  }

  @Builder
  TextSection() {
    Column({ space: 12 }) {
      Text('Text 文本显示')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 基础文本
      Text('这是普通文本')
        .fontSize(16)

      // 粗体文本
      Text('这是粗体文本')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      // 斜体文本
      Text('这是斜体文本')
        .fontSize(16)
        .fontStyle(FontStyle.Italic)

      // 带颜色文本
      Text('这是蓝色文本')
        .fontSize(16)
        .fontColor('#007DFF')

      // 带装饰线文本
      Text('这是带删除线的文本')
        .fontSize(16)
        .decoration({ type: TextDecorationType.LineThrough })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  TextInputSection() {
    Column({ space: 12 }) {
      Text('TextInput 单行输入')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 普通输入框
      TextInput({ placeholder: '请输入内容' })
        .fontSize(16)
        .height(48)
        .backgroundColor('#F8F8F8')
        .borderRadius(8)
        .onChange((value: string) => {
          this.inputText = value
        })

      // 显示输入内容
      if (this.inputText) {
        Text(`输入内容: ${this.inputText}`)
          .fontSize(14)
          .fontColor('#007DFF')
          .width('100%')
          .padding(12)
          .backgroundColor('#E6F7FF')
          .borderRadius(8)
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  TextAreaSection() {
    Column({ space: 12 }) {
      Text('TextArea 多行输入')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 多行输入框
      TextArea({ placeholder: '请输入多行内容' })
        .fontSize(16)
        .height(100)
        .backgroundColor('#F8F8F8')
        .borderRadius(8)
        .onChange((value: string) => {
          this.textAreaText = value
        })

      // 显示输入内容
      if (this.textAreaText) {
        Text(`输入内容: ${this.textAreaText}`)
          .fontSize(14)
          .fontColor('#007DFF')
          .width('100%')
          .padding(12)
          .backgroundColor('#E6F7FF')
          .borderRadius(8)
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  TextInputAdvancedSection() {
    Column({ space: 12 }) {
      Text('TextInput 高级用法')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 密码输入框
      TextInput({ placeholder: '请输入密码' })
        .type(InputType.Password)
        .fontSize(16)
        .height(48)
        .backgroundColor('#F8F8F8')
        .borderRadius(8)
        .showPasswordIcon(true)
        .onChange((value: string) => {
          this.passwordText = value
        })

      // 数字输入框
      TextInput({ placeholder: '请输入数字' })
        .type(InputType.Number)
        .fontSize(16)
        .height(48)
        .backgroundColor('#F8F8F8')
        .borderRadius(8)
        .onChange((value: string) => {
          this.numberText = value
        })

      // 显示密码长度
      if (this.passwordText) {
        Text(`密码长度: ${this.passwordText.length}`)
          .fontSize(14)
          .fontColor('#007DFF')
          .width('100%')
          .padding(12)
          .backgroundColor('#E6F7FF')
          .borderRadius(8)
      }

      // 显示数字
      if (this.numberText) {
        Text(`输入数字: ${this.numberText}`)
          .fontSize(14)
          .fontColor('#007DFF')
          .width('100%')
          .padding(12)
          .backgroundColor('#E6F7FF')
          .borderRadius(8)
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  SearchSection() {
    Column({ space: 12 }) {
      Text('Search 搜索框')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // 搜索框
      Search({ value: this.searchText, placeholder: '请输入搜索内容' })
        .searchButton('搜索')
        .backgroundColor('#F8F8F8')
        .borderRadius(8)
        .onChange((value: string) => {
          this.searchText = value
        })
        .onSubmit(() => {
          console.info('搜索: ' + this.searchText)
        })

      // 显示搜索内容
      if (this.searchText) {
        Text(`搜索关键词: ${this.searchText}`)
          .fontSize(14)
          .fontColor('#007DFF')
          .width('100%')
          .padding(12)
          .backgroundColor('#E6F7FF')
          .borderRadius(8)
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  SpanSection() {
    Column({ space: 12 }) {
      Text('Span 富文本片段')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      // Span 示例
      Text() {
        Span('这是红色')
          .fontSize(16)
          .fontColor('#FF4D4F')
        Span('加粗')
          .fontSize(16)
          .fontColor('#007DFF')
          .fontWeight(FontWeight.Bold)
        Span('斜体')
          .fontSize(16)
          .fontColor('#52C41A')
          .fontStyle(FontStyle.Italic)
        Span('文本')
          .fontSize(16)
          .fontColor('#333333')
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
