import webview from '@ohos.web.webview'
import router from '@ohos.router'

@Entry
@Component
struct NewsDetail {
  private controller: webview.WebviewController = new webview.WebviewController()
  @State newsUrl: string = ''

  aboutToAppear() {
    this.newsUrl = router.getParams()['newsUrl']
  }

  build() {
    Row() {
      Column() {
        Row() {
          Image($r('app.media.ic_public_back'))
            .width(30)
            .margin({
              top: 2,
              left: 2
            })
            .onClick(() => {
              router.back()
            })
        }.width('100%')
        .justifyContent(FlexAlign.Start)

        Web({
          src: this.newsUrl,
          controller: this.controller
        })
          .height('100%')
          .onPageVisible(() => {
            this.controller.runJavaScript(`var header = document.getElementsByTagName('header')[0]; header.parentNode.removeChild(header);var footer = document.getElementsByClassName('new_footer')[0];footer.parentNode.removeChild(footer);`)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}