import router from '@ohos.router'

/**
 * ArkTS 语法与 TypeScript 对比演示
 *
 * 核心区别：
 * 1. struct 定义组件 vs class/function
 * 2. 装饰器系统
 * 3. build() 方法返回 UI
 * 4. 更严格的类型检查
 */

// ==================== 1. struct vs class 对比 ====================

// TypeScript 写法（React 风格）
/*
class UserComponent extends React.Component {
  state = { name: '张三' }

  render() {
    return <div>{this.state.name}</div>
  }
}
*/

// ArkTS 写法 - 使用 struct
@Entry
@Component
struct ArkTSSyntaxDemo {
  // 状态变量
  @State userName: string = '张三'
  @State showDetails: boolean = false

  build() {
    Scroll() {
      Column({ space: 16 }) {
        // 标题
        this.HeaderSection()

        // struct vs class 对比
        this.StructVsClassSection()

        // 装饰器系统
        this.DecoratorSection()

        // 类型系统
        this.TypeSystemSection()

        // 函数对比
        this.FunctionSection()

        // 代码对比
        this.CodeComparisonSection()
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  HeaderSection() {
    Column({ space: 8 }) {
      Text('ArkTS vs TypeScript 语法对比')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)

      Text('ArkTS 是 TypeScript 的严格超集，专门为鸿蒙 UI 设计')
        .fontSize(14)
        .fontColor('#666')
    }
    .width('100%')
  }

  // ==================== struct vs class 对比 ====================
  @Builder
  StructVsClassSection() {
    Column({ space: 12 }) {
      Text('1️⃣ struct vs class')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Column({ space: 8 }) {
        this.ComparisonItem(
          'TypeScript - class',
          `class MyClass {
  name: string = 'test'

  render() {
    return <div>{this.name}</div>
  }
}`
        )

        this.ComparisonItem(
          'ArkTS - struct',
          `@Component
struct MyStruct {
  @State name: string = 'test'

  build() {
    Text(this.name)
  }
}`
        )
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  // ==================== 装饰器系统 ====================
  @Builder
  DecoratorSection() {
    Column({ space: 12 }) {
      Text('2️⃣ 装饰器系统')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Column({ space: 8 }) {
        this.DecoratorItem('@Entry', '页面入口标记，一个页面只能有一个')
        this.DecoratorItem('@Component', '组件标记，声明这是一个 UI 组件')
        this.DecoratorItem('@State', '组件内部状态，修改会触发 UI 更新')
        this.DecoratorItem('@Prop', '父→子单向数据传递')
        this.DecoratorItem('@Link', '父子双向数据绑定')
        this.DecoratorItem('@Builder', '自定义构建函数')
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  DecoratorItem(name: string, desc: string) {
    Row({ space: 12 }) {
      Text(name)
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor('#007DFF')
        .width(100)

      Text(desc)
        .fontSize(13)
        .fontColor('#666')
        .layoutWeight(1)
    }
    .width('100%')
    .padding(8)
    .backgroundColor('#F8F8F8')
    .borderRadius(6)
  }

  // ==================== 类型系统对比 ====================
  @Builder
  TypeSystemSection() {
    Column({ space: 12 }) {
      Text('3️⃣ 类型系统区别')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Column({ space: 8 }) {
        this.TypeItem('❌ 不支持', '对象字面量类型', `let item: { name: string }`)

        this.TypeItem('❌ 不支持', '展开运算符', `const arr = [...array]`)

        this.TypeItem('❌ 不支持', 'any 类型', `let data: any`)

        this.TypeItem('✅ 必须使用', 'interface 定义类型', `interface Item { name: string }`)

        this.TypeItem('✅ 必须使用', '循环复制数组', `for (let i = 0; i < arr.length; i++)`)
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  TypeItem(tag: string, title: string, code: string) {
    Row({ space: 8 }) {
      Text(tag)
        .fontSize(11)
        .width(60)

      Text(title)
        .fontSize(13)
        .width(100)

      Text(code)
        .fontSize(11)
        .fontFamily('monospace')
        .fontColor('#722ED1')
        .layoutWeight(1)
    }
    .width('100%')
    .padding(6)
    .backgroundColor('#F8F8F8')
    .borderRadius(4)
  }

  // ==================== 函数对比 ====================
  @Builder
  FunctionSection() {
    Column({ space: 12 }) {
      Text('4️⃣ 函数对比')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Column({ space: 12 }) {
        // TypeScript 风格
        Column({ space: 8 }) {
          Text('TypeScript - 普通函数')
            .fontSize(14)
            .fontColor('#666')

          Text(`function getUserName(): string {
  return '张三'
}

const user = getUserName()`)
            .fontSize(11)
            .fontFamily('monospace')
            .width('100%')
            .padding(10)
            .backgroundColor('#F8F8F8')
            .borderRadius(6)
        }

        // ArkTS @Builder 风格
        Column({ space: 8 }) {
          Text('ArkTS - @Builder 构建函数')
            .fontSize(14)
            .fontColor('#007DFF')

          Text(`@Builder
function UserNameCard(name: string) {
  Text(name)
    .fontSize(16)
}

// 使用
this.UserNameCard('张三')`)
            .fontSize(11)
            .fontFamily('monospace')
            .width('100%')
            .padding(10)
            .backgroundColor('#E6F7FF')
            .borderRadius(6)
        }
      }

      this.TipText('💡 @Builder 只能包含 UI 组件语法，不能写普通 TypeScript 代码')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  // ==================== 代码对比 ====================
  @Builder
  CodeComparisonSection() {
    Column({ space: 12 }) {
      Text('5️⃣ 实际代码对比')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      // 计数器对比
      Column({ space: 12 }) {
        Text('计数器组件对比')
          .fontSize(16)
          .fontColor('#666')

        // React/TS
        Column({ space: 8 }) {
          Text('React + TypeScript')
            .fontSize(13)
            .fontWeight(FontWeight.Medium)

          Text(`function Counter() {
  const [count, setCount] = useState(0)

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() =>
        setCount(count + 1)
      }>
        +1
      </button>
    </div>
  )
}`)
            .fontSize(10)
            .fontFamily('monospace')
            .width('100%')
            .padding(10)
            .backgroundColor('#F8F8F8')
            .borderRadius(6)
        }

        // ArkTS
        Column({ space: 8 }) {
          Text('ArkTS')
            .fontSize(13)
            .fontWeight(FontWeight.Medium)
            .fontColor('#007DFF')

          Text(`@Component
struct Counter {
  @State count: number = 0

  build() {
    Column() {
      Text(\`Count: \${this.count}\`)
      Button('+1')
        .onClick(() => {
          this.count++
        })
    }
  }
}`)
            .fontSize(10)
            .fontFamily('monospace')
            .width('100%')
            .padding(10)
            .backgroundColor('#E6F7FF')
            .borderRadius(6)
        }
      }

      // 关键区别总结
      Column({ space: 8 }) {
        Text('📌 关键区别总结')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)

        Column({ space: 6 }) {
          this.SummaryItem('struct', '值类型，更高效，无继承')
          this.SummaryItem('build()', '声明式 UI，类似 JSX 但更简洁')
          this.SummaryItem('装饰器', '@State/@Prop 等管理响应式状态')
          this.SummaryItem('this', '访问成员直接用 this，无需 hooks')
          this.SummaryItem('类型严格', '编译时检查更严格，不允许 any')
        }
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#FFF7E6')
      .borderRadius(8)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  // ==================== 辅助组件 ====================

  @Builder
  ComparisonItem(title: string, code: string) {
    Column({ space: 6 }) {
      Text(title)
        .fontSize(13)
        .fontWeight(FontWeight.Medium)

      Text(code)
        .fontSize(10)
        .fontFamily('monospace')
        .width('100%')
        .padding(10)
        .backgroundColor('#F8F8F8')
        .borderRadius(6)
    }
    .width('100%')
  }

  @Builder
  SummaryItem(key: string, value: string) {
    Row({ space: 8 }) {
      Text(key)
        .fontSize(13)
        .fontWeight(FontWeight.Medium)
        .fontColor('#007DFF')

      Text(value)
        .fontSize(12)
        .fontColor('#666')
        .layoutWeight(1)
    }
    .width('100%')
  }

  @Builder
  TipText(text: string) {
    Text(text)
      .fontSize(12)
      .fontColor('#FA8C16')
      .width('100%')
      .padding(8)
      .backgroundColor('#FFF7E6')
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

  aboutToAppear() {
    console.log('ArkTSSyntaxDemo aboutToAppear')
  }
}
