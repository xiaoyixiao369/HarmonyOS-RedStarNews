import axios from '@ohos/axios'
import Prompt from '@system.prompt'
import router from '@ohos.router'
import { News } from '../viewmodel/News'

@Entry
@Component
export struct TouTiao {
  @State newsList: News[] = []
  @State @Watch('onPageChange') page: number = 1

  onPageChange() {
    this.loadData()
    if (this.page > 1) {
      Prompt.showToast({
        message: `正在加载第${this.page}页...`
      })

    }
  }

  async loadData() {
    let res = await axios({
      url: `http://wap.chengdu.cn/cmstopapi/api_wap.php?catid=all&size=2&page=${this.page}&timer=1710347243000?v=08462261456775224`
    })
    this.newsList.push(...res.data.lists)
  }

  aboutToAppear() {
    this.loadData()
  }

  build() {
    Row() {
      Column() {

        Swiper() {
          Image($r('app.media.s_01'))
          Image($r('app.media.s_02'))
          Image($r('app.media.s_03'))
          Image($r('app.media.s_04'))
          Image($r('app.media.s_05'))
        }
        .width('100%')


        Row() {
          Text()
            .width(3)
            .height(30)
            .backgroundColor(Color.Red)

          Text('花海成都,春意盎然')
            .fontSize(20)
            .fontWeight(800)
            .margin({ left: 20 })
        }.width('100%')
        .justifyContent(FlexAlign.Start)
        .alignItems(VerticalAlign.Center)
        .margin({ top: 8 })

        Row() {
          Image($r('app.media.xunibwg'))
            .width('100%')
        }
        .width('96%')
        .margin({ top: 10 })

        List() {
          ForEach(this.newsList, (news: News) => {
            ListItem() {
              Row() {
                Image(news.thumb)
                  .width(100)
                  .height(60)
                Column() {
                  Text(news.title)
                    .textOverflow({
                      overflow: TextOverflow.Ellipsis
                    })
                    .maxLines(2)

                  Text(news.catname)
                    .fontSize(12)
                    .fontColor(Color.Grey)
                }
                .margin({ left: 4 })
                .justifyContent(FlexAlign.SpaceBetween)
                .alignItems(HorizontalAlign.Start)
                .layoutWeight(1)
                .height(60)
              }.width('100%')
              .height(100)
              .justifyContent(FlexAlign.Start)
            }
            .onClick(() => {
              router.pushUrl({
                url: 'pages/NewsDetail',
                params: {
                  newsUrl: news.url
                }
              })
            })
          })
        }
        .width('96%')
        .height('100%')
        .margin({ top: 8 })
        .divider({
          strokeWidth: 2
        })
        .onScrollStop(() => {
          this.page++
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}