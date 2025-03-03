import router from '@ohos.router';

@Entry
@Component
struct Second {
  build() {
    Row() {
      Column() {
        //引用文字资源
        Text($r('app.string.secondPage_Text'))
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button() {
          //引用文字资源
          Text($r('app.string.secondClick_value'))
            .fontSize(25)
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
        // 跳转按钮绑定onClick事件，点击按钮时返回到第一页
        .onClick(() => {
          router.back()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}