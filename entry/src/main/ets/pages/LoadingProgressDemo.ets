import router from '@ohos.router'

/**
 * LoadingProgress 加载进度组件演示
 * 展示各种加载状态的用法
 */

@Entry
@Component
struct LoadingProgressDemo {
  @State isLoading: boolean = false
  @State progress: number = 0

  build() {
    Scroll() {
      Column({ space: 20 }) {
        this.Header()

        // LoadingProgress 基础演示
        this.BasicLoading()

        // 全屏加载
        this.FullScreenLoading()

        // Progress 进度条
        this.ProgressSection()

        this.TipCard('加载组件要点：掌握LoadingProgress和Progress的使用场景')
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

      Text('加载进度')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .margin({ right: 40 })
    }
    .width('100%')
  }

  @Builder
  BasicLoading() {
    Column({ space: 12 }) {
      Text('LoadingProgress 基础')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('默认样式的加载指示器')
        .fontSize(14)
        .fontColor('#666')

      // LoadingProgress 组件
      Column() {
        LoadingProgress()
          .width(50)
          .height(50)
          .color('#007DFF')

        Text('加载中...')
          .fontSize(14)
          .fontColor('#999')
          .margin({ top: 12 })
      }
      .width('100%')
      .height(120)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#F8F8F8')
      .borderRadius(12)

      // 颜色示例
      Row({ space: 16 }) {
        Column({ space: 8 }) {
          LoadingProgress()
            .width(30)
            .height(30)
            .color('#FF6B6B')
          Text('红色')
            .fontSize(12)
            .fontColor('#999')
        }

        Column({ space: 8 }) {
          LoadingProgress()
            .width(30)
            .height(30)
            .color('#52C41A')
          Text('绿色')
            .fontSize(12)
            .fontColor('#999')
        }

        Column({ space: 8 }) {
          LoadingProgress()
            .width(30)
            .height(30)
            .color('#FAAD14')
          Text('橙色')
            .fontSize(12)
            .fontColor('#999')
        }
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ top: 12 })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  FullScreenLoading() {
    Column({ space: 12 }) {
      Text('全屏加载')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('点击按钮模拟数据加载')
        .fontSize(14)
        .fontColor('#666')

      // 模拟加载区域
      Stack({ alignContent: Alignment.Center }) {
        Column() {
          Text('数据内容区域')
            .fontSize(16)
            .fontColor('#666')
        }
        .width('100%')
        .height(150)
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#F8F8F8')
        .borderRadius(12)

        if (this.isLoading) {
          Column() {
            LoadingProgress()
              .width(40)
              .height(40)
              .color('#007DFF')

            Text('加载中...')
              .fontSize(14)
              .fontColor(Color.White)
              .margin({ top: 8 })
          }
          .width('100%')
          .height('100%')
          .backgroundColor('rgba(0, 0, 0, 0.7)')
          .borderRadius(12)
          .justifyContent(FlexAlign.Center)
        }
      }
      .width('100%')
      .height(150)

      Button(this.isLoading ? '加载中...' : '开始加载')
        .fontSize(14)
        .width('100%')
        .height(44)
        .backgroundColor(this.isLoading ? '#999' : '#007DFF')
        .borderRadius(8)
        .onClick(() => {
          if (this.isLoading) {
            return
          }
          this.isLoading = true
          setTimeout(() => {
            this.isLoading = false
          }, 2000)
        })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  ProgressSection() {
    Column({ space: 12 }) {
      Text('Progress 进度条')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('显示任务完成进度')
        .fontSize(14)
        .fontColor('#666')

      // 进度条
      Column({ space: 8 }) {
        Row() {
          Text('下载进度')
            .fontSize(14)
            .fontColor('#666')
            .layoutWeight(1)

          Text(`${Math.round(this.progress)}%`)
            .fontSize(14)
            .fontColor('#007DFF')
        }
        .width('100%')

        Progress({ value: this.progress, total: 100 })
          .width('100%')
          .height(8)
          .color('#007DFF')
          .backgroundColor('#F0F0F0')
      }
      .width('100%')

      // 不同样式的进度条
      Column({ space: 12 }) {
        Text('不同样式:')
          .fontSize(14)
          .fontColor('#666')
          .width('100%')

        // 线性进度条
        Progress({ value: 30, total: 100, type: ProgressType.Linear })
          .width('100%')
          .color('#52C41A')

        // 环形进度条
        Row({ space: 16 }) {
          Progress({ value: 60, total: 100, type: ProgressType.Ring })
            .width(40)
            .height(40)
            .color('#FAAD14')

          Progress({ value: 85, total: 100, type: ProgressType.Ring })
            .width(40)
            .height(40)
            .color('#FF6B6B')
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
      }
      .width('100%')
      .margin({ top: 12 })

      // 控制按钮
      Row({ space: 12 }) {
        Button('-')
          .fontSize(16)
          .width(60)
          .height(40)
          .backgroundColor('#FF6B6B')
          .borderRadius(8)
          .onClick(() => {
            this.progress = Math.max(0, this.progress - 10)
          })

        Button('+')
          .fontSize(16)
          .width(60)
          .height(40)
          .backgroundColor('#52C41A')
          .borderRadius(8)
          .onClick(() => {
            this.progress = Math.min(100, this.progress + 10)
          })

        Button('重置')
          .fontSize(14)
          .width(80)
          .height(40)
          .backgroundColor('#999')
          .borderRadius(8)
          .onClick(() => {
            this.progress = 0
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 12 })
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
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
