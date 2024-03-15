export class News {
  public catname: string
  public caturl: string
  public des: string
  public thumb: string
  public times: string
  public title: string
  public url: string

  constructor(catname: string, caturl: string, des: string, thumb: string, times: string, title: string, url: string) {
    this.catname = catname
    this.caturl = caturl
    this.des = des
    this.thumb = thumb
    this.times = times
    this.title = title
    this.url = url
  }
}