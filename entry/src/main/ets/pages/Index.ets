import router from '@ohos.router'

// Demo 项目信息接口
interface DemoItem {
  icon: string
  title: string
  description: string
  route: string
  color: string
}

// 分类接口
interface CategoryItem {
  name: string
  icon: string
  color: string
  demos: Array<DemoItem>
}

@Entry
@Component
struct Index {
  @State categories: Array<CategoryItem> = []
  @State expandedIndex: number = 0

  aboutToAppear() {
    this.categories = [
      {
        name: '基础语法',
        icon: '📝',
        color: '#007DFF',
        demos: [
          {
            icon: '🎨',
            title: '装饰器学习',
            description: 'State/Prop/Link/Builder',
            route: 'pages/DecoratorDemo',
            color: '#007DFF'
          },
          {
            icon: '📐',
            title: '语法学习',
            description: 'ArkTS vs TS',
            route: 'pages/ArkTSSyntaxDemo',
            color: '#52C41A'
          }
        ]
      },
      {
        name: '布局组件',
        icon: '📐',
        color: '#52C41A',
        demos: [
          {
            icon: '📐',
            title: '布局学习',
            description: 'Column/Row/Grid/Flex',
            route: 'pages/LayoutDemo',
            color: '#52C41A'
          }
        ]
      },
      {
        name: '交互组件',
        icon: '👆',
        color: '#FF6B6B',
        demos: [
          {
            icon: '🔘',
            title: '按钮与选择',
            description: 'Button/Toggle/Checkbox等',
            route: 'pages/ButtonAndSelectDemo',
            color: '#FF6B6B'
          },
          {
            icon: '🧭',
            title: '导航与切换',
            description: 'Tabs/TabContent',
            route: 'pages/NavigationDemo',
            color: '#EB2F96'
          }
        ]
      },
      {
        name: '展示组件',
        icon: '🖼️',
        color: '#FA541C',
        demos: [
          {
            icon: '🖼️',
            title: '图片与视频',
            description: 'Image/Video',
            route: 'pages/MediaDemo',
            color: '#FA541C'
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
            icon: '🎠',
            title: '轮播组件',
            description: 'Swiper',
            route: 'pages/SwiperDemo',
            color: '#FF6B6B'
          },
          {
            icon: '🔄',
            title: '下拉刷新',
            description: 'Refresh',
            route: 'pages/RefreshDemo',
            color: '#13C2C2'
          },
          {
            icon: '⏳',
            title: '加载进度',
            description: 'LoadingProgress/Progress',
            route: 'pages/LoadingProgressDemo',
            color: '#9C27B0'
          },
          {
            icon: '📜',
            title: '滚动容器',
            description: 'Scroll',
            route: 'pages/ScrollDemo',
            color: '#722ED1'
          },
          {
            icon: '🧭',
            title: '导航组件',
            description: 'Navigator',
            route: 'pages/NavigatorDemo',
            color: '#FA541C'
          }
        ]
      },
      {
        name: '高级功能',
        icon: '🚀',
        color: '#8E44AD',
        demos: [
          {
            icon: '🎨',
            title: '画布绘制',
            description: 'Canvas 2D',
            route: 'pages/CanvasDemo',
            color: '#8E44AD'
          },
          {
            icon: '🔗',
            title: '路由学习',
            description: '页面跳转/生命周期',
            route: 'pages/RouterDemo',
            color: '#FAAD14'
          }
        ]
      },
      {
        name: 'Kit学习',
        icon: '📦',
        color: '#6F42C1',
        demos: [
          {
            icon: '📦',
            title: 'Kit学习',
            description: 'Network/Image',
            route: 'pages/KitLearningPage',
            color: '#6F42C1'
          }
        ]
      }
    ]
  }

  build() {
    Scroll() {
      Column({ space: 12 }) {
        // 顶部标题
        this.Header()

        // 手风琴分类列表
        Column({ space: 12 }) {
          ForEach(this.categories, (category: CategoryItem, index: number) => {
            this.CategoryCard(category, index)
          }, (category: CategoryItem, index: number) => index.toString())
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
  CategoryCard(category: CategoryItem, index: number) {
    Column({ space: 0 }) {
      // 分类标题栏
      Row() {
        Text(category.icon)
          .fontSize(24)

        Text(category.name)
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor('#1F1F1F')
          .margin({ left: 12 })
          .layoutWeight(1)

        Text(this.expandedIndex === index ? '▼' : '▶')
          .fontSize(14)
          .fontColor('#999')
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor(category.color)
      .borderRadius(12)
      .onClick(() => {
        if (this.expandedIndex === index) {
          this.expandedIndex = -1
        } else {
          this.expandedIndex = index
        }
      })

      // 展开的Demo列表
      if (this.expandedIndex === index) {
        Column({ space: 8 }) {
          ForEach(category.demos, (demo: DemoItem) => {
            this.DemoItemRow(demo)
          }, (demo: DemoItem) => demo.route)
        }
        .width('100%')
        .padding(12)
        .backgroundColor(Color.White)
        .borderRadius({ bottomLeft: 12, bottomRight: 12 })
        .margin({ top: 4 })
        .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
      }
    }
    .width('100%')
  }

  @Builder
  DemoItemRow(demo: DemoItem) {
    Row() {
      Text(demo.icon)
        .fontSize(28)

      Column({ space: 4 }) {
        Text(demo.title)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#1F1F1F')

        Text(demo.description)
          .fontSize(12)
          .fontColor('#999')
      }
      .alignItems(HorizontalAlign.Start)
      .margin({ left: 12 })
      .layoutWeight(1)

      Text('→')
        .fontSize(20)
        .fontColor(demo.color)
    }
    .width('100%')
    .height(64)
    .padding({ left: 12, right: 12 })
    .backgroundColor('#F8F8F8')
    .borderRadius(8)
    .onClick(() => {
      router.pushUrl({
        url: demo.route
      })
    })
  }
}
