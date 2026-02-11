import router from '@ohos.router'

/**
 * @Prop 装饰器演示
 *
 * 核心概念：
 * - @Prop 用于父组件向子组件单向传递数据
 * - 子组件可以修改 @Prop 变量，但修改不会同步到父组件
 * - 数据类型：boolean, string, number, 支持类型转换
 * - 初始化：必须从父组件接收
 */

// ==================== 子组件：@Prop 演示 ====================
@Component
struct PropUserCard {
  @Prop userName: string = ''
  @Prop userAge: number = 0

  build() {
    Column({ space: 12 }) {
      // 标题
      Text('@Prop 子组件')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor('#007DFF')
        .width('100%')

      // 用户信息显示
      Row({ space: 12 }) {
        Text(this.userName)
          .fontSize(18)
          .fontWeight(FontWeight.Medium)

        Text(`${this.userAge}岁`)
          .fontSize(14)
          .fontColor('#666')
      }

      // 子组件内部修改按钮
      Row({ space: 8 }) {
        Button('改名')
          .fontSize(12)
          .onClick(() => {
            // ⚠️ @Prop 可以修改，但只在子组件内部生效
            this.userName = this.userName === '张三' ? '李四' : '张三'
          })

        Button('长大一岁')
          .fontSize(12)
          .onClick(() => {
            this.userAge++
          })
      }

      // 说明
      Text('⚠️ 修改只在子组件内生效，父组件不受影响')
        .fontSize(10)
        .fontColor('#FF6B6B')
        .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor('#E6F7FF')
    .borderRadius(12)
  }
}

// ==================== 子组件：@Link 演示 ====================
@Component
struct LinkUserCard {
  @Link userName: string
  @Link userAge: number

  build() {
    Column({ space: 12 }) {
      // 标题
      Text('@Link 子组件')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor('#52C41A')
        .width('100%')

      // 用户信息显示
      Row({ space: 12 }) {
        Text(this.userName)
          .fontSize(18)
          .fontWeight(FontWeight.Medium)

        Text(`${this.userAge}岁`)
          .fontSize(14)
          .fontColor('#666')
      }

      // 子组件内部修改按钮
      Row({ space: 8 }) {
        Button('改名')
          .fontSize(12)
          .onClick(() => {
            // ✅ @Link 修改会同步到父组件
            this.userName = this.userName === '张三' ? '李四' : '张三'
          })

        Button('长大一岁')
          .fontSize(12)
          .onClick(() => {
            this.userAge++
          })
      }

      // 说明
      Text('✅ 修改会同步到父组件')
        .fontSize(10)
        .fontColor('#52C41A')
        .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor('#F6FFED')
    .borderRadius(12)
  }
}

// ==================== 主页面 ====================
@Entry
@Component
struct PropDemo {
  @State userName: string = '张三'
  @State userAge: number = 25

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.BackButton()
        this.SectionTitle('@Prop 装饰器演示')
        this.InfoCard('@Prop 传递值拷贝，@Link 传递引用')

        // ==================== 核心对比演示 ====================
        this.CompareSection()

        // ==================== 行为说明 ====================
        this.BehaviorSection()

        // ==================== 使用建议 ====================
        this.RecommendationSection()

        this.TipCard('要点：@Prop 子组件可改但不同步，@Link 修改同步父组件')
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  CompareSection() {
    Column({ space: 16 }) {
      Text('核心对比：@Prop vs @Link')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      // 父组件数据显示
      Column({ space: 8 }) {
        Text('父组件数据源')
          .fontSize(14)
          .fontColor('#666')

        Row({ space: 16 }) {
          Column({ space: 4 }) {
            Text('姓名')
              .fontSize(12)
              .fontColor('#999')
            Text(this.userName)
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
          }

          Column({ space: 4 }) {
            Text('年龄')
              .fontSize(12)
              .fontColor('#999')
            Text(`${this.userAge}岁`)
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
          }
        }
        .width('100%')
        .padding(12)
        .backgroundColor('#FFFBE6')
        .borderRadius(8)

        // 父组件控制按钮
        Row({ space: 8 }) {
          Button('父组件改名')
            .fontSize(12)
            .onClick(() => {
              this.userName = this.userName === '张三' ? '张三' : '张三'
            })

          Button('父组件重置')
            .fontSize(12)
            .onClick(() => {
              this.userName = '张三'
              this.userAge = 25
            })
        }
      }
      .width('100%')
      .padding(16)
      .backgroundColor(Color.White)
      .borderRadius(12)

      // 对比显示
      Row({ space: 12 }) {
        // @Prop 演示
        PropUserCard({
          userName: this.userName,
          userAge: this.userAge
        })
        .layoutWeight(1)

        // @Link 演示
        LinkUserCard({
          userName: $userName,
          userAge: $userAge
        })
        .layoutWeight(1)
      }
      .width('100%')
    }
    .width('100%')
  }

  @Builder
  BehaviorSection() {
    Column({ space: 12 }) {
      Text('行为说明')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Column({ space: 12 }) {
        this.BehaviorItem(
          '@Prop 行为',
          '1. 父组件传值给子组件（值拷贝）\n2. 子组件可以修改该值\n3. ❌ 修改只在子组件内生效\n4. ❌ 父组件不受影响\n5. 父组件重新渲染会覆盖子组件的值',
          '#007DFF'
        )

        this.BehaviorItem(
          '@Link 行为',
          '1. 父组件传引用给子组件\n2. 子组件可以修改该值\n3. ✅ 修改会同步到父组件\n4. ✅ 父子组件始终保持一致\n5. 双向数据绑定',
          '#52C41A'
        )
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
  BehaviorItem(title: string, desc: string, color: string) {
    Column({ space: 8 }) {
      Text(title)
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor(color)

      Text(desc)
        .fontSize(12)
        .fontColor('#666')
        .lineHeight(18)
    }
    .width('100%')
    .padding(12)
    .backgroundColor('#F8F8F8')
    .borderRadius(8)
  }

  @Builder
  RecommendationSection() {
    Column({ space: 12 }) {
      Text('使用建议')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Column({ space: 8 }) {
        this.RecommendItem(
          '✅ 使用 @Prop',
          '• 子组件只用于展示数据\n• 子组件不需要修改数据\n• 父组件需要完全控制数据'
        )

        this.RecommendItem(
          '✅ 使用 @Link',
          '• 子组件需要修改数据\n• 修改需要同步到父组件\n• 表单输入、开关等交互组件'
        )

        this.RecommendItem(
          '⚠️ 避免的做法',
          '• 在 @Prop 子组件中修改数据（容易误导）\n• 混用 @Prop 和 @Link 传递同一数据'
        )
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  RecommendItem(title: string, items: string) {
    Column({ space: 6 }) {
      Text(title)
        .fontSize(13)
        .fontWeight(FontWeight.Medium)

      Text(items)
        .fontSize(12)
        .fontColor('#666')
        .lineHeight(18)
    }
    .width('100%')
    .padding(10)
    .backgroundColor('#F8F8F8')
    .borderRadius(6)
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
      .fontColor('#007DFF')
      .width('100%')
      .padding(12)
      .backgroundColor('#E6F7FF')
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
