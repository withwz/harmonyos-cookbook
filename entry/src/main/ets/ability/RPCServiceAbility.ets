import rpc from '@ohos.rpc'
import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit'
import { hilog } from '@kit.PerformanceAnalysisKit'

const DOMAIN = 0x0000
const DESCRIPTOR = 'com.example.rpc.service'

/**
 * RPC 服务端 RemoteObject
 * 实现跨进程通信的服务端接口
 */
class RPCRemoteObject extends rpc.RemoteObject {
  constructor(descriptor: string) {
    super(descriptor)
  }

  /**
   * 处理远程请求
   * @param code 请求码
   * @param data 请求数据
   * @param reply 响应数据
   * @param option 消息选项
   */
  onRemoteRequest(code: number, data: rpc.MessageParcel, reply: rpc.MessageParcel, option: rpc.MessageOption): boolean {
    hilog.info(DOMAIN, 'RPCService', `onRemoteRequest: code=${code}`)

    try {
      switch (code) {
        case 1: {
          reply.writeString(new Date().toLocaleString('zh-CN'))
          return true
        }
        case 2: {
          const a = data.readInt()
          const b = data.readInt()
          reply.writeInt(a + b)
          return true
        }
        case 3: {
          const str = data.readString()
          reply.writeString(str.split('').reverse().join(''))
          return true
        }
        case 4: {
          reply.writeString('Pong')
          return true
        }
        default: {
          reply.writeInt(-1)
          return true
        }
      }
    } catch (err) {
      hilog.error(DOMAIN, 'RPCService', `onRemoteRequest error: ${JSON.stringify(err)}`)
      try {
        reply.writeInt(-1)
      } catch (e) {
        // 忽略写入失败
      }
      return false
    }
  }
}

/**
 * RPC Service Ability
 * 作为服务端提供远程过程调用服务
 */
export default class RPCServiceAbility extends UIAbility {
  remoteObject: RPCRemoteObject | null = null

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(DOMAIN, 'RPCService', 'RPCServiceAbility onCreate')

    // 创建并注册 RemoteObject
    this.remoteObject = new RPCRemoteObject(DESCRIPTOR)
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'RPCService', 'RPCServiceAbility onDestroy')
    this.remoteObject = null
  }

  /**
   * 返回 RemoteObject 给调用方
   * 当客户端连接到这个 Service 时调用
   */
  onConnect(want: Want): rpc.RemoteObject {
    hilog.info(DOMAIN, 'RPCService', 'onConnect - 客户端已连接')

    if (!this.remoteObject) {
      this.remoteObject = new RPCRemoteObject(DESCRIPTOR)
    }

    return this.remoteObject as rpc.RemoteObject
  }

  /**
   * 客户端断开连接时调用
   */
  onDisconnect(want: Want): void {
    hilog.info(DOMAIN, 'RPCService', 'onDisconnect - 客户端已断开')
  }
}
