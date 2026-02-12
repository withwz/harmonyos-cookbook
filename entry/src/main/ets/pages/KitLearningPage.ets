import router from '@ohos.router'

/**
 * Kit 学习导航页面
 * 集中管理各个 Kit 的学习 Demo
 */

interface KitItem {
  id: string
  name: string
  icon: string
  description: string
  status: 'done' | 'learning' | 'todo'
  route: string
}

@Entry
@Component
struct KitLearningPage {
  @State kits: Array<KitItem> = []

  aboutToAppear() {
    this.kits = [
      {
        id: '1',
        name: 'Network Kit',
        icon: '🌐',
        description: 'HTTP 网络请求、数据获取',
        status: 'done',
        route: 'pages/NetworkKitDemo'
      },
      {
        id: '2',
        name: 'Image Kit',
        icon: '🖼️',
        description: '图片加载、缓存、占位图',
        status: 'done',
        route: 'pages/ImageKitDemo'
      },
      {
        id: '3',
        name: 'Preferences Kit',
        icon: '💾',
        description: '轻量级数据存储',
        status: 'learning',
        route: 'pages/PreferencesKitDemo'
      },
      {
        id: '4',
        name: 'Notification Kit',
        icon: '🔔',
        description: '通知推送',
        status: 'todo',
        route: 'pages/NotificationKitDemo'
      },
      {
        id: '5',
        name: 'Location Kit',
        icon: '📍',
        description: '地理定位服务',
        status: 'todo',
        route: 'pages/LocationKitDemo'
      },
      {
        id: '6',
        name: 'Audio Kit',
        icon: '🎵',
        description: '音频播放、录制',
        status: 'todo',
        route: 'pages/AudioKitDemo'
      }
    ]
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        // 顶部导航
        Row() {
          Button('← 返回首页')
            .fontSize(14)
            .onClick(() => {
              router.pushUrl({
                url: 'pages/Index'
              })
            })
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 10 })

        // 标题
        Column({ space: 8 }) {
          Text('HarmonyOS Kit 学习')
            .fontSize(28)
            .fontWeight(FontWeight.Bold)

          Text('系统学习各个 Kit 模块的使用方法')
            .fontSize(14)
            .fontColor('#666')
        }
        .width('100%')
        .padding({ left: 16, right: 16, bottom: 20 })

        // 进度统计
        Row({ space: 16 }) {
          Column({ space: 4 }) {
            Text('已学习')
              .fontSize(12)
              .fontColor('#666')

            Text(`${this.getCompletedCount()}/${this.kits.length}`)
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#52C41A')
          }

          Column({ space: 4 }) {
            Text('进行中')
              .fontSize(12)
              .fontColor('#666')

            Text(`${this.getLearningCount()}/${this.kits.length}`)
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FAAD14')
          }
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
        .padding(16)
        .backgroundColor('#FFFBE6')
        .borderRadius(12)

        // Kit 列表
        List({ space: 12 }) {
          ForEach(this.kits, (kit: KitItem) => {
            ListItem() {
              this.KitCard(kit)
            }
          }, (kit: KitItem) => kit.id)
        }
        .width('100%')
        .padding({ left: 16, right: 16 })

        // 底部提示
        Column({ space: 8 }) {
          Text('💡 学习建议')
            .fontSize(14)
            .fontWeight(FontWeight.Medium)
            .width('100%')

          Text('按照 Network Kit → Image Kit → Preferences Kit → Notification Kit 的顺序学习')
            .fontSize(12)
            .fontColor('#666')
            .width('100%')

          Text('每个 Kit 都是实际开发中常用的功能模块')
            .fontSize(12)
            .fontColor('#999')
            .width('100%')
        }
        .width('100%')
        .padding({ left: 16, right: 16, bottom: 20 })
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  KitCard(kit: KitItem) {
    Row({ space: 16 }) {
      // 图标和名称
      Column({ space: 4 }) {
        Text(kit.icon)
          .fontSize(40)

        Text(kit.name)
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
      }

      Column({ space: 4 }) {
        Text(kit.description)
          .fontSize(14)
          .fontColor('#666')

        this.StatusBadge(kit.status)
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
    .onClick(() => {
      if (kit.status !== 'todo') {
        router.pushUrl({
          url: kit.route
        })
      }
    })
  }

  @Builder
  StatusBadge(status: string) {
    Row({ space: 4 }) {
      if (status === 'done') {
        Text('✓ 已完成')
          .fontSize(11)
          .fontColor('#52C41A')
          .padding({ left: 8, right: 8, top: 2, bottom: 2 })
          .backgroundColor('#F6FFED')
          .borderRadius(4)
      }

      if (status === 'learning') {
        Text('⏳ 学习中')
          .fontSize(11)
          .fontColor('#FAAD14')
          .padding({ left: 8, right: 8, top: 2, bottom: 2 })
          .backgroundColor('#FFF7E6')
          .borderRadius(4)
      }

      if (status === 'todo') {
        Text('🔒 即将开放')
          .fontSize(11)
          .fontColor('#999')
          .padding({ left: 8, right: 8, top: 2, bottom: 2 })
          .backgroundColor('#F5F5F5')
          .borderRadius(4)
      }
    }
  }

  private getCompletedCount(): number {
    return this.kits.filter((kit: KitItem) => kit.status === 'done').length
  }

  private getLearningCount(): number {
    return this.kits.filter((kit: KitItem) => kit.status === 'learning').length
  }

  aboutToAppear() {
    console.log('KitLearningPage aboutToAppear')
  }
}
