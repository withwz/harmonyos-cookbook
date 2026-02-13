import router from '@ohos.router'

/**
 * Refresh 下拉刷新组件演示
 * 展示下拉刷新和上拉加载的用法
 */

@Entry
@Component
struct RefreshDemo {
  @State listItems: Array<string> = []
  @State isRefreshing: boolean = false
  @State isLoading: boolean = false

  aboutToAppear() {
    this.loadData()
  }

  loadData() {
    this.listItems = []
    for (let i = 1; i <= 10; i++) {
      this.listItems.push(`列表项 ${i}`)
    }
  }

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.Header()

        // Refresh 基础演示
        this.BasicRefresh()

        // 上拉加载更多
        this.LoadMoreSection()

        this.TipCard('下拉刷新要点：掌握onRefresh事件和加载状态管理')
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
    Row() {
      Button() {
        Text('←')
          .fontSize(20)
          .fontColor(Color.White)
      }
      .width(40)
      .height(40)
      .backgroundColor('#007DFF')
      .borderRadius(20)
      .onClick(() => {
        router.back()
      })

      Text('下拉刷新')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .margin({ right: 40 })
    }
    .width('100%')
  }

  @Builder
  BasicRefresh() {
    Column({ space: 12 }) {
      Text('Refresh 下拉刷新')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('下拉列表获取最新数据')
        .fontSize(14)
        .fontColor('#666')

      // Refresh 组件
      Refresh({ refreshing: $$this.isRefreshing }) {
        List({ space: 8 }) {
          ForEach(this.listItems, (item: string, index: number) => {
            ListItem() {
              Row() {
                Text(`${index + 1}. ${item}`)
                  .fontSize(16)
                  .fontColor('#333')
                  .layoutWeight(1)

                Text('→')
                  .fontSize(20)
                  .fontColor('#999')
              }
              .width('100%')
              .height(60)
              .padding({ left: 16, right: 16 })
              .backgroundColor(Color.White)
              .borderRadius(8)
            }
          }, (item: string, index: number) => index.toString())
        }
        .width('100%')
        .height(400)
        .divider({ strokeWidth: 1, color: '#F0F0F0' })
      }
      .width('100%')
      .backgroundColor('#F8F8F8')
      .borderRadius(12)
      .onRefreshing(() => {
        setTimeout(() => {
          this.loadData()
          this.isRefreshing = false
        }, 2000)
      })

      // 状态提示
      if (this.isRefreshing) {
        Text('正在刷新...')
          .fontSize(14)
          .fontColor('#007DFF')
          .width('100%')
          .textAlign(TextAlign.Center)
          .margin({ top: 8 })
      }

      // 说明
      Column({ space: 8 }) {
        Text('配置说明:')
          .fontSize(14)
          .fontColor('#666')

        Text('• refreshing: $$isRefreshing - 绑定刷新状态')
          .fontSize(12)
          .fontColor('#999')

        Text('• onRefreshing() - 刷新事件回调')
          .fontSize(12)
          .fontColor('#999')

        Text('• 实际开发中结合网络请求获取数据')
          .fontSize(12)
          .fontColor('#999')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#E6F7FF')
      .borderRadius(8)
      .margin({ top: 12 })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  LoadMoreSection() {
    Column({ space: 12 }) {
      Text('上拉加载更多')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('滚动到底部自动加载更多数据')
        .fontSize(14)
        .fontColor('#666')

      // 带加载更多的列表
      Column() {
        List({ space: 8 }) {
          ForEach(this.listItems, (item: string, index: number) => {
            ListItem() {
              Row() {
                Text(`${index + 1}. ${item}`)
                  .fontSize(16)
                  .fontColor('#333')
                  .layoutWeight(1)
              }
              .width('100%')
              .height(60)
              .padding({ left: 16, right: 16 })
              .backgroundColor(Color.White)
              .borderRadius(8)
            }
          }, (item: string, index: number) => index.toString())

          // 加载更多指示器
          ListItem() {
            Column() {
              if (this.isLoading) {
                Text('加载中...')
                  .fontSize(14)
                  .fontColor('#999')
              } else {
                Text('上拉加载更多')
                  .fontSize(14)
                  .fontColor('#007DFF')
                  .onClick(() => {
                    this.loadMore()
                  })
              }
            }
            .width('100%')
            .height(50)
            .justifyContent(FlexAlign.Center)
          }
        }
        .width('100%')
        .height(300)
        .divider({ strokeWidth: 1, color: '#F0F0F0' })
        .onReachEnd(() => {
          this.loadMore()
        })
      }
      .width('100%')
      .backgroundColor('#F8F8F8')
      .borderRadius(12)

      // 说明
      Column({ space: 8 }) {
        Text('上拉加载实现:')
          .fontSize(14)
          .fontColor('#666')

        Text('• onReachEnd() - 滚动到底部触发')
          .fontSize(12)
          .fontColor('#999')

        Text('• 添加加载状态指示器')
          .fontSize(12)
          .fontColor('#999')

        Text('• 数据加载完成后追加到列表')
          .fontSize(12)
          .fontColor('#999')
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#FFF3E0')
      .borderRadius(8)
      .margin({ top: 12 })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  loadMore() {
    if (this.isLoading) {
      return
    }
    this.isLoading = true
    setTimeout(() => {
      const startLen = this.listItems.length
      for (let i = 1; i <= 5; i++) {
        this.listItems.push(`新项 ${startLen + i}`)
      }
      this.isLoading = false
    }, 1500)
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
