import router from '@ohos.router'

/**
 * 路由目标页面
 * 接收参数、展示生命周期
 */

interface RouterParams {
  from?: string
  message?: string
  timestamp?: number
}

@Entry
@Component
struct RouterTargetPage {
  @State paramsFrom: string = '无'
  @State message: string = '无'
  @State timestamp: number = 0
  @State lifecycleLog: Array<string> = []

  build() {
    Column() {
      // 顶部信息栏
      Row() {
        Button('← 返回')
          .fontSize(14)
          .onClick(() => {
            router.back()
          })

        Text('目标页面')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)

        Button('返回首页')
          .fontSize(14)
          .onClick(() => {
            router.pushUrl({
              url: 'pages/Index'
            })
          })
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 10, bottom: 10 })

      Scroll() {
        Column({ space: 16 }) {
          // 接收到的参数
          Column({ space: 12 }) {
            Row() {
              Text('接收到的参数')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .layoutWeight(1)
            }
            .width('100%')

            Column({ space: 8 }) {
              this.ParamItem('来源', this.paramsFrom)
              this.ParamItem('消息', this.message)
              this.ParamItem('时间戳', this.timestamp > 0 ? new Date(this.timestamp).toLocaleString() : '无')
            }
            .width('100%')
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Color.White)
          .borderRadius(12)

          // 生命周期日志
          Column({ space: 8 }) {
            Row() {
              Text('页面生命周期日志')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .layoutWeight(1)

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
            .height(180)
            .padding(8)
            .backgroundColor('#F8F8F8')
            .borderRadius(8)
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Color.White)
          .borderRadius(12)

          // 生命周期说明
          Column({ space: 12 }) {
            Text('生命周期说明')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)

            Column({ space: 8 }) {
              this.LifecycleItem('aboutToAppear', '页面创建时调用，初始化数据')
              this.LifecycleItem('onPageShow', '页面显示时调用，每次切回前台都会触发')
              this.LifecycleItem('onPageHide', '页面隐藏时调用，切到后台或跳转新页面时触发')
              this.LifecycleItem('aboutToDisappear', '页面销毁时调用，释放资源')
            }
            .width('100%')
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Color.White)
          .borderRadius(12)

          // 路由API说明
          Column({ space: 12 }) {
            Text('常用路由 API')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)

            Column({ space: 8 }) {
              this.APIItem('pushUrl', '跳转到新页面，保留当前页面在栈中')
              this.APIItem('replaceUrl', '替换当前页面，不保留在栈中')
              this.APIItem('back', '返回上一页')
              this.APIItem('getParams', '获取路由传递的参数')
              this.APIItem('getLength', '获取页面栈数量')
              this.APIItem('getState', '获取页面栈状态')
              this.APIItem('clear', '清空页面栈')
            }
            .width('100%')
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Color.White)
          .borderRadius(12)

          // 路由模式说明
          Column({ space: 12 }) {
            Text('路由模式说明')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)

            Column({ space: 8 }) {
              this.ModeItem('Standard', '标准模式，页面会入栈')
              this.ModeItem('Single', '单实例模式，目标页面只有一个实例')
            }
            .width('100%')
          }
          .width('100%')
          .padding(16)
          .backgroundColor(Color.White)
          .borderRadius(12)
        }
        .width('100%')
        .padding({ left: 16, right: 16, bottom: 20 })
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder
  ParamItem(label: string, value: string) {
    Row() {
      Text(label)
        .fontSize(14)
        .fontColor('#666')
        .width(60)

      Text(value)
        .fontSize(14)
        .layoutWeight(1)
    }
    .width('100%')
    .padding(8)
    .backgroundColor('#F8F8F8')
    .borderRadius(6)
  }

  @Builder
  LifecycleItem(name: string, desc: string) {
    Column({ space: 4 }) {
      Text(name)
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor('#007DFF')

      Text(desc)
        .fontSize(12)
        .fontColor('#666')
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .padding(10)
    .backgroundColor('#F8F8F8')
    .borderRadius(6)
  }

  @Builder
  APIItem(name: string, desc: string) {
    Row({ space: 8 }) {
      Text(`router.${name}()`)
        .fontSize(13)
        .fontColor('#722ED1')
        .fontFamily('monospace')

      Text(desc)
        .fontSize(12)
        .fontColor('#666')
        .layoutWeight(1)
    }
    .width('100%')
  }

  @Builder
  ModeItem(name: string, desc: string) {
    Row({ space: 8 }) {
      Text(name)
        .fontSize(13)
        .fontWeight(FontWeight.Medium)
        .fontColor('#007DFF')

      Text(desc)
        .fontSize(12)
        .fontColor('#666')
        .layoutWeight(1)
    }
    .width('100%')
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
    // 获取传入的参数
    const params = router.getParams() as RouterParams
    if (params) {
      this.paramsFrom = params.from || '无'
      this.message = params.message || '无'
      this.timestamp = params.timestamp || 0
    }
    this.addLog('✅ aboutToAppear - 页面创建')
  }

  aboutToDisappear() {
    this.addLog('❌ aboutToDisappear - 页面销毁')
  }

  onPageShow() {
    this.addLog('👁️ onPageShow - 页面显示')
  }

  onPageHide() {
    this.addLog('🙈 onPageHide - 页面隐藏')
  }
}
