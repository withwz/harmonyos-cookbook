import router from '@ohos.router'

/**
 * @Prop 装饰器演示
 *
 * 核心概念：
 * - @Prop 用于父组件向子组件单向传递数据
 * - 子组件只能读取，不能修改父组件数据
 * - 数据类型：boolean, string, number, 支持类型转换
 * - 初始化：必须从父组件接收
 */

// ==================== 子组件1：只读显示 ====================
@Component
struct UserCard {
  @Prop userName: string = ''
  @Prop userAge: number = 0

  build() {
    Row() {
      Column({ space: 4 }) {
        Text(this.userName)
          .fontSize(18)
          .fontWeight(FontWeight.Medium)

        Text(`${this.userAge}岁`)
          .fontSize(14)
          .fontColor('#666')
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Text('只读')
        .fontSize(12)
        .fontColor('#999')
        .padding({ left: 8, right: 8, top: 4, bottom: 4 })
        .backgroundColor('#F0F0F0')
        .borderRadius(4)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }
}

// ==================== 子组件2：计数卡片 ====================
@Component
struct CountCard {
  @Prop count: number = 0
  @Prop label: string = ''

  build() {
    Column({ space: 8 }) {
      Text(this.label)
        .fontSize(14)
        .fontColor('#666')

      Text(this.count.toString())
        .fontSize(32)
        .fontWeight(FontWeight.Bold)
        .fontColor('#007DFF')

      Text('子组件只能显示，无法修改')
        .fontSize(12)
        .fontColor('#999')
    }
    .width('100%')
    .padding(20)
    .backgroundColor('#F8F8F8')
    .borderRadius(12)
  }
}

// 定义产品接口
interface ProductInfo {
  name: string
  price: number
  inStock: boolean
}

// ==================== 子组件3：产品卡片 ====================
@Component
struct ProductCard {
  @Prop name: string = ''
  @Prop price: number = 0
  @Prop inStock: boolean = true

  build() {
    Row() {
      Column({ space: 4 }) {
        Text(this.name)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)

        Text(`¥${this.price.toFixed(2)}`)
          .fontSize(14)
          .fontColor('#FF6B6B')
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Text(this.inStock ? '有货' : '缺货')
        .fontSize(12)
        .fontColor(this.inStock ? '#52C41A' : '#999')
        .padding({ left: 8, right: 8, top: 4, bottom: 4 })
        .backgroundColor(this.inStock ? '#F6FFED' : '#F5F5F5')
        .borderRadius(4)
    }
    .width('100%')
    .padding(12)
    .backgroundColor(Color.White)
    .borderRadius(8)
  }
}

// ==================== 主页面 ====================
@Entry
@Component
struct PropDemo {
  @State currentCount: number = 0
  @State userName: string = '张三'
  @State userAge: number = 25
  @State products: Array<ProductInfo> = []

  aboutToAppear() {
    this.products = [
      { name: 'iPhone 15', price: 5999, inStock: true },
      { name: 'MacBook Pro', price: 12999, inStock: true },
      { name: 'AirPods Pro', price: 1999, inStock: false }
    ]
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.BackButton()
        this.SectionTitle('@Prop 装饰器演示')
        this.InfoCard('@Prop 实现父→子单向数据传递，子组件只读不可修改')

        // 示例1：用户信息卡片
        this.UserCardSection()

        // 示例2：计数显示
        this.CounterSection()

        // 示例3：产品列表
        this.ProductListSection()

        this.CompareCard()
        this.TipCard('@Prop 要点：单向传递、子组件只读、适合数据展示场景')
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  UserCardSection() {
    Column({ space: 12 }) {
      UserCard({
        userName: this.userName,
        userAge: this.userAge
      })

      Column({ space: 8 }) {
        Text('父组件控制区（可修改）：')
          .fontSize(12)
          .fontColor('#666')

        Row({ space: 8 }) {
          Button('改名')
            .onClick(() => {
              this.userName = this.userName === '张三' ? '李四' : '张三'
            })

          Button('长大一岁')
            .onClick(() => {
              this.userAge++
            })
        }
      }
      .padding(12)
      .backgroundColor('#FFFBE6')
      .borderRadius(8)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  CounterSection() {
    Column({ space: 12 }) {
      Row({ space: 12 }) {
        CountCard({ count: this.currentCount, label: '计数器A' })
        CountCard({ count: this.currentCount, label: '计数器B' })
      }
      .width('100%')

      Row({ space: 8 }) {
        Button('减少')
          .onClick(() => {
            this.currentCount--
          })

        Text(`${this.currentCount}`)
          .fontSize(20)
          .width(60)
          .textAlign(TextAlign.Center)

        Button('增加')
          .onClick(() => {
            this.currentCount++
          })
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  ProductListSection() {
    Column({ space: 8 }) {
      ForEach(this.products, (product: ProductInfo) => {
        ProductCard({
          name: product.name,
          price: product.price,
          inStock: product.inStock
        })
      }, (product: ProductInfo) => product.name)
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
      .fontColor('#007DFF')
      .width('100%')
      .padding(12)
      .backgroundColor('#E6F7FF')
      .borderRadius(8)
  }

  @Builder
  CompareCard() {
    Column({ space: 8 }) {
      Text('装饰器对比')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)

      Row() {
        Text('@Prop')
          .fontSize(12)
          .fontColor('#007DFF')
          .padding(4)
          .backgroundColor('#E6F7FF')
          .borderRadius(4)

        Text('单向')
          .fontSize(12)
          .fontColor('#666')

        Text('@Link')
          .fontSize(12)
          .fontColor('#52C41A')
          .padding(4)
          .backgroundColor('#F6FFED')
          .borderRadius(4)

        Text('双向')
          .fontSize(12)
          .fontColor('#666')
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
