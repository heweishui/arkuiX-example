import router from '@ohos.router';
import entry from 'libentry.so'

function TestFunction(str:string) {
  let ret = str + ' world!'
  return ret;
}

@Entry
@Component
struct Index {

  @State message: string = 'Test native api: 2 + 3 = ?'
  @State message2: string = 'Click me'

  build() {
    Row() {
      Column() {
        //引用文字资源
        Text($r('app.string.homePage_Text'))
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          //引用文字资源
          Text($r('app.string.homeClick_value'))
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        //引用颜色资源
        .backgroundColor($r('app.color.btn_background'))
        .width('40%')
        .height('5%')
        // 跳转按钮绑定onClick事件，点击时跳转到第二页
        .onClick(() => {
          router.pushUrl({ url: 'pages/Second' })
        })

        // 第一个按钮，调用add方法，对应到Native侧的Add方法，进行两数相加。
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.message = "Test native api: 2 + 3 = " + entry.add(2, 3);
            console.log("Test NAPI 2 + 3 = " + entry.add(2, 3));
          })
        // 第二个按钮，调用nativeCallArkTS方法，对应到Native的NativeCallArkTS，在Native中执行ArkTS function。
        Text(this.message2)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.message2 = entry.nativeCallArkTS(TestFunction);
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}