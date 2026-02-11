import router from '@ohos.router'

/**
 * 鸿蒙布局学习导航页
 * 涵盖 Column, Row, Stack, Grid, Flex, List 等布局方式
 */

interface LayoutItem {
  title: string
  route: string
  description: string
  color: string
}

@Entry
@Component
struct LayoutDemo {
  private layoutList: Array<LayoutItem> = [
    {
      title: 'Column 布局',
      route: 'pages/ColumnLayoutDemo',
      description: '垂直线性布局 - 子元素垂直排列',
      color: '#007DFF'
    },
    {
      title: 'Row 布局',
      route: 'pages/RowLayoutDemo',
      description: '水平线性布局 - 子元素水平排列',
      color: '#52C41A'
    },
    {
      title: 'Stack 布局',
      route: 'pages/StackLayoutDemo',
      description: '层叠布局 - 子元素堆叠显示',
      color: '#FF6B6B'
    },
    {
      title: 'Grid 布局',
      route: 'pages/GridLayoutDemo',
      description: '网格布局 - 多列网格排列',
      color: '#722ED1'
    },
    {
      title: 'Flex 布局',
      route: 'pages/FlexLayoutDemo',
      description: '弹性布局 - 自适应排列',
      color: '#FA8C16'
    },
    {
      title: 'List 布局',
      route: 'pages/ListLayoutDemo',
      description: '列表布局 - 可滚动列表',
      color: '#13C2C2'
    }
  ]

  build() {
    Column() {
      // 标题
      Text('鸿蒙布局学习')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('通过实际示例学习 ArkUI 布局组件')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 20 })

      // 布局列表
      List({ space: 12 }) {
        ForEach(this.layoutList, (item: LayoutItem) => {
          ListItem() {
            this.LayoutCard(item)
          }
        }, (item: LayoutItem) => item.title)
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 16, right: 16 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  LayoutCard(item: LayoutItem) {
    Row() {
      // 色块
      Row()
        .width(8)
        .height(60)
        .backgroundColor(item.color)
        .borderRadius({ topLeft: 8, bottomLeft: 8 })
        .margin({ right: 12 })

      Column({ space: 4 }) {
        Text(item.title)
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor(item.color)

        Text(item.description)
          .fontSize(14)
          .fontColor('#666666')
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Text('→')
        .fontSize(20)
        .fontColor('#999999')
        .margin({ left: 8 })
    }
    .width('100%')
    .height(80)
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
