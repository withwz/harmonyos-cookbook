import router from '@ohos.router'

/**
 * 页面路由与生命周期演示
 *
 * 涵盖：
 * - 页面跳转方式
 * - 参数传递
 * - 生命周期钩子
 */

interface RouteItem {
  title: string
  route: string
  description: string
  color: string
}

@Entry
@Component
struct RouterDemo {
  @State lifecycleLog: Array<string> = []

  build() {
    Column() {
      // 标题
      Text('页面路由与生命周期')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('学习页面跳转、参数传递、生命周期')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 20 })

      // 生命周期日志
      Column({ space: 8 }) {
        Row() {
          Text('生命周期日志')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)

          Button('清空')
            .fontSize(12)
            .onClick(() => {
              this.lifecycleLog = []
            })
        }
        .width('100%')

        List({ space: 4 }) {
          ForEach(this.lifecycleLog, (log: string) => {
            ListItem() {
              Text(log)
                .fontSize(12)
                .fontColor('#666')
            }
          }, (log: string) => log)
        }
        .width('100%')
        .height(150)
        .padding(8)
        .backgroundColor('#F8F8F8')
        .borderRadius(8)
      }
      .width('100%')
      .padding({ left: 16, right: 16 })
      .layoutWeight(1)

      // 路由演示列表
      Column({ space: 12 }) {
        Text('路由演示')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .width('100%')
          .padding({ left: 16, right: 16 })
          .margin({ bottom: 8 })

        this.RouteButton(
          '基础跳转 (pushUrl)',
          '最简单的页面跳转方式',
          '#007DFF',
          () => {
            router.pushUrl({
              url: 'pages/RouterTargetPage'
            })
          }
        )

        this.RouteButton(
          '带参数跳转',
          '跳转时传递参数到目标页面',
          '#52C41A',
          () => {
            router.pushUrl({
              url: 'pages/RouterTargetPage',
              params: {
                from: 'RouterDemo',
                message: '你好，目标页面！',
                timestamp: Date.now()
              }
            })
          }
        )

        this.RouteButton(
          'Router.replaceUrl',
          '替换当前页面，无法返回',
          '#FF6B6B',
          () => {
            router.replaceUrl({
              url: 'pages/RouterTargetPage',
              params: {
                from: 'RouterDemo (replaceUrl)',
                message: '当前页面被替换'
              }
            })
          }
        )

        this.RouteButton(
          'Router.back()',
          '返回上一页',
          '#722ED1',
          () => {
            router.back()
          }
        )

        this.RouteButton(
          'Router.back() 带参数',
          '返回上一页并传递数据',
          '#FA8C16',
          () => {
            router.back({
              url: 'pages/Index',
              params: {
                result: '从RouterDemo返回的数据'
              }
            })
          }
        )
      }
      .width('100%')
      .padding({ left: 16, right: 16, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  RouteButton(title: string, desc: string, color: string, onClick: () => void) {
    Column({ space: 4 }) {
      Text(title)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Text(desc)
        .fontSize(12)
        .fontColor('#666')
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .border({ width: 4, color: color })
    .onClick(onClick)
  }

  // 添加日志
  private addLog(message: string) {
    const time = new Date().toLocaleTimeString()
    this.lifecycleLog.unshift(`[${time}] ${message}`)
    if (this.lifecycleLog.length > 50) {
      this.lifecycleLog = this.lifecycleLog.slice(0, 50)
    }
  }

  // ==================== 生命周期钩子 ====================
  aboutToAppear() {
    this.addLog('✅ aboutToAppear - 页面即将出现')
  }

  aboutToDisappear() {
    this.addLog('❌ aboutToDisappear - 页面即将消失')
  }

  onPageShow() {
    this.addLog('👁️ onPageShow - 页面已显示')
  }

  onPageHide() {
    this.addLog('🙈 onPageHide - 页面已隐藏')
  }
}
