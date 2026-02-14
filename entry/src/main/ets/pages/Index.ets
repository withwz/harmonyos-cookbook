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
  @State expandedCategoryName: string = '' // ⭐ 改用 name 作为状态标识
  @State searchKeyword: string = ''
  @State filteredCategories: Array<CategoryItem> = []
  @State isSearching: boolean = false

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
            icon: '🎚',
            title: '选择器',
            description: 'Picker/Select',
            route: 'pages/PickerDemo',
            color: '#FA541C'
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
          },
          {
            icon: '🗃️',
            title: '全局状态',
            description: 'AppStorage',
            route: 'pages/AppStorageDemo',
            color: '#6F42C1'
          },
          {
            icon: '💾',
            title: '持久化存储',
            description: 'PersistentStorage',
            route: 'pages/PersistentStorageDemo',
            color: '#13C2C2'
          },
          {
            icon: '🎚',
            title: '选择器',
            description: 'Picker/Select',
            route: 'pages/PickerDemo',
            color: '#FA541C'
          },
          {
            icon: '📦',
            title: '半模态面板',
            description: 'Panel',
            route: 'pages/PanelDemo',
            color: '#722ED1'
          },
          {
            icon: '📏',
            title: '徽标',
            description: 'Badge',
            route: 'pages/BadgeDemo',
            color: '#F5222D'
          },
          {
            icon: '➖',
            title: '分割线',
            description: 'Divider',
            route: 'pages/DividerDemo',
            color: '#8E44AD'
          },
          {
            icon: '⬜',
            title: '空白填充',
            description: 'Blank',
            route: 'pages/BlankDemo',
            color: '#13C2C2'
          },
          {
            icon: '📋',
            title: '操作列表',
            description: 'ActionSheet',
            route: 'pages/ActionSheetDemo',
            color: '#FAAD14'
          },
          {
            icon: '📑',
            title: '标签页',
            description: 'Tabs',
            route: 'pages/TabsDemo',
            color: '#52C41A'
          },
          {
            icon: '🔍',
            title: '搜索框',
            description: 'Search',
            route: 'pages/SearchDemo',
            color: '#007DFF'
          },
          {
            icon: '🔘',
            title: '开关组件',
            description: 'Toggle',
            route: 'pages/ToggleDemo',
            color: '#52C41A'
          },
          {
            icon: '💾',
            title: '页面状态',
            description: 'LocalStorage',
            route: 'pages/LocalStorageDemo',
            color: '#13C2C2'
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
          },
          {
            icon: '🔗',
            title: 'RPC通信',
            description: '进程间通信',
            route: 'pages/RPCDemo',
            color: '#FA541C'
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

        // 搜索框
        this.SearchBar()

        // 手风琴分类列表
        if (this.isSearching) {
          // 搜索模式：直接显示所有匹配的 Demo
          Column({ space: 12 }) {
            ForEach(this.filteredCategories, (category: CategoryItem) => {
              Column({ space: 8 }) {
                // 分类标题
                Text(category.name + ' (' + category.demos.length + ')')
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium)
                  .fontColor('#666')
                  .width('100%')
                  .padding({ left: 12, right: 12, top: 8, bottom: 8 })
                  .backgroundColor('#E8E8E8')
                  .borderRadius(8)

                // 该分类下的所有匹配 Demo
                ForEach(category.demos, (demo: DemoItem) => {
                  this.DemoItemRow(demo)
                }, (demo: DemoItem) => demo.route)
              }
              .width('100%')
            }, (category: CategoryItem) => category.name)
          }
          .width('100%')
        } else {
          // 正常模式：手风琴分类列表
          Column({ space: 12 }) {
            ForEach(this.categories, (category: CategoryItem, index: number) => {
              this.CategoryCard(category, index)
            }, (category: CategoryItem, index: number) => category.name)
          }
          .width('100%')
        }
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

        Text(this.expandedCategoryName === category.name ? '▼' : '▶')
          .fontSize(14)
          .fontColor('#999')
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor(category.color)
      .borderRadius(12)
      .onClick(() => {
        if (this.expandedCategoryName === category.name) {
          this.expandedCategoryName = ''
        } else {
          this.expandedCategoryName = category.name
        }
      })

      // 展开的Demo列表
      if (this.expandedCategoryName === category.name) {
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

  @Builder
  SearchBar() {
    Row({ space: 8 }) {
      TextInput({ placeholder: '搜索 Demo...', text: $$this.searchKeyword })
        .layoutWeight(1)
        .height(40)
        .padding({ left: 12, right: 12 })
        .backgroundColor(Color.White)
        .borderRadius(20)
        .onChange((value: string) => {
          this.searchKeyword = value
          this.onSearch(value)
        })

      if (this.isSearching) {
        Button('清空')
          .height(40)
          .padding({ left: 16, right: 16 })
          .backgroundColor('#FF6B6B')
          .borderRadius(20)
          .onClick(() => {
            this.searchKeyword = ''
            this.isSearching = false
            this.filteredCategories = []
            this.expandedCategoryName = ''
          })
      }
    }
    .width('100%')
    .padding({ left: 16, right: 16 })
  }

  onSearch(keyword: string) {

    if (keyword.length === 0) {
      this.isSearching = false
      this.filteredCategories = []
      return
    }

    this.isSearching = true
    const result: Array<CategoryItem> = []
    const lowerKeyword = keyword.toLowerCase()

    for (let i = 0; i < this.categories.length; i++) {
      const category = this.categories[i]
      const matchedDemos: Array<DemoItem> = []

      for (let j = 0; j < category.demos.length; j++) {
        const demo = category.demos[j]
        const titleMatch = demo.title.toLowerCase().indexOf(lowerKeyword) >= 0
        const descMatch = demo.description.toLowerCase().indexOf(lowerKeyword) >= 0

        if (titleMatch || descMatch) {
          matchedDemos.push(demo)
        }
      }

      if (matchedDemos.length > 0) {
        result.push({
          name: category.name,
          icon: category.icon,
          color: category.color,
          demos: matchedDemos
        })
      }
    }


    this.filteredCategories = result

    // 搜索时，展开 filteredCategories 的第一个分类
    if (result.length > 0) {
      this.expandedCategoryName = result[0].name
    }
  }
}
