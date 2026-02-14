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
  @State logs: string = ''
  @State isConnected: boolean = false
  @State inputNum1: string = '10'
  @State inputNum2: string = '20'
  @State inputText: string = 'Hello RPC'
  server: MockRPCServer = new MockRPCServer()

  aboutToAppear() {
    this.logs = '页面初始化完成'
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
          this.MessageSequenceSection()
          this.CrossDeviceSection()
          this.LifecycleSection()
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
        Text('<-')
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

          Text('->')
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
  MessageSequenceSection() {
    Column({ space: 12 }) {
      Text('MessageSequence 数据序列化')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('RPC 通信中的数据序列化容器')
        .fontSize(14)
        .fontColor('#666')

      // 代码示例
      Column({ space: 8 }) {
        Text('基本用法:')
          .fontSize(14)
          .fontColor('#666')
          .width('100%')

        Column({ space: 4 }) {
          Text('创建序列化容器:')
            .fontSize(12)
            .fontColor('#999')
          Text('const sequence = rpc.MessageSequence.create()')
            .fontSize(11)
            .fontColor('#007DFF')
            .fontFamily('monospace')
            .width('100%')
        }
        .width('100%')
        .padding(12)
        .backgroundColor('#F8F8F8')
        .borderRadius(8)

        Column({ space: 4 }) {
          Text('写入数据:')
            .fontSize(12)
            .fontColor('#999')
          Text('sequence.writeInt(123)')
            .fontSize(11)
            .fontColor('#007DFF')
            .fontFamily('monospace')
            .width('100%')
          Text('sequence.writeString("Hello")')
            .fontSize(11)
            .fontColor('#007DFF')
            .fontFamily('monospace')
            .width('100%')
        }
        .width('100%')
        .padding(12)
        .backgroundColor('#F8F8F8')
        .borderRadius(8)

        Column({ space: 4 }) {
          Text('读取数据:')
            .fontSize(12)
            .fontColor('#999')
          Text('const val = sequence.readInt()')
            .fontSize(11)
            .fontColor('#FA541C')
            .fontFamily('monospace')
            .width('100%')
          Text('const str = sequence.readString()')
            .fontSize(11)
            .fontColor('#FA541C')
            .fontFamily('monospace')
            .width('100%')
        }
        .width('100%')
        .padding(12)
        .backgroundColor('#F8F8F8')
        .borderRadius(8)

        // 支持的数据类型
        Column({ space: 8 }) {
          Text('支持的数据类型:')
            .fontSize(14)
            .fontColor('#666')
            .width('100%')

          Row({ space: 20 }) {
            Text('writeInt / readInt')
              .fontSize(12)
              .fontColor('#999')
            Text('writeString / readString')
              .fontSize(12)
              .fontColor('#999')
            Text('writeBoolean / readBoolean')
              .fontSize(12)
              .fontColor('#999')
          }
          .width('100%')
        }
        .width('100%')
        .padding(12)
        .backgroundColor('#E6F7FF')
        .borderRadius(8)
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
  CrossDeviceSection() {
    Column({ space: 12 }) {
      Text('跨设备 RPC 调用')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('RPC 支持跨设备通信')
        .fontSize(14)
        .fontColor('#666')

      // 架构示意图
      Column({ space: 8 }) {
        Row({ space: 12 }) {
          Column({ space: 4 }) {
            Text('设备 A')
              .fontSize(12)
              .fontColor('#007DFF')
              .width('100%')
              .textAlign(TextAlign.Center)

            Column() {
              Text('发起调用')
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

          Text('云/网络')
            .fontSize(24)
            .fontColor('#999')

          Column({ space: 4 }) {
            Text('设备 B (远程)')
              .fontSize(12)
              .fontColor('#FA541C')
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

        // 关键特性
        Column({ space: 8 }) {
          Text('跨设备特性:')
            .fontSize(14)
            .fontColor('#666')
            .width('100%')

          Column({ space: 4 }) {
            Text('网络传输层')
              .fontSize(12)
              .fontColor('#999')

            Text('设备发现与配对')
              .fontSize(12)
              .fontColor('#999')

            Text('分布式式数据同步')
              .fontSize(12)
              .fontColor('#999')

            Text('安全认证机制')
              .fontSize(12)
              .fontColor('#999')

            Text('跨设备调用透明化')
              .fontSize(12)
              .fontColor('#999')
          }
          .width('100%')
          .padding(12)
          .backgroundColor('#E6F7FF')
          .borderRadius(8)

          // 应用场景
          Column({ space: 8 }) {
            Text('应用场景:')
              .fontSize(14)
              .fontColor('#666')
              .width('100%')

            Column({ space: 4 }) {
              Text('手机 <--> 平板')
                .fontSize(12)
                .fontColor('#999')

              Text('平板 <--> TV')
                .fontSize(12)
                .fontColor('#999')

              Text('手表 <--> 手机')
                .fontSize(12)
                .fontColor('#999')
            }
            .width('100%')
            .padding(12)
            .backgroundColor('#F8F8F8')
            .borderRadius(8)
          }
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
  LifecycleSection() {
    Column({ space: 12 }) {
      Text('RPC 生命周期管理')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .width('100%')

      Text('连接状态跟踪与管理')
        .fontSize(14)
        .fontColor('#666')

      // 当前连接状态
      Row() {
        Text(`当前状态: ${this.isConnected ? '已连接' : '未连接'}`)
          .fontSize(16)
          .fontColor('#333')
          .width('100%')
          .padding(12)
          .backgroundColor('#F8F8F8')
          .borderRadius(8)
      }
      .width('100%')

      // 流程图
      Column({ space: 8 }) {
        Text('连接建立流程:')
          .fontSize(14)
          .fontColor('#666')
          .width('100%')

        Column({ space: 4 }) {
          Text('1. 客户端发起连接')
            .fontSize(12)
            .fontColor('#999')

          Text('2. 服务端 onConnect() 返回 RemoteObject')
            .fontSize(12)
            .fontColor('#999')

          Text('3. 建立代理通道')
            .fontSize(12)
            .fontColor('#999')

          Text('4. 客户端获得 Proxy 对象')
            .fontSize(12)
            .fontColor('#999')

          Text('5. 开始远程调用')
            .fontSize(12)
            .fontColor('#999')
        }
        .width('100%')
        .padding(12)
        .backgroundColor('#F8F8F8')
        .borderRadius(8)

        Column({ space: 4 }) {
          Text('连接断开流程:')
            .fontSize(14)
            .fontColor('#666')
            .width('100%')

          Column({ space: 4 }) {
            Text('1. 客户端主动断开 disconnectAbility()')
              .fontSize(12)
              .fontColor('#999')

            Text('2. 服务端触发 onDisconnect()')
              .fontSize(12)
              .fontColor('#999')

            Text('3. 释放资源，清理连接')
              .fontSize(12)
              .fontColor('#999')

            Text('4. 通知其他端连接已关闭')
              .fontSize(12)
              .fontColor('#999')
          }
          .width('100%')
          .padding(12)
          .backgroundColor('#F8F8F8')
          .borderRadius(8)
        }
        .width('100%')

        // 异常处理
        Column({ space: 8 }) {
          Text('异常处理机制:')
            .fontSize(14)
            .fontColor('#666')
            .width('100%')

          Column({ space: 4 }) {
            Text('连接失败: 检查网络、权限、服务状态')
              .fontSize(12)
              .fontColor('#999')

            Text('调用超时: 设置合理的超时时间')
              .fontSize(12)
              .fontColor('#999')

            Text('服务异常: 捕获并记录异常日志')
              .fontSize(12)
              .fontColor('#999')

            Text('重试机制: 失败后自动重连')
              .fontSize(12)
              .fontColor('#999')
          }
          .width('100%')
          .padding(12)
          .backgroundColor('#E6F7FF')
          .borderRadius(8)
        }

        Column({ space: 8 }) {
          Text('生命周期最佳实践:')
            .fontSize(14)
            .fontColor('#666')
            .width('100%')

          Column({ space: 4 }) {
            Text('及时释放连接: 不用时立即断开')
              .fontSize(12)
              .fontColor('#999')

            Text('监听连接状态: 处理意外断开')
              .fontSize(12)
              .fontColor('#999')

            Text('合理设置超时: 避免长时间等待')
              .fontSize(12)
              .fontColor('#999')

            Text('记录详细日志: 方便问题排查')
              .fontSize(12)
              .fontColor('#999')
          }
          .width('100%')
          .padding(12)
          .backgroundColor('#E6F7FF')
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
          TextInput({ text: this.inputNum1, placeholder: '数字1' })
            .type(InputType.Number)
            .layoutWeight(1)
            .onChange((value: string) => {
              this.inputNum1 = value
            })

          Text('+')
            .fontSize(20)
            .fontColor('#666')

          TextInput({ text: this.inputNum2, placeholder: '数字2' })
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
          TextInput({ text: this.inputText, placeholder: '输入文本' })
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

      // 说明
      Column({ space: 8 }) {
        Text('RPC 功能说明:')
          .fontSize(14)
          .fontColor('#666')
          .width('100%')

        Text('Code 1: 获取服务器时间')
          .fontSize(12)
          .fontColor('#999')

        Text('Code 2: 远程加法运算')
          .fontSize(12)
          .fontColor('#999')

        Text('Code 3: 字符串反转')
          .fontSize(12)
          .fontColor('#999')

        Text('Code 4: Ping/Pong 测试')
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
          ForEach(this.logs.split('\n'), (log: string, index: number) => {
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
          this.logs = ''
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
    this.logs = this.logs + '正在连接 RPC 服务...\n'
    this.isConnected = true
    this.logs = this.logs + '连接成功\n'
  }

  /**
   * 断开 RPC 连接
   */
  disconnect() {
    if (!this.isConnected) {
      return
    }
    this.isConnected = false
    this.logs = this.logs + '已断开连接\n'
  }

  /**
   * Ping 测试 (Code 4)
   */
  callPing() {
    if (!this.isConnected) {
      return
    }
    const result = this.server.ping()
    this.logs = this.logs + 'Ping -> ' + result + '\n'
  }

  /**
   * 获取服务器时间 (Code 1)
   */
  callGetTime() {
    if (!this.isConnected) {
      return
    }
    const result = this.server.getTime()
    this.logs = this.logs + '服务器时间: ' + result + '\n'
  }

  /**
   * 远程加法 (Code 2)
   */
  callAdd() {
    if (!this.isConnected) {
      return
    }
    const a = parseInt(this.inputNum1)
    const b = parseInt(this.inputNum2)

    if (isNaN(a) || isNaN(b)) {
      this.logs = this.logs + '请输入有效数字\n'
      return
    }

    const result = this.server.add(a, b)
    this.logs = this.logs + a.toString() + ' + ' + b.toString() + ' = ' + result.toString() + '\n'
  }

  /**
   * 字符串反转 (Code 3)
   */
  callReverse() {
    if (!this.isConnected) {
      return
    }
    const result = this.server.reverse(this.inputText)
    this.logs = this.logs + '"' + this.inputText + '" 反转 -> "' + result + '"\n'
  }
}
