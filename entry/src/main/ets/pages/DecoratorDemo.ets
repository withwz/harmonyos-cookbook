import router from '@ohos.router'

/**
 * 鸿蒙装饰器学习导航页
 * 涵盖 @State, @Prop, @Link, @Observed, @ObjectLink, @Builder 的演示
 */

// 定义Demo项接口
interface DemoItem {
  title: string
  route: string
  description: string
}

@Entry
@Component
struct DecoratorDemo {
  @State currentIndex: number = 0

  // demo 列表
  private demoList: Array<DemoItem> = [
    {
      title: '@State 演示',
      route: 'pages/StateDemo',
      description: '组件内部状态管理 - 计数器示例'
    },
    {
      title: '@Prop 演示',
      route: 'pages/PropDemo',
      description: '父子单向数据同步 - 父传子只读'
    },
    {
      title: '@Link 演示',
      route: 'pages/LinkDemo',
      description: '父子双向数据绑定 - 实时同步'
    },
    {
      title: '@ObjectLink 演示',
      route: 'pages/ObjectLinkDemo',
      description: '嵌套对象深度观察 - 购物车示例'
    },
    {
      title: '@Builder 演示',
      route: 'pages/BuilderDemo',
      description: '自定义构建函数 - UI 复用'
    }
  ]

  build() {
    Column() {
      // 标题
      Text('鸿蒙装饰器学习')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('通过实际示例学习 ArkTS 装饰器')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 20 })

      // Demo 列表
      List({ space: 12 }) {
        ForEach(this.demoList, (item: DemoItem, index: number) => {
          ListItem() {
            this.DemoCard(item)
          }
        }, (item: DemoItem, index: number) => index.toString())
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 16, right: 16 })

      // 底部说明
      Text('点击卡片查看详细示例')
        .fontSize(12)
        .fontColor('#999999')
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  // Demo 卡片组件
  @Builder
  DemoCard(item: DemoItem) {
    Column() {
      Row() {
        Text(item.title)
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .layoutWeight(1)

        Text('→')
          .fontSize(20)
          .fontColor('#007DFF')
      }
      .width('100%')
      .margin({ bottom: 8 })

      Text(item.description)
        .fontSize(14)
        .fontColor('#666666')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .onClick(() => {
      router.pushUrl({
        url: item.route
      })
    })
  }
}
