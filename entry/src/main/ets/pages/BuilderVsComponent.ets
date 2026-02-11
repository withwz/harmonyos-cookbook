import router from '@ohos.router'

/**
 * @Builder vs @Component 区别演示
 *
 * 核心区别：
 * - @Component 是完整的组件，可以有状态、生命周期
 * - @Builder 是构建函数，只是 UI 的封装
 */

// ==================== @Component 示例 ====================
@Component
struct CounterComponent {
  @State count: number = 0  // ✅ @Component 可以有状态

  aboutToAppear() {  // ✅ @Component 有生命周期
    console.log('CounterComponent created')
  }

  build() {
    Column({ space: 8 }) {
      Text(`计数: ${this.count}`)
        .fontSize(18)

      Button('+1')
        .onClick(() => {
          this.count++  // ✅ 可以修改自己的状态
        })
    }
    .padding(16)
    .backgroundColor('#E6F7FF')
    .borderRadius(12)
  }
}

// ==================== 全局 @Builder 示例 ====================
@Builder
function CounterBuilder(label: string, value: number, onAdd: () => void) {
  // ❌ @Builder 不能有状态
  // ✅ 通过参数接收数据，通过回调函数处理事件

  Column({ space: 8 }) {
    Text(`${label}: ${value}`)
      .fontSize(18)

    Button('+1')
      .onClick(() => {
        onAdd()  // 通过回调函数通知父组件
      })
  }
  .padding(16)
  .backgroundColor('#FFF7E6')
  .borderRadius(12)
}

// ==================== 主页面 ====================
@Entry
@Component
struct BuilderVsComponent {
  @State componentCount: number = 0
  @State builderCount: number = 0

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.BackButton()
        this.SectionTitle('@Builder vs @Component')

        this.InfoCard('@Component 定义组件，@Builder 定义构建函数')

        // ==================== 核心对比 ====================
        this.CompareSection()

        // ==================== 详细区别 ====================
        this.DifferenceTable()

        // ==================== 使用场景 ====================
        this.UseCaseSection()

        // ==================== 参数传递对比 ====================
        this.ParameterSection()

        this.TipCard('组件用 @Component，UI封装用 @Builder')
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
      Text('实际效果对比')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      // @Component 演示
      Column({ space: 8 }) {
        Text('@Component - 独立状态')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor('#007DFF')

        // @Component 组件有自己的状态
        CounterComponent()
        CounterComponent()

        Text('✅ 两个 Counter 各自独立，互不影响')
          .fontSize(12)
          .fontColor('#52C41A')
      }
      .width('100%')
      .padding(12)
      .backgroundColor(Color.White)
      .borderRadius(12)

      // @Builder 演示
      Column({ space: 8 }) {
        Text('@Builder - 共享状态')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
          .fontColor('#FA8C16')

        // @Builder 只是个函数，状态在父组件
        Row({ space: 12 }) {
          CounterBuilder('计数器A', this.builderCount, () => {
            this.builderCount++
          })

          CounterBuilder('计数器B', this.builderCount, () => {
            this.builderCount++
          })
        }
        .width('100%')

        Text('✅ 两个 Builder 共享父组件的 builderCount')
          .fontSize(12)
          .fontColor('#52C41A')

        Text(`当前父组件状态: builderCount = ${this.builderCount}`)
          .fontSize(12)
          .fontColor('#666')
      }
      .width('100%')
      .padding(12)
      .backgroundColor(Color.White)
      .borderRadius(12)
    }
    .width('100%')
  }

  @Builder
  DifferenceTable() {
    Column({ space: 12 }) {
      Text('详细区别对比')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      // 对比表格
      Column({ space: 0 }) {
        // 表头
        Row() {
          Text('特性')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .width(80)

          Text('@Component')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .width(100)
            .fontColor('#007DFF')

          Text('@Builder')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .layoutWeight(1)
            .fontColor('#FA8C16')
        }
        .width('100%')
        .padding(8)
        .backgroundColor('#F0F0F0')

        // 状态管理
        Row() {
          Text('状态管理')
            .fontSize(12)
            .width(80)
            .fontColor('#666')

          Text('✅ 有独立状态')
            .fontSize(11)
            .width(100)
            .fontColor('#52C41A')

          Text('❌ 无状态，依赖父组件')
            .fontSize(11)
            .layoutWeight(1)
            .fontColor('#FF6B6B')
        }
        .width('100%')
        .padding(8)

        // 生命周期
        Row() {
          Text('生命周期')
            .fontSize(12)
            .width(80)
            .fontColor('#666')

          Text('✅ 完整生命周期')
            .fontSize(11)
            .width(100)
            .fontColor('#52C41A')

          Text('❌ 无生命周期')
            .fontSize(11)
            .layoutWeight(1)
            .fontColor('#FF6B6B')
        }
        .width('100%')
        .padding(8)

        // 参数传递
        Row() {
          Text('参数传递')
            .fontSize(12)
            .width(80)
            .fontColor('#666')

          Text('成员变量初始化')
            .fontSize(11)
            .width(100)
            .fontColor('#666')

          Text('函数参数')
            .fontSize(11)
            .layoutWeight(1)
            .fontColor('#666')
        }
        .width('100%')
        .padding(8)

        // 使用方式
        Row() {
          Text('使用方式')
            .fontSize(12)
            .width(80)
            .fontColor('#666')

          Text('MyComp({})')
            .fontSize(11)
            .width(100)
            .fontColor('#666')

          Text('this.build()')
            .fontSize(11)
            .layoutWeight(1)
            .fontColor('#666')
        }
        .width('100%')
        .padding(8)

        // 适用场景
        Row() {
          Text('适用场景')
            .fontSize(12)
            .width(80)
            .fontColor('#666')

          Text('独立可复用组件')
            .fontSize(11)
            .width(100)
            .fontColor('#666')

          Text('UI片段封装')
            .fontSize(11)
            .layoutWeight(1)
            .fontColor('#666')
        }
        .width('100%')
        .padding(8)
      }
      .width('100%')
      .borderRadius(8)
      .clip(true)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  UseCaseSection() {
    Column({ space: 12 }) {
      Text('使用场景建议')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Column({ space: 12 }) {
        this.UseCaseItem(
          '✅ 使用 @Component',
          '#007DFF',
          '• 需要独立状态管理\n• 需要生命周期钩子\n• 复杂的交互逻辑\n• 可独立复用的功能模块\n• 例如：用户卡片、商品项、计数器'
        )

        this.UseCaseItem(
          '✅ 使用 @Builder',
          '#FA8C16',
          '• 纯 UI 展示封装\n• 重复的布局结构\n• 简单的参数化组件\n• 不需要状态管理\n• 例如：标题样式、卡片样式、列表项'
        )

        this.UseCaseItem(
          '⚠️ 混合使用',
          '#722ED1',
          '• @Component 内部使用 @Builder\n• Builder 处理简单 UI\n• Component 处理复杂逻辑\n• 两者可以配合使用'
        )
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  UseCaseItem(title: string, color: string, content: string) {
    Column({ space: 6 }) {
      Text(title)
        .fontSize(13)
        .fontWeight(FontWeight.Medium)
        .fontColor(color)

      Text(content)
        .fontSize(11)
        .fontColor('#666')
        .lineHeight(16)
    }
    .width('100%')
    .padding(10)
    .backgroundColor('#F8F8F8')
    .borderRadius(6)
  }

  @Builder
  ParameterSection() {
    Column({ space: 12 }) {
      Text('参数传递对比')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Column({ space: 16 }) {
        // Component 参数
        Column({ space: 8 }) {
          Text('@Component 参数传递')
            .fontSize(13)
            .fontColor('#007DFF')

          Text(`// 定义
@Component
struct MyCard {
  @Prop title: string
  @Prop count: number
  build() { ... }
}

// 使用
MyCard({
  title: '标题',
  count: 10
})`)
            .fontSize(10)
            .fontFamily('monospace')
            .width('100%')
            .padding(10)
            .backgroundColor('#F8F8F8')
            .borderRadius(6)
        }

        // Builder 参数
        Column({ space: 8 }) {
          Text('@Builder 参数传递')
            .fontSize(13)
            .fontColor('#FA8C16')

          Text(`// 定义
@Builder
function MyCard(title: string, count: number) {
  Column() { ... }
}

// 使用
this.MyCard('标题', 10)`)
            .fontSize(10)
            .fontFamily('monospace')
            .width('100%')
            .padding(10)
            .backgroundColor('#F8F8F8')
            .borderRadius(6)
        }
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
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
      .fontColor('#722ED1')
      .width('100%')
      .padding(12)
      .backgroundColor('#F9F0FF')
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
