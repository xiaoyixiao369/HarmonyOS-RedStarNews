import { TouTiao } from './TouTiao'
@Entry
@Component
struct Index {

  @State curIndex: number = 0


  @Builder buildTabBar(title: string, index: number) {
    Column() {
      Text(title)
        .fontSize(18)
        .fontWeight(500)
        .fontColor(this.curIndex == index ? Color.Black : Color.Grey)

      Divider()
        .backgroundColor(this.curIndex == index ? Color.Red : Color.Black)
        .width(20)
        .height(2)
        .opacity(this.curIndex == index ? 1 : 0)
        .margin({top: 8})
    }
  }

  build() {
    Row() {
      Column({space: 10}) {

        Row() {
          Image($r('app.media.lianghui'))
            .height(50)
        }.width('100%')
        .backgroundColor('#de2417')
        .justifyContent(FlexAlign.Center)
        .borderRadius({
          topLeft: 12,
          topRight: 12
        })

        Row() {
          Image($r('app.media.header_logo'))
            .height(30)
            .margin({left: 6})
        }.width('100%')
        .justifyContent(FlexAlign.Start)

        Tabs() {
          TabContent() {
            TouTiao()
          }.tabBar(this.buildTabBar('成都头条', 0))

          TabContent() {
            Text('爱看视频的内容')
          }.tabBar(this.buildTabBar('爱看视频', 1))

          TabContent() {
            Text('安逸成都的内容')
          }.tabBar(this.buildTabBar('安逸成都', 2))

          TabContent() {
            Text('财经成都的内容')
          }.tabBar(this.buildTabBar('财经成都', 3))


        }.width('100%')
        .onChange((index: number) => {
          this.curIndex = index
        })

      }
      .width('100%')
    }
    .height('100%')
  }
}