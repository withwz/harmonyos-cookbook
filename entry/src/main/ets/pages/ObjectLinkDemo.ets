import router from '@ohos.router'

/**
 * @Observed + @ObjectLink 装饰器演示
 */

// ==================== 被观察的类 ====================
@Observed
class Product {
  id: number
  name: string
  price: number
  quantity: number

  constructor(id: number, name: string, price: number, quantity: number) {
    this.id = id
    this.name = name
    this.price = price
    this.quantity = quantity
  }

  get subtotal(): number {
    return this.price * this.quantity
  }
}

@Observed
class Address {
  province: string
  city: string
  detail: string

  constructor(province: string, city: string, detail: string) {
    this.province = province
    this.city = city
    this.detail = detail
  }

  get fullAddress(): string {
    return `${this.province} ${this.city} ${this.detail}`
  }
}

// ==================== 子组件：购物车商品项 ====================
@Component
struct CartItem {
  @ObjectLink product: Product
  onRemove?: (id: number) => void

  build() {
    Row() {
      Column({ space: 4 }) {
        Text(this.product.name)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)

        Text(`¥${this.product.price}`)
          .fontSize(14)
          .fontColor('#FF6B6B')
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Row({ space: 8 }) {
        Button('-')
          .width(32)
          .height(32)
          .fontSize(14)
          .enabled(this.product.quantity > 1)
          .onClick(() => {
            this.product.quantity--
          })

        Text(this.product.quantity.toString())
          .fontSize(16)
          .width(30)
          .textAlign(TextAlign.Center)

        Button('+')
          .width(32)
          .height(32)
          .fontSize(14)
          .onClick(() => {
            this.product.quantity++
          })
      }

      Button('删除')
        .fontSize(12)
        .backgroundColor('#FF6B6B')
        .margin({ left: 8 })
        .onClick(() => {
          this.onRemove?.(this.product.id)
        })
    }
    .width('100%')
    .padding(12)
    .backgroundColor(Color.White)
    .borderRadius(8)
  }
}

// ==================== 子组件：地址卡片 ====================
@Component
struct AddressCard {
  @ObjectLink address: Address

  build() {
    Column({ space: 8 }) {
      Text('收货地址')
        .fontSize(14)
        .fontColor('#666')

      Text(this.address.fullAddress)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Row({ space: 8 }) {
        Button('修改城市')
          .fontSize(12)
          .onClick(() => {
            this.address.city = this.address.city === '北京' ? '上海' : '北京'
          })

        Button('修改详情')
          .fontSize(12)
          .onClick(() => {
            this.address.detail = this.address.detail === '朝阳区' ? '浦东新区' : '朝阳区'
          })
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor('#F8F8F8')
    .borderRadius(12)
  }
}

// ==================== 主页面 ====================
@Entry
@Component
struct ObjectLinkDemo {
  @State cartItems: Array<Product> = []
  @State shippingAddress: Address = new Address('北京市', '北京', '朝阳区')

  aboutToAppear() {
    this.cartItems = [
      new Product(1, 'iPhone 15', 5999, 1),
      new Product(2, 'AirPods Pro', 1999, 2),
      new Product(3, 'MacBook Pro', 12999, 1)
    ]
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.BackButton()
        this.SectionTitle('@ObjectLink 装饰器演示')
        this.InfoCard('@ObjectLink 实现嵌套对象的深层观察，修改对象属性自动触发UI更新')

        // 示例1：购物车
        this.CartSection()

        // 示例2：地址管理
        this.AddressSection()

        // 对比说明
        this.CompareCard()

        this.TipCard('@ObjectLink 要点：必须配合@Observed、深层观察、嵌套对象场景')
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  CartSection() {
    Column({ space: 12 }) {
      ForEach(this.cartItems, (item: Product) => {
        CartItem({
          product: item,
          onRemove: (id: number) => {
            const newItems: Product[] = []
            for (let i = 0; i < this.cartItems.length; i++) {
              if (this.cartItems[i].id !== id) {
                newItems.push(this.cartItems[i])
              }
            }
            this.cartItems = newItems
          }
        })
      }, (item: Product) => item.id.toString())

      // 总计
      Row() {
        Text('总计:')
          .fontSize(16)
          .fontColor('#666')

        Text(`¥${this.getTotalPrice().toLocaleString()}`)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF6B6B')
          .layoutWeight(1)
          .textAlign(TextAlign.End)
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#FFF5F5')
      .borderRadius(8)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  // 计算总价
  private getTotalPrice(): number {
    let total = 0
    for (let i = 0; i < this.cartItems.length; i++) {
      total += this.cartItems[i].subtotal
    }
    return total
  }

  @Builder
  AddressSection() {
    Column({ space: 12 }) {
      AddressCard({ address: this.shippingAddress })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  CompareCard() {
    Column({ space: 12 }) {
      Text('对比：@State vs @ObjectLink')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor('#FF6B6B')

      Text(`❌ @State 无法观察到嵌套属性变化
@State data = { count: 0 }
this.data.count++  // UI 不会更新！

✅ @Observed + @ObjectLink 可以观察
@Observed
class Data { count: number }

@ObjectLink data: Data
this.data.count++  // UI 会自动更新！`)
        .fontSize(11)
        .fontColor('#333')
        .fontFamily('monospace')
        .width('100%')
        .padding(12)
        .backgroundColor('#F5F5F5')
        .borderRadius(6)
    }
    .width('100%')
    .padding(12)
    .backgroundColor(Color.White)
    .borderRadius(8)
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
