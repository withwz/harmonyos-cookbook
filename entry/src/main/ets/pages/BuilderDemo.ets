import router from '@ohos.router'

/**
 * @Builder 装饰器演示
 */

// 定义按钮类型
type ButtonType = 'primary' | 'success' | 'warning'

// ==================== 全局 @Builder 函数 ====================
@Builder
function StyledButton(text: string, type: ButtonType, onClick: () => void) {
  Button(text)
    .fontSize(16)
    .height(44)
    .backgroundColor(type === 'primary' ? '#007DFF' : type === 'success' ? '#52C41A' : '#FAAD14')
    .borderRadius(8)
    .width('100%')
    .onClick(onClick)
}

// 定义用户卡片参数接口
interface UserProfileParams {
  name: string
  avatar: string
  bio: string
}

// ==================== 用户信息卡片构建函数 ====================
@Builder
function UserProfileCard(params: UserProfileParams) {
  Row({ space: 12 }) {
    Text(params.avatar)
      .fontSize(40)
      .width(60)
      .height(60)
      .backgroundColor('#E6E6E6')
      .borderRadius(30)
      .textAlign(TextAlign.Center)

    Column({ space: 4 }) {
      Text(params.name)
        .fontSize(18)
        .fontWeight(FontWeight.Medium)

      Text(params.bio)
        .fontSize(14)
        .fontColor('#666')
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .alignItems(HorizontalAlign.Start)
    .layoutWeight(1)
  }
  .width('100%')
  .padding(16)
  .backgroundColor(Color.White)
  .borderRadius(12)
  .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
}

// 定义待办项接口
interface TodoItem {
  title: string
  done: boolean
}

// ==================== 主页面 ====================
@Entry
@Component
struct BuilderDemo {
  @State count: number = 0
  @State isLoading: boolean = false
  @State message: string = ''
  @State todoList: Array<TodoItem> = []

  aboutToAppear() {
    this.todoList = [
      { title: '学习 @State', done: true },
      { title: '学习 @Prop', done: true },
      { title: '学习 @Link', done: true },
      { title: '学习 @ObjectLink', done: false },
      { title: '学习 @Builder', done: false }
    ]
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.BackButton()
        this.SectionTitle('@Builder 装饰器演示')
        this.InfoCard('@Builder 将重复 UI 封装成可复用的构建函数，提高代码复用性')

        // 示例1：全局 @Builder
        this.GlobalBuilderSection()

        // 示例2：组件内 @Builder
        this.LocalBuilderSection()

        // 示例3：带参数的 @Builder
        this.ParamsBuilderSection()

        // 示例4：条件渲染
        this.ConditionalBuilderSection()

        // 示例5：列表项复用
        this.ListItemBuilderSection()

        this.BestPracticeCard()
        this.TipCard('@Builder 要点：封装重复 UI、支持参数、全局/局部定义')
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  GlobalBuilderSection() {
    Column({ space: 12 }) {
      Text('使用全局定义的 StyledButton 函数')
        .fontSize(14)
        .fontColor('#666')

      StyledButton('主要按钮', 'primary', () => {
        this.message = '点击了主要按钮'
      })

      StyledButton('成功按钮', 'success', () => {
        this.message = '点击了成功按钮'
      })

      StyledButton('警告按钮', 'warning', () => {
        this.message = '点击了警告按钮'
      })

      if (this.message) {
        Text(this.message)
          .fontSize(14)
          .fontColor('#007DFF')
          .padding(8)
          .backgroundColor('#E6F7FF')
          .borderRadius(6)
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  LocalBuilderSection() {
    Column({ space: 12 }) {
      Text('使用组件内定义的 StatCard 函数')
        .fontSize(14)
        .fontColor('#666')

      Row({ space: 12 }) {
        this.StatCard('访问量', '1,234', '#007DFF')
        this.StatCard('点赞数', '567', '#FF6B6B')
        this.StatCard('评论数', '89', '#52C41A')
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  ParamsBuilderSection() {
    Column({ space: 12 }) {
      UserProfileCard({
        name: '张三',
        avatar: '👤',
        bio: '热爱编程，喜欢鸿蒙开发'
      })

      UserProfileCard({
        name: '李四',
        avatar: '👩',
        bio: 'UI 设计师，擅长 ArkUI 设计'
      })

      UserProfileCard({
        name: '王五',
        avatar: '🧑',
        bio: '全栈工程师，React Native 和鸿蒙都会'
      })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  ConditionalBuilderSection() {
    Column({ space: 12 }) {
      Row({ space: 12 }) {
        Button('加载中')
          .onClick(() => {
            this.isLoading = true
          })

        Button('完成')
          .onClick(() => {
            this.isLoading = false
          })
      }

      this.StatusView()
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  ListItemBuilderSection() {
    Column({ space: 12 }) {
      ForEach(this.todoList, (item: TodoItem) => {
        this.ListItemView(item)
      }, (item: TodoItem) => item.title)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  // ==================== 组件内 @Builder 函数 ====================

  @Builder
  StatCard(label: string, value: string, color: string) {
    Column({ space: 8 }) {
      Text(label)
        .fontSize(14)
        .fontColor('#666')

      Text(value)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor(color)
    }
    .width('100%')
    .padding(16)
    .backgroundColor('#F8F8F8')
    .borderRadius(12)
    .layoutWeight(1)
  }

  @Builder
  StatusView() {
    if (this.isLoading) {
      Row({ space: 8 }) {
        LoadingProgress()
          .width(20)
          .height(20)
          .color('#007DFF')

        Text('加载中...')
          .fontSize(14)
          .fontColor('#666')
      }
      .width('100%')
      .padding(16)
      .backgroundColor('#E6F7FF')
      .borderRadius(8)
    } else {
      Row() {
        Text('✓ 加载完成')
          .fontSize(14)
          .fontColor('#52C41A')
          .layoutWeight(1)

        Button('重新加载')
          .fontSize(12)
          .onClick(() => {
            this.isLoading = true
          })
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F6FFED')
      .borderRadius(8)
    }
  }

  @Builder
  ListItemView(item: TodoItem) {
    Row() {
      Text(item.done ? '✓' : '○')
        .fontSize(20)
        .fontColor(item.done ? '#52C41A' : '#D9D9D9')
        .margin({ right: 12 })

      Text(item.title)
        .fontSize(16)
        .fontColor(item.done ? '#999' : '#333')
        .decoration({
          type: item.done ? TextDecorationType.LineThrough : TextDecorationType.None
        })
        .layoutWeight(1)
    }
    .width('100%')
    .padding(12)
    .backgroundColor(Color.White)
    .borderRadius(8)
  }

  // ==================== 辅助构建函数 ====================

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
      .fontColor('#FA8C16')
      .width('100%')
      .padding(12)
      .backgroundColor('#FFF7E6')
      .borderRadius(8)
  }

  @Builder
  BestPracticeCard() {
    Column({ space: 8 }) {
      Text('@Builder 最佳实践')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)

      Text('• 全局 @Builder：跨组件复用')
        .fontSize(12)
        .fontColor('#666')

      Text('• 局部 @Builder：组件内复用')
        .fontSize(12)
        .fontColor('#666')

      Text('• 参数化：提高灵活性')
        .fontSize(12)
        .fontColor('#666')

      Text('• 命名规范：清晰表达用途')
        .fontSize(12)
        .fontColor('#666')
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
