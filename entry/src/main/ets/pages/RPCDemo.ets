import router from '@ohos.router'
import { hilog } from '@kit.PerformanceAnalysisKit'

const DOMAIN = 0x0000

/**
 * RPC 通信概念演示
 * 使用本地模拟展示进程间通信原理
 */

// 服务端接口定义
interface RPCServiceInterface {
  getTime(): string
  add(a: number, b: number): number
  reverse(str: string): string
  ping(): string
}

// 本地模拟的服务端实现
class MockRPCServer implements RPCServiceInterface {
  getTime(): string {
    return new Date().toLocaleString('zh-CN')
  }

  add(a: number, b: number): number {
    return a + b
  }

  reverse(str: string): string {
    return str.split('').reverse().join('')
  }

  ping(): string {
    return 'Pong'
  }
}

@Entry
@Component
struct RPCDemo {
  @State logs: Array<string> = []
  @State isConnected: boolean = false
  @State inputNum1: string = '10'
  @State inputNum2: string = '20'
  @State inputText: string = 'Hello RPC'
  @State server: MockRPCServer | null = null

  aboutToAppear() {
    this.addLog('页面初始化完成')
  }

  build() {
    Column() {
      Row() {
        this.Header()
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20 })

      Scroll() {
        Column({ space: 20 }) {
          this.ConnectionSection()
          this.ConceptSection()
          this.CallSection()
          this.LogSection()
          this.TipCard('RPC要点：进程间通信机制')
        }
        .width('100%')
        .padding({ left: 16, right: 16, bottom: 20 })
      }
      .layoutWeight(1)
      .width('100%')
      .scrollBar(BarState.Auto)
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
        this.disconnect()
        router.back()
      })

      Text('RPC 远程调用')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .layoutWeight(1)
        .textAlign(TextAlign.Center)
        .margin({ right: 40 })
    }
    .width('100%')
    .padding({ left: 0, right: 0, top: 0, bottom: 12 })
    .backgroundColor('#F5F5F5')
  }

  @Builder
  ConnectionSection() {
    Column({ space: 12 }) {
      Text('RPC 连接')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('连接到 RPC 模拟服务')
        .fontSize(14)
        .fontColor('#666')

      // 连接状态
      Row() {
        Text('状态:')
          .fontSize(14)
          .fontColor('#666')

        Text(this.isConnected ? '已连接' : '未连接')
          .fontSize(14)
          .fontColor(this.isConnected ? '#52C41A' : '#999')
          .fontWeight(FontWeight.Medium)

        Blank()

        Circle({ width: 12, height: 12 })
          .fill(this.isConnected ? '#52C41A' : '#999')
      }
      .width('100%')
      .height(50)
      .padding({ left: 16, right: 16 })
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 操作按钮
      Row({ space: 12 }) {
        Button(this.isConnected ? '断开连接' : '连接服务')
          .fontSize(14)
          .width('48%')
          .height(44)
          .backgroundColor(this.isConnected ? '#FF6B6B' : '#007DFF')
          .borderRadius(8)
          .onClick(() => {
            if (this.isConnected) {
              this.disconnect()
            } else {
              this.connect()
            }
          })

        Button('连接测试')
          .fontSize(14)
          .width('48%')
          .height(44)
          .backgroundColor('#FA541C')
          .borderRadius(8)
          .onClick(() => {
            this.callPing()
          })
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  ConceptSection() {
    Column({ space: 12 }) {
      Text('RPC 概念')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('进程间通信原理')
        .fontSize(14)
        .fontColor('#666')

      // 架构图
      Column({ space: 8 }) {
        Row({ space: 12 }) {
          Column({ space: 4 }) {
            Text('Client 客户端')
              .fontSize(12)
              .fontColor('#007DFF')
              .width('100%')
              .textAlign(TextAlign.Center)

            Column() {
              Text('发送请求')
                .fontSize(10)
                .fontColor('#999')
                .width('100%')
                .textAlign(TextAlign.Center)
              Text('接收响应')
                .fontSize(10)
                .fontColor('#999')
                .width('100%')
                .textAlign(TextAlign.Center)
            }
            .width('100%')
            .height(80)
            .padding(12)
            .backgroundColor('#E6F7FF')
            .borderRadius(8)
          }
          .layoutWeight(1)

          Text('→')
            .fontSize(24)
            .fontColor('#999')

          Column({ space: 4 }) {
            Text('Server 服务端')
              .fontSize(12)
              .fontColor('#52C41A')
              .width('100%')
              .textAlign(TextAlign.Center)

            Column() {
              Text('接收请求')
                .fontSize(10)
                .fontColor('#999')
                .width('100%')
                .textAlign(TextAlign.Center)
              Text('处理并返回')
                .fontSize(10)
                .fontColor('#999')
                .width('100%')
                .textAlign(TextAlign.Center)
            }
            .width('100%')
            .height(80)
            .padding(12)
            .backgroundColor('#F6FFED')
            .borderRadius(8)
          }
          .layoutWeight(1)
        }
        .width('100%')

        // 代码示例
        Column({ space: 8 }) {
          Text('通信流程:')
            .fontSize(14)
            .fontColor('#666')
            .width('100%')

          Column({ space: 4 }) {
            Text('1. Client 连接到 Server')
              .fontSize(12)
              .fontColor('#999')

            Text('2. Client 发送请求 (code + data)')
              .fontSize(12)
              .fontColor('#999')

            Text('3. Server 处理请求')
              .fontSize(12)
              .fontColor('#999')

            Text('4. Server 返回响应')
              .fontSize(12)
              .fontColor('#999')
          }
          .width('100%')
          .padding(12)
          .backgroundColor('#F8F8F8')
          .borderRadius(8)
        }
        .width('100%')
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#1F000000', offsetX: 0, offsetY: 2 })
  }

  @Builder
  CallSection() {
    Column({ space: 12 }) {
      Text('RPC 调用')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('远程调用服务端方法')
        .fontSize(14)
        .fontColor('#666')

      // Ping 测试
      Row() {
        Text('Ping 测试 (Code 4)')
          .fontSize(16)
          .fontColor('#333')
          .layoutWeight(1)

        Button('发送')
          .fontSize(14)
          .enabled(this.isConnected)
          .onClick(() => {
            this.callPing()
          })
      }
      .width('100%')
      .height(50)
      .padding({ left: 16, right: 16 })
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 获取服务器时间
      Row() {
        Text('获取服务器时间 (Code 1)')
          .fontSize(16)
          .fontColor('#333')
          .layoutWeight(1)

        Button('调用')
          .fontSize(14)
          .enabled(this.isConnected)
          .onClick(() => {
            this.callGetTime()
          })
      }
      .width('100%')
      .height(50)
      .padding({ left: 16, right: 16 })
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 相加运算
      Column({ space: 8 }) {
        Text('远程加法运算 (Code 2):')
          .fontSize(14)
          .fontColor('#666')
          .width('100%')

        Row({ space: 12 }) {
          TextInput({ placeholder: '数字1', text: this.inputNum1 })
            .type(InputType.Number)
            .layoutWeight(1)
            .onChange((value: string) => {
              this.inputNum1 = value
            })

          Text('+')
            .fontSize(20)
            .fontColor('#666')

          TextInput({ placeholder: '数字2', text: this.inputNum2 })
            .type(InputType.Number)
            .layoutWeight(1)
            .onChange((value: string) => {
              this.inputNum2 = value
            })

          Button('=')
            .width(50)
            .height(40)
            .enabled(this.isConnected)
            .onClick(() => {
              this.callAdd()
            })
        }
        .width('100%')
      }
      .width('100%')

      // 反转字符串
      Column({ space: 8 }) {
        Text('远程字符串反转 (Code 3):')
          .fontSize(14)
          .fontColor('#666')
          .width('100%')

        Row({ space: 12 }) {
          TextInput({ placeholder: '输入文本', text: this.inputText })
            .layoutWeight(1)
            .onChange((value: string) => {
              this.inputText = value
            })

          Button('反转')
            .fontSize(14)
            .enabled(this.isConnected)
            .onClick(() => {
              this.callReverse()
            })
        }
        .width('100%')
      }
      .width('100%')

      // 说明
      Column({ space: 8 }) {
        Text('RPC 功能说明:')
          .fontSize(14)
          .fontColor('#666')
          .width('100%')

        Text('• Code 1: 获取服务器时间')
          .fontSize(12)
          .fontColor('#999')

        Text('• Code 2: 远程加法运算')
          .fontSize(12)
          .fontColor('#999')

        Text('• Code 3: 字符串反转')
          .fontSize(12)
          .fontColor('#999')

        Text('• Code 4: Ping/Pong 测试')
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
  LogSection() {
    Column({ space: 12 }) {
      Text('通信日志')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Column({ space: 8 }) {
        if (this.logs.length === 0) {
          Text('暂无日志')
            .fontSize(14)
            .fontColor('#999')
            .width('100%')
            .textAlign(TextAlign.Center)
            .padding(20)
        } else {
          ForEach(this.logs, (log: string, index: number) => {
            Text(log)
              .fontSize(12)
              .fontColor('#333')
              .width('100%')
          }, (log: string, index: number) => index.toString())
        }
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#F8F8F8')
      .borderRadius(8)

      // 清空日志
      Button('清空日志')
        .fontSize(14)
        .width('100%')
        .height(40)
        .backgroundColor('#8E44AD')
        .borderRadius(8)
        .onClick(() => {
          this.logs = []
        })
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

  // ==================== RPC 方法 ===================

  /**
   * 连接到 RPC 服务
   */
  connect() {
    this.addLog('正在连接 RPC 服务...')
    this.server = new MockRPCServer()
    this.isConnected = true
    this.addLog('✅ 连接成功!')
  }

  /**
   * 断开 RPC 连接
   */
  disconnect() {
    if (!this.isConnected) {
      return
    }
    this.server = null
    this.isConnected = false
    this.addLog('🔌 已断开连接')
  }

  /**
   * Ping 测试 (Code 4)
   */
  callPing() {
    if (!this.server) {
      return
    }
    const result = this.server.ping()
    this.addLog(`Ping -> ${result}`)
  }

  /**
   * 获取服务器时间 (Code 1)
   */
  callGetTime() {
    if (!this.server) {
      return
    }
    const result = this.server.getTime()
    this.addLog(`服务器时间: ${result}`)
  }

  /**
   * 远程加法 (Code 2)
   */
  callAdd() {
    if (!this.server) {
      return
    }
    const a = parseInt(this.inputNum1)
    const b = parseInt(this.inputNum2)

    if (isNaN(a) || isNaN(b)) {
      this.addLog('❌ 请输入有效数字')
      return
    }

    const result = this.server.add(a, b)
    this.addLog(`${a} + ${b} = ${result}`)
  }

  /**
   * 字符串反转 (Code 3)
   */
  callReverse() {
    if (!this.server) {
      return
    }
    const result = this.server.reverse(this.inputText)
    this.addLog(`"${this.inputText}" 反转 -> "${result}"`)
  }

  /**
   * 添加日志
   */
  addLog(message: string) {
    const timestamp = new Date().toLocaleTimeString('zh-CN')
    this.logs.unshift(`[${timestamp}] ${message}`)

    // 限制日志数量
    if (this.logs.length > 50) {
      this.logs = this.logs.slice(0, 50)
    }
  }
}
