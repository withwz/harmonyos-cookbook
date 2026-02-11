import router from '@ohos.router'

/**
 * List 布局演示
 *
 * List 是可滚动列表容器
 * 适用于显示大量数据，支持懒加载
 */

interface ListItemData {
  title: string
  desc: string
  icon: string
}

interface SettingItem {
  title: string
  icon: string
}

@Entry
@Component
struct ListLayoutDemo {
  private chatList: Array<ListItemData> = []

  private settingsList: Array<SettingItem> = []

  aboutToAppear() {
    this.chatList = [
      { title: '张三', desc: '你好，在吗？', icon: '👤' },
      { title: '李四', desc: '周末有空一起吃饭吗', icon: '👩' },
      { title: '王五', desc: '项目进展如何了', icon: '🧑' },
      { title: '产品群', desc: '[图片]', icon: '👥' },
      { title: '开发群', desc: '@所有人 请注意', icon: '💬' }
    ]

    this.settingsList = [
      { title: '账号与安全', icon: '🔒' },
      { title: '通知设置', icon: '🔔' },
      { title: '隐私设置', icon: '🛡️' },
      { title: '通用设置', icon: '⚙️' },
      { title: '关于', icon: 'ℹ️' }
    ]
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.BackButton()
        this.SectionTitle('List 列表布局')

        this.InfoCard('List 是可滚动列表容器，支持纵向和横向滚动')

        // 示例1：基础列表
        this.BasicSection()

        // 示例2：分组列表
        this.GroupSection()

        // 示例3：横向列表
        this.HorizontalSection()

        // 示例4：实战案例
        this.ChatListSection()
        this.SettingsListSection()

        this.TipCard('List 要点：必须提供唯一key、支持懒加载、space设置项间距')
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  BasicSection() {
    Column({ space: 12 }) {
      Text('示例1：基础列表')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      List({ space: 8 }) {
        ForEach(['项目1', '项目2', '项目3', '项目4', '项目5'], (item: string) => {
          ListItem() {
            Row() {
              Text(item)
                .fontSize(14)
                .layoutWeight(1)

              Text('>')
                .fontSize(14)
                .fontColor('#999')
            }
            .width('100%')
            .padding(16)
            .backgroundColor(Color.White)
            .borderRadius(8)
          }
        }, (item: string) => item)
      }
      .width('100%')
      .height(200)
    }
    .width('100%')
  }

  @Builder
  GroupSection() {
    Column({ space: 12 }) {
      Text('示例2：分组列表 (ListItemGroup)')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      List() {
        // 分组1
        ListItemGroup({ header: this.GroupHeader('A组'), footer: this.GroupFooter('共3项') }) {
          ForEach(['A1', 'A2', 'A3'], (item: string) => {
            ListItem() {
              Text(item)
                .fontSize(14)
                .width('100%')
                .padding(12)
                .textAlign(TextAlign.Center)
                .backgroundColor('#F8F8F8')
                .borderRadius(4)
            }
          }, (item: string) => item)
        }

        // 分组2
        ListItemGroup({ header: this.GroupHeader('B组'), footer: this.GroupFooter('共2项') }) {
          ForEach(['B1', 'B2'], (item: string) => {
            ListItem() {
              Text(item)
                .fontSize(14)
                .width('100%')
                .padding(12)
                .textAlign(TextAlign.Center)
                .backgroundColor('#F8F8F8')
                .borderRadius(4)
            }
          }, (item: string) => item)
        }
      }
      .width('100%')
      .height(240)
    }
    .width('100%')
  }

  @Builder
  GroupHeader(title: string) {
    Text(title)
      .fontSize(14)
      .fontWeight(FontWeight.Medium)
      .width('100%')
      .padding(12)
      .backgroundColor('#E6E6E6')
  }

  @Builder
  GroupFooter(desc: string) {
    Text(desc)
      .fontSize(12)
      .fontColor('#999')
      .width('100%')
      .padding(8)
      .textAlign(TextAlign.Center)
  }

  @Builder
  HorizontalSection() {
    Column({ space: 12 }) {
      Text('示例3：横向列表 (listDirection)')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      List({ space: 12 }) {
        ForEach(['推荐1', '推荐2', '推荐3', '推荐4', '推荐5'], (item: string) => {
          ListItem() {
            Column({ space: 8 }) {
              Text('🎬')
                .fontSize(32)

              Text(item)
                .fontSize(12)
                .fontColor('#666')
            }
            .width(100)
            .height(120)
            .justifyContent(FlexAlign.Center)
            .backgroundColor('#F8F8F8')
            .borderRadius(8)
          }
        }, (item: string) => item)
      }
      .listDirection(Axis.Horizontal)
      .width('100%')
      .height(150)
    }
    .width('100%')
  }

  @Builder
  ChatListSection() {
    Column({ space: 12 }) {
      Text('示例4：实战案例 - 聊天列表')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      List() {
        ForEach(this.chatList, (item: ListItemData) => {
          ListItem() {
            Row({ space: 12 }) {
              Text(item.icon)
                .fontSize(40)

              Column({ space: 4 }) {
                Text(item.title)
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium)

                Text(item.desc)
                  .fontSize(14)
                  .fontColor('#999')
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)

              Text('12:30')
                .fontSize(12)
                .fontColor('#999')
            }
            .width('100%')
            .padding(12)
            .backgroundColor(Color.White)
            .borderRadius(8)
          }
        }, (item: ListItemData) => item.title)
      }
      .width('100%')
      .height(300)
    }
    .width('100%')
  }

  @Builder
  SettingsListSection() {
    Column({ space: 12 }) {
      Text('示例5：实战案例 - 设置列表')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      List({ space: 1 }) {
        ForEach(this.settingsList, (item: SettingItem) => {
          ListItem() {
            Row({ space: 12 }) {
              Text(item.icon)
                .fontSize(24)

              Text(item.title)
                .fontSize(16)
                .layoutWeight(1)

              Text('>')
                .fontSize(16)
                .fontColor('#999')
            }
            .width('100%')
            .height(50)
            .padding({ left: 16, right: 16 })
            .backgroundColor(Color.White)
          }
        }, (item: SettingItem) => item.title)
      }
      .width('100%')
      .height(280)
      .borderRadius(8)
      .divider({
        strokeWidth: 1,
        color: '#F0F0F0',
        startMargin: 52,
        endMargin: 0
      })
    }
    .width('100%')
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
      .fontColor('#13C2C2')
      .width('100%')
      .padding(12)
      .backgroundColor('#E6FFFE')
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
  }
}
