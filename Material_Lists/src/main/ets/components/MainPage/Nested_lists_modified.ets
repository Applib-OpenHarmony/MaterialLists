export class Nestedlistitems {
 leadingcontent:  Resource | string
  Maindata: string
  Subdata: string
  trailingcontent:  Resource | string
  toggleswitch:string
  istoggleswitchpresent:boolean
  issinglelinelist:boolean
  istwolinelist:boolean
  isleadingcontentpresent:boolean
  istrailingcontentpresent:boolean
  istrailingcontent_image:boolean
  isleadingcontent_image:boolean
  constructor(leadingcontent:Resource|string, Maindata: string,Subdata: string,trailingcontent:Resource|string) {
    this.leadingcontent = leadingcontent;
    this.Maindata=Maindata;
    this.Subdata=Subdata;
    this.trailingcontent=trailingcontent;
    this.istwolinelist= (Subdata == null) ? false : true;
    this.issinglelinelist= (Subdata == null) ? true : false;
    this.isleadingcontentpresent =(leadingcontent==null)?false:true;
    this.istrailingcontentpresent = (trailingcontent==null)?false : true;
    if( typeof trailingcontent === 'string' || trailingcontent instanceof String) {
      this.istrailingcontent_image = false;

    }
    else{
      this.istrailingcontent_image = true;

    }

  }

}
@Entry
@Component
export struct Nested_list {
  category_scroller: Scroller = new Scroller();
  desc_scroller: Scroller = new Scroller();
  @State private rippleVisible: boolean = false;
    @State flag: boolean = false;
  @State private rippleScale: number = 0;
  @State private num: number = 0;
  @State private textforadvanced: string = 'pop up if high priority';
  private mg: number = 160;

  @State arr: Nestedlistitems[] = []
  @State arri: Nestedlistitems[] = []
  build() {
    Scroll(this.category_scroller) {
      Column() {
        List(){
          ForEach(this.arri, (item) => {
                  ListItem() {
                      if (item.issinglelinelist == true) {
                        Flex() {
                          Flex({ alignItems: ItemAlign.Center }) {
                            Image(item.leadingcontent).objectFit(ImageFit.Cover).width(40).height(40);
                            Text(item.leadingcontent).fontSize(30);
                          }.width(80).height(60).padding(10);
                          Flex({alignItems: ItemAlign.Center}){
                            Column() {
                              Text(item.Maindata).fontSize(32).fontWeight(FontWeight.Bold)
                                .textOverflow({ overflow: TextOverflow.Ellipsis })
                                .maxLines(1);
                            }.alignItems(HorizontalAlign.Start).padding({ right: 15 });
                          }.width(210).height(60);
                          Flex({ alignItems: ItemAlign.Center }) {
                            Image(item.trailingcontent).objectFit(ImageFit.Cover).width(30).height(30);
                            Text(item.trailingcontent).fontSize(25);
                          }.padding(5);
                        }  .height(60);
                      }
                      else {
                        if (item.istrailingcontent_image === true) {
                          Flex() {
                            Flex({ alignItems: ItemAlign.Center }) {
                              Image(item.leadingcontent).objectFit(ImageFit.Cover).width(60).height(70);
                            }.width(80).height(100).padding(10);
                            Flex({ alignItems: ItemAlign.Center }) {
                              Column() {
                                //Scroll(this.desc_scroller) {
                                Text(item.Maindata).fontSize(32).fontWeight(FontWeight.Bold)
                                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                                  .maxLines(1)
                                Text(item.Subdata).fontSize(20)
                                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                                  .maxLines(1)
                                // }.scrollable(ScrollDirection.Horizontal)
                              }.alignItems(HorizontalAlign.Start).padding({ right: 15 })
                            }.width(210).height(70);

                            Flex({ alignItems: ItemAlign.Center }) {
                              Image(item.trailingcontent).objectFit(ImageFit.Cover).width(30).height(30);
                            }.padding(5);
                          }
                          .height(100);
                        }
                        else {
                          Flex() {
                            Flex({ alignItems: ItemAlign.Center }) {
                              Image(item.leadingcontent).objectFit(ImageFit.Cover).width(60).height(70);
                            }.width(80).height(100).padding(10);
                            Flex({ alignItems: ItemAlign.Center }) {
                              Column() {
                                //Scroll(this.desc_scroller) {
                                Text(item.Maindata).fontSize(32).fontWeight(FontWeight.Bold)
                                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                                  .maxLines(1)
                                // }.scrollable(ScrollDirection.Horizontal)
                                // Scroll(this.desc_scroller) {
                                Text(item.Subdata).fontSize(20)
                                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                                  .maxLines(1)
                                // }.scrollable(ScrollDirection.Horizontal)
                              }.alignItems(HorizontalAlign.Start).padding({ right: 15 })
                            }.width(190).height(70);
                            Flex({ alignItems: ItemAlign.Center }) {
                              Text(item.trailingcontent).fontSize(25);
                            }.padding({ right: 5 });

                          }
                          .height(100);

                        }
                      }
                    }

          })
          ListItem(){
            Flex() {
              Flex({ alignItems: ItemAlign.Center }) {
              }.width(10).height(40);
              Column() {
                Text(this.textforadvanced).fontSize(32).fontWeight(FontWeight.Bold)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(1);
              }.alignItems(HorizontalAlign.Start).width(280).height(50).padding({ right: 15 });
             Flex(){
               Toggle({ type: ToggleType.Switch, isOn: this.flag }).width(70).height(25).onChange((event) => {
                 this.flag = !this.flag;
                 console.log('chnaged'+this.flag);
             })

             }.width(70).height(25)
            }.height(55); //.padding(10);
          }
          ListItem() {
            Flex() {
              Row() {
                Divider().vertical(false).strokeWidth(0.5);
              }

            } .visibility(this.flag ? Visibility.Visible : Visibility.Hidden)

          }
          ListItem() {
            Flex() {
              Text('Advanced').fontSize(23) .visibility(this.flag ? Visibility.Visible : Visibility.Hidden).padding({left:20});
            }.padding({bottom:10});
          }

                ForEach(this.arr, (item) => {
                  ListItem() {
                    if (item.issinglelinelist == true) {
                      Flex() {
                        Flex({ alignItems: ItemAlign.Center }) {
                          Image(item.leadingcontent).objectFit(ImageFit.Cover).width(40).height(40);
                          Text(item.leadingcontent).fontSize(30);
                        }.width(80).height(60).padding(10);
                        Flex({alignItems: ItemAlign.Center}){
                          Column() {
                            Text(item.Maindata).fontSize(32).fontWeight(FontWeight.Bold)
                              .textOverflow({ overflow: TextOverflow.Ellipsis })
                              .maxLines(1);
                          }.alignItems(HorizontalAlign.Start).padding({ right: 15 });
                        }.width(210).height(60);
                        Flex({ alignItems: ItemAlign.Center }) {
                          Image(item.trailingcontent).objectFit(ImageFit.Cover).width(30).height(30);
                          Text(item.trailingcontent).fontSize(25);
                        }.padding(5);


                      }  .visibility(this.flag ? Visibility.Visible : Visibility.Hidden).height(60); //.padding(10);
                    }
                    else {
                      if (item.istrailingcontent_image === true) {
                        Flex() {
                          Flex({ alignItems: ItemAlign.Center }) {
                            Image(item.leadingcontent).objectFit(ImageFit.Cover).width(60).height(70);
                          }.width(80).height(100).padding(10);
                          Flex({ alignItems: ItemAlign.Center }) {
                            Column() {
                              //Scroll(this.desc_scroller) {
                              Text(item.Maindata).fontSize(32).fontWeight(FontWeight.Bold)
                                .textOverflow({ overflow: TextOverflow.Ellipsis })
                                .maxLines(1)
                              Text(item.Subdata).fontSize(20)
                                .textOverflow({ overflow: TextOverflow.Ellipsis })
                                .maxLines(1)
                              // }.scrollable(ScrollDirection.Horizontal)
                            }.alignItems(HorizontalAlign.Start).padding({ right: 15 })
                          }.width(200).height(70);

                          Flex({ alignItems: ItemAlign.Center }) {
                            Image(item.trailingcontent).objectFit(ImageFit.Cover).width(30).height(30);
                          }.padding(5);
                        }.visibility(this.flag ? Visibility.Visible : Visibility.Hidden)
                        .height(100);
                      }
                      else {
                        Flex() {
                          Flex({ alignItems: ItemAlign.Center }) {
                            Image(item.leadingcontent).objectFit(ImageFit.Cover).width(60).height(70);
                          }.width(80).height(100).padding(10);
                          Flex({ alignItems: ItemAlign.Center }) {
                            Column() {
                              //Scroll(this.desc_scroller) {
                              Text(item.Maindata).fontSize(32).fontWeight(FontWeight.Bold)
                                .textOverflow({ overflow: TextOverflow.Ellipsis })
                                .maxLines(1)
                              // }.scrollable(ScrollDirection.Horizontal)
                              // Scroll(this.desc_scroller) {
                              Text(item.Subdata).fontSize(20).visibility(this.flag ? Visibility.Visible : Visibility.Hidden)
                                .textOverflow({ overflow: TextOverflow.Ellipsis })
                                .maxLines(1)
                              // }.scrollable(ScrollDirection.Horizontal)
                            }.alignItems(HorizontalAlign.Start).padding({ right: 15 })
                          }.width(190).height(70);
                          Flex({ alignItems: ItemAlign.Center }) {
                            Text(item.trailingcontent).fontSize(25);
                          }.padding({ right: 5 });
                        }.visibility(this.flag? Visibility.Visible : Visibility.Hidden)
                        .height(100);
                      }
                    }
                  }
                })
              }
        }
      }
    }
  }











