import  { ripple } from '@ohos/Material_Lists'
export class Twolinelistitems {
  leadingicon:  Resource
  Maindata: string
  Subdata: string
  trailingcontent: Resource | string
  istrailingimage:boolean
  istrailingtext:boolean
  constructor(leadingicon: Resource,Maindata: string,Subdata: string,trailingcontent:Resource | string) {
    this.Maindata=Maindata;
    this.Subdata=Subdata;
    this.leadingicon=leadingicon;
    this.trailingcontent = trailingcontent;
    if( typeof trailingcontent === 'string' || trailingcontent instanceof String) {
      this.istrailingtext = true;
      this.istrailingimage = false;
    }
    else {
      this.istrailingimage = true;
      this.istrailingtext = false;
    }
  }
}

@Component
export struct Twoline_list {
  category_scroller: Scroller = new Scroller();
  desc_scroller: Scroller = new Scroller();
  @State private x: number = 30
  @State private y: number = 10
  @State private showRipple: boolean = false
  private mg: number = 0
  @State private clickCoordinates: Position = { x: 0, y: 0 }
  rippleColor: ResourceColor = Color.Gray
  @State arr: boolean[] = [false, false, false, false, false, false, false, false,false]
  @State private containerSize: SizeOptions = { width: 360, height: 100 }
  @State arri: Twolinelistitems[] = []

  onClick: (event?: ClickEvent) => void = (event) => {
    console.log('list item was clicked')
  }

  build() {
    Scroll(this.category_scroller) {
      Flex() {
        Column({ space: 5 }) {
          Flex() {
            Text('Items in cart').fontSize(45).fontWeight(FontWeight.Bold);
          };
          List() {
            ForEach(this.arri, (item) => {
              if (item.istrailingimage === true) {
                ListItem() {
                  Flex() {
                    Flex({ alignItems: ItemAlign.Center }) {
                      Image(item.leadingicon).objectFit(ImageFit.Cover).width(60).height(70);
                    }.width(80).height(90).padding(10);
                    Flex({ alignItems: ItemAlign.Center }) {
                      Column() {

                        Text(item.Maindata).fontSize(37).fontWeight(FontWeight.Bold)
                          .textOverflow({ overflow: TextOverflow.Ellipsis })
                          .maxLines(1)
                        Text(item.Subdata).fontSize(22)
                          .textOverflow({ overflow: TextOverflow.Ellipsis })
                          .maxLines(1)

                      }.alignItems(HorizontalAlign.Start).padding({ right: 15 })
                    }.width(210).height(70);
                    Flex({ alignItems: ItemAlign.Center }) {
                      Image(item.trailingcontent).objectFit(ImageFit.Cover).width(30).height(30);
                    }.padding(5);
                    ripple({
                      size: $containerSize,
                      rippleStartPosition: $clickCoordinates,
                      showRipple: $showRipple,
                      color: this.rippleColor,
                    })
                  }
                }
                .height(108)

                .onClick((event) => {
                  this.clickCoordinates = {
                    x: event.x,
                    y: event.y
                  }
                  this.showRipple = true
                  setTimeout(() => {
                    this.onClick(event)
                  }, 300)

                })
              }
              else {
                ListItem() {
                  Flex() {
                    Flex({ alignItems: ItemAlign.Center }) {
                      Image(item.leadingicon).objectFit(ImageFit.Cover).width(60).height(70);
                    }.width(80).height(90).padding(10);
                    Flex({ alignItems: ItemAlign.Center }) {
                      Column() {
                        Text(item.Maindata).fontSize(37).fontWeight(FontWeight.Bold)
                          .textOverflow({ overflow: TextOverflow.Ellipsis })
                          .maxLines(1)
                        Text(item.Subdata).fontSize(22)
                          .textOverflow({ overflow: TextOverflow.Ellipsis })
                          .maxLines(1)
                      }.alignItems(HorizontalAlign.Start).padding({ right: 15 })
                    }.width(190).height(70);
                    Flex({ alignItems: ItemAlign.Center }) {
                      Text(item.trailingcontent).fontSize(30);
                    }.padding({ right: 5 });
                      ripple({
                        size: $containerSize,
                        rippleStartPosition: $clickCoordinates,
                        showRipple: $showRipple,
                        color: this.rippleColor,
                      })
                  }
                  .height(108)
                }
                .onClick((event) => {

                  this.clickCoordinates = {
                    x: event.x,
                    y: event.y
                  }
                  this.showRipple = true
                  setTimeout(() => {
                  },300)
                })
              }
            })
          }.divider({ strokeWidth: 1.4, color: Color.Black })

        }.width(350).height(900);
      }
    }
  }
}

