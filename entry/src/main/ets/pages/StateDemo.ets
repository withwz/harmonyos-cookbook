import router from '@ohos.router'

/**
 * @State 装饰器演示
 *
 * 核心概念：
 * - @State 用于组件内部状态管理
 * - 状态改变时自动触发 UI 更新
 * - 必须本地初始化
 * - 不与父组件同步
 */

// 定义用户信息接口
interface UserInfo {
  name: string
  age: number
}

@Entry
@Component
struct StateDemo {
  // ==================== 基础示例：计数器 ====================
  @State count: number = 0

  // ==================== 字符串状态 ====================
  @State message: string = 'Hello World'

  // ==================== 布尔状态 ====================
  @State isExpanded: boolean = false

  // ==================== 数组状态 ====================
  @State items: Array<string> = ['项目1', '项目2', '项目3']

  // ==================== 对象状态 ====================
  @State userInfo: UserInfo = {
    name: '张三',
    age: 25
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        // 返回按钮
        this.BackButton()

        // 标题
        this.SectionTitle('@State 装饰器演示')

        // ==================== 示例1：计数器 ====================
        this.CounterCard()

        // ==================== 示例2：文本状态 ====================
        this.TextStateCard()

        // ==================== 示例3：布尔状态控制显示/隐藏 ====================
        this.ExpandCard()

        // ==================== 示例4：数组状态 ====================
        this.ArrayStateCard()

        // ==================== 示例5：对象状态 ====================
        this.ObjectStateCard()

        // 底部说明
        this.TipCard('@State 要点：必须初始化、本地修改、不与父组件同步')
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  // ==================== 示例卡片构建函数 ====================

  @Builder
  CounterCard() {
    Column({ space: 10 }) {
      Text(`当前计数: ${this.count}`)
        .fontSize(20)

      Row({ space: 10 }) {
        Button('减少')
          .onClick(() => {
            this.count--
          })

        Button('增加')
          .onClick(() => {
            this.count++
          })

        Button('重置')
          .onClick(() => {
            this.count = 0
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
  TextStateCard() {
    Column({ space: 10 }) {
      Text(this.message)
        .fontSize(18)
        .fontColor(this.message === 'Hello World' ? '#333' : '#007DFF')

      Button('切换消息')
        .onClick(() => {
          this.message = this.message === 'Hello World' ? '你好鸿蒙' : 'Hello World'
        })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  ExpandCard() {
    Column({ space: 10 }) {
      Button(this.isExpanded ? '收起内容' : '展开内容')
        .onClick(() => {
          this.isExpanded = !this.isExpanded
        })

      if (this.isExpanded) {
        Text('这是展开的内容')
          .fontSize(14)
          .fontColor('#666')
          .padding(10)
          .backgroundColor('#F0F0F0')
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
  ArrayStateCard() {
    Column({ space: 10 }) {
      ForEach(this.items, (item: string, index: number) => {
        Row() {
          Text(`${index + 1}. ${item}`)
            .layoutWeight(1)

          Button('删除')
            .fontSize(12)
            .onClick(() => {
              this.items.splice(index, 1)
              // 注意：数组操作后需要重新赋值触发更新
              const newItems: string[] = []
              for (let i = 0; i < this.items.length; i++) {
                newItems.push(this.items[i])
              }
              this.items = newItems
            })
        }
        .width('100%')
        .padding(8)
        .backgroundColor('#F8F8F8')
        .borderRadius(6)
      }, (item: string, index: number) => index.toString())

      Button('添加项目')
        .onClick(() => {
          const newItem = `项目${this.items.length + 1}`
          this.items.push(newItem)
          const newItems: string[] = []
          for (let i = 0; i < this.items.length; i++) {
            newItems.push(this.items[i])
          }
          this.items = newItems
        })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  ObjectStateCard() {
    Column({ space: 10 }) {
      Text(`姓名: ${this.userInfo.name}`)
        .fontSize(16)

      Text(`年龄: ${this.userInfo.age}岁`)
        .fontSize(16)

      Row({ space: 10 }) {
        Button('改名')
          .onClick(() => {
            this.userInfo.name = this.userInfo.name === '张三' ? '李四' : '张三'
            // 注意：修改对象属性需要重新赋值触发更新
            this.userInfo = { name: this.userInfo.name, age: this.userInfo.age }
          })

        Button('长大一岁')
          .onClick(() => {
            this.userInfo.age++
            this.userInfo = { name: this.userInfo.name, age: this.userInfo.age }
          })
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
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
