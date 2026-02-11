import router from '@ohos.router'
import http from '@ohos.net.http'

/**
 * Network Kit 演示
 *
 * 展示如何使用 @kit.NetworkKit 进行 HTTP 请求
 */

// 定义天气数据接口
interface WeatherData {
  city: string
  temperature: number
  description: string
  humidity: number
  windSpeed: number
}

// 定义用户接口
interface User {
  id: number
  name: string
  email: string
}

@Entry
@Component
struct NetworkKitDemo {
  @State loading: boolean = false
  @State weatherData: WeatherData | null = null
  @State errorMsg: string = ''
  @State userList: Array<User> = []
  @State requestLog: Array<string> = []

  build() {
    Scroll() {
      Column({ space: 16 }) {
        // 返回按钮
        this.BackButton()

        // 标题
        this.HeaderSection()

        // Network Kit 说明
        this.InfoSection()

        // 示例1：GET 请求（模拟天气数据）
        this.GETRequestSection()

        // 示例2：POST 请求
        this.POSTRequestSection()

        // 请求日志
        this.LogSection()

        // API 说明
        this.APISection()

        this.TipCard('💡 实际开发中需要替换为真实的 API 地址')
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
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
  HeaderSection() {
    Text('Network Kit - HTTP 网络请求')
      .fontSize(24)
      .fontWeight(FontWeight.Bold)
      .width('100%')
  }

  @Builder
  InfoSection() {
    Column({ space: 8 }) {
      Text('Network Kit 提供了 HTTP 网络请求能力')
        .fontSize(14)
        .fontColor('#666')

      Row({ space: 12 }) {
        Text('支持:')
          .fontSize(13)
          .fontColor('#999')

        Text('GET')
          .fontSize(12)
          .padding({ left: 6, right: 6, top: 2, bottom: 2 })
          .backgroundColor('#E6F7FF')
          .fontColor('#007DFF')
          .borderRadius(4)

        Text('POST')
          .fontSize(12)
          .padding({ left: 6, right: 6, top: 2, bottom: 2 })
          .backgroundColor('#E6F7FF')
          .fontColor('#007DFF')
          .borderRadius(4)

        Text('PUT')
          .fontSize(12)
          .padding({ left: 6, right: 6, top: 2, bottom: 2 })
          .backgroundColor('#E6F7FF')
          .fontColor('#007DFF')
          .borderRadius(4)

        Text('DELETE')
          .fontSize(12)
          .padding({ left: 6, right: 6, top: 2, bottom: 2 })
          .backgroundColor('#E6F7FF')
          .fontColor('#007DFF')
          .borderRadius(4)
      }
    }
    .width('100%')
    .padding(12)
    .backgroundColor('#E6F7FF')
    .borderRadius(8)
  }

  @Builder
  GETRequestSection() {
    Column({ space: 12 }) {
      Text('示例1：GET 请求（模拟天气数据）')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      // 天气卡片
      if (this.weatherData) {
        Column({ space: 8 }) {
          Row({ space: 12 }) {
            Text('☀️')
              .fontSize(40)

            Column({ space: 4 }) {
              Text(this.weatherData.city)
                .fontSize(20)
                .fontWeight(FontWeight.Bold)

              Text(this.weatherData.description)
                .fontSize(14)
                .fontColor('#666')
            }
            .alignItems(HorizontalAlign.Start)
            .layoutWeight(1)

            Text(`${this.weatherData.temperature}°C`)
              .fontSize(32)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FF6B6B')
          }
          .width('100%')

          Row({ space: 16 }) {
            Text(`💧 ${this.weatherData.humidity}%`)
              .fontSize(12)
              .fontColor('#666')

            Text(`💨 ${this.weatherData.windSpeed}m/s`)
              .fontSize(12)
              .fontColor('#666')
          }
        }
        .width('100%')
        .padding(16)
        .backgroundColor('#FFF7E6')
        .borderRadius(12)
      }

      // 请求按钮
      if (this.loading) {
        Row({ space: 8 }) {
          LoadingProgress()
            .width(16)
            .height(16)
            .color('#007DFF')

          Text('请求中...')
            .fontSize(14)
            .fontColor('#666')
        }
        .width('100%')
        .padding(12)
        .justifyContent(FlexAlign.Center)
      } else {
        Button('模拟 GET 请求 - 获取天气')
          .width('100%')
          .onClick(() => {
            this.fetchWeather()
          })
      }

      // 错误信息
      if (this.errorMsg) {
        Text(this.errorMsg)
          .fontSize(12)
          .fontColor('#FF6B6B')
          .width('100%')
          .padding(8)
          .backgroundColor('#FFF5F5')
          .borderRadius(6)
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  POSTRequestSection() {
    Column({ space: 12 }) {
      Text('示例2：POST 请求（模拟提交数据）')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      // 用户列表
      Column({ space: 8 }) {
        Text('用户列表（模拟获取）')
          .fontSize(14)
          .fontColor('#666')

        if (this.userList.length > 0) {
          Column({ space: 4 }) {
            ForEach(this.userList, (user: User) => {
              Row() {
                Text(user.name)
                  .fontSize(14)
                  .layoutWeight(1)

                Text(user.email)
                  .fontSize(12)
                  .fontColor('#999')
              }
              .width('100%')
              .padding(8)
              .backgroundColor('#F8F8F8')
              .borderRadius(6)
            }, (user: User) => user.id.toString())
          }
        } else {
          Text('暂无数据')
            .fontSize(12)
            .fontColor('#999')
            .width('100%')
            .textAlign(TextAlign.Center)
            .padding(12)
        }

        Row({ space: 8 }) {
          Button('模拟 POST - 获取用户')
            .fontSize(12)
            .onClick(() => {
              this.fetchUsers()
            })

          Button('清空')
            .fontSize(12)
            .backgroundColor('#F0F0F0')
            .fontColor('#666')
            .onClick(() => {
              this.userList = []
            })
        }
        .width('100%')
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  LogSection() {
    Column({ space: 8 }) {
      Row() {
        Text('请求日志')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)

        Button('清空')
          .fontSize(11)
          .onClick(() => {
            this.requestLog = []
          })
      }
      .width('100%')

      List({ space: 4 }) {
        ForEach(this.requestLog, (log: string) => {
          ListItem() {
            Text(log)
              .fontSize(10)
              .fontFamily('monospace')
              .fontColor('#666')
          }
        }, (log: string) => log)
      }
      .width('100%')
      .height(150)
      .padding(8)
      .backgroundColor('#F8F8F8')
      .borderRadius(6)
    }
    .width('100%')
    .padding(16)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  @Builder
  APISection() {
    Column({ space: 8 }) {
      Text('常用 API')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)

      Column({ space: 6 }) {
        this.APIItem('http.createHttp()', '创建 HTTP 请求对象')
        this.APIItem('request(url, options)', '发起请求')
        this.APIItem('RequestMethod.GET', 'GET 请求方式')
        this.APIItem('RequestMethod.POST', 'POST 请求方式')
        this.APIItem('destroy()', '销毁请求对象')
      }
    }
    .width('100%')
  }

  @Builder
  APIItem(name: string, desc: string) {
    Row({ space: 8 }) {
      Text(name)
        .fontSize(11)
        .fontFamily('monospace')
        .fontColor('#722ED1')
        .width(140)

      Text(desc)
        .fontSize(11)
        .fontColor('#666')
        .layoutWeight(1)
    }
    .width('100%')
  }

  @Builder
  TipCard(tip: string) {
    Text(tip)
      .fontSize(12)
      .fontColor('#FA8C16')
      .width('100%')
      .padding(12)
      .backgroundColor('#FFF7E6')
      .borderRadius(8)
  }

  // ==================== 网络请求方法 ====================

  // 模拟获取天气数据
  private fetchWeather() {
    this.loading = true
    this.errorMsg = ''
    this.addLog('发起 GET 请求...')

    // 创建 HTTP 请求对象
    const httpRequest = http.createHttp()

    // 模拟 API 请求（实际使用时替换为真实 API）
    // 这里使用 setTimeout 模拟网络请求延迟
    setTimeout(() => {
      // 模拟响应数据
      const mockData: WeatherData = {
        city: '北京',
        temperature: 25,
        description: '晴天',
        humidity: 45,
        windSpeed: 3.5
      }

      this.weatherData = mockData
      this.loading = false
      this.addLog(`✅ 请求成功: ${JSON.stringify(mockData)}`)

      // 销毁请求对象
      httpRequest.destroy()
    }, 1000)

    /* 实际请求代码示例:
    httpRequest.request('https://api.weather.com/data', {
      method: http.RequestMethod.GET,
      header: {
        'Content-Type': 'application/json'
      },
      connectTimeout: 60000,
      readTimeout: 60000
    })
      .then((data) => {
        this.weatherData = JSON.parse(data.result.toString())
        this.addLog(`✅ 请求成功`)
      })
      .catch((err) => {
        this.errorMsg = `请求失败: ${err.message}`
        this.addLog(`❌ 请求失败: ${err.message}`)
      })
      .finally(() => {
        this.loading = false
        httpRequest.destroy()
      })
    */
  }

  // 模拟获取用户列表
  private fetchUsers() {
    this.addLog('发起 POST 请求...')

    // 创建 HTTP 请求对象
    const httpRequest = http.createHttp()

    // 模拟 POST 请求
    setTimeout(() => {
      const mockUsers: Array<User> = [
        { id: 1, name: '张三', email: 'zhangsan@example.com' },
        { id: 2, name: '李四', email: 'lisi@example.com' },
        { id: 3, name: '王五', email: 'wangwu@example.com' }
      ]

      this.userList = mockUsers
      this.addLog(`✅ POST 成功: 返回 ${mockUsers.length} 条数据`)

      httpRequest.destroy()
    }, 800)

    /* 实际 POST 请求示例:
    httpRequest.request('https://api.example.com/users', {
      method: http.RequestMethod.POST,
      header: {
        'Content-Type': 'application/json'
      },
      extraData: JSON.stringify({
        page: 1,
        pageSize: 10
      })
    })
      .then((data) => {
        this.userList = JSON.parse(data.result.toString())
      })
      .catch((err) => {
        this.addLog(`❌ POST 失败: ${err.message}`)
      })
      .finally(() => {
        httpRequest.destroy()
      })
    */
  }

  // 添加日志
  private addLog(message: string) {
    const time = new Date().toLocaleTimeString()
    this.requestLog.unshift(`[${time}] ${message}`)
    if (this.requestLog.length > 50) {
      this.requestLog = this.requestLog.slice(0, 50)
    }
  }

  aboutToAppear() {
    console.log('NetworkKitDemo aboutToAppear')
  }
}
