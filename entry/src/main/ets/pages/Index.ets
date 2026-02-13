import router from '@ohos.router'

// Demo 项目信息接口
interface DemoItem {
  icon: string
  title: string
  description: string
  route: string
  color: string
}

@Entry
@Component
struct Index {
  @State demos: Array<DemoItem> = []

  aboutToAppear() {
    this.demos = [
      {
        icon: '🎨',
        title: '装饰器学习',
        description: 'State/Prop/Link/Builder',
        route: 'pages/DecoratorDemo',
        color: '#007DFF'
      },
      {
        icon: '📐',
        title: '布局学习',
        description: 'Column/Row/Grid/Flex',
        route: 'pages/LayoutDemo',
        color: '#52C41A'
      },
      {
        icon: '🔗',
        title: '路由学习',
        description: '页面跳转/生命周期',
        route: 'pages/RouterDemo',
        color: '#FAAD14'
      },
      {
        icon: '📝',
        title: '语法学习',
        description: 'ArkTS vs TS',
        route: 'pages/ArkTSSyntaxDemo',
        color: '#9C27B0'
      },
      {
        icon: '🔘',
        title: '按钮与选择',
        description: 'Button/Toggle/Checkbox等',
        route: 'pages/ButtonAndSelectDemo',
        color: '#FF6B6B'
      },
      {
        icon: '🖼️',
        title: '图片与视频',
        description: 'Image/Video',
        route: 'pages/MediaDemo',
        color: '#FA541C'
      },
      {
        icon: '🧭',
        title: '导航与切换',
        description: 'Tabs/TabContent',
        route: 'pages/NavigationDemo',
        color: '#EB2F96'
      },
      {
        icon: '📊',
        title: '信息展示',
        description: 'Progress/Dialog',
        route: 'pages/InfoDisplayDemo',
        color: '#13C2C2'
      },
      {
        icon: '👆',
        title: '手势组件',
        description: 'Tap/Pan/Pinch',
        route: 'pages/GestureDemo',
        color: '#A020F0'
      },
      {
        icon: '🎬',
        title: '动画组件',
        description: 'animateTo/transition',
        route: 'pages/AnimationDemo',
        color: '#F753AB'
      },
      {
        icon: '💬',
        title: '弹窗组件',
        description: 'AlertDialog/Popup',
        route: 'pages/DialogDemo',
        color: '#FF4D4F'
      },
      {
        icon: '🎨',
        title: '画布绘制',
        description: 'Canvas 2D',
        route: 'pages/CanvasDemo',
        color: '#8E44AD'
      },
      {
        icon: '📦',
        title: 'Kit学习',
        description: 'Network/Image',
        route: 'pages/KitLearningPage',
        color: '#6F42C1'
      }
    ]
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        // 顶部标题
        this.Header()

        // Demo 两列网格
        Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceBetween }) {
          ForEach(this.demos, (item: DemoItem) => {
            this.DemoCard(item)
          }, (item: DemoItem) => item.route)
        }
        .width('100%')
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
    Column({ space: 8 }) {
      Text('HarmonyOS Demo')
        .fontSize(32)
        .fontWeight(FontWeight.Bold)
        .fontColor('#1F1F1F')

      Text('ArkTS 组件学习演示')
        .fontSize(14)
        .fontColor('#666')
    }
    .width('100%')
    .padding(20)
    .backgroundColor('#FFF7E6')
    .borderRadius(12)
  }

  @Builder
  DemoCard(item: DemoItem) {
    Column({ space: 12 }) {
      // 图标
      Text(item.icon)
        .fontSize(48)

      // 标题
      Text(item.title)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor('#1F1F1F')

      // 描述
      Text(item.description)
        .fontSize(12)
        .fontColor('#999')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      // 按钮
      Button('开始学习')
        .fontSize(12)
        .width('100%')
        .height(32)
        .backgroundColor(item.color)
        .borderRadius(8)
        .fontColor(Color.White)
        .onClick(() => {
          router.pushUrl({
            url: item.route
          })
        })
    }
    .width('48%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 8, color: '#10000000', offsetX: 0, offsetY: 2 })
    .margin({ bottom: 12 })
  }
}
