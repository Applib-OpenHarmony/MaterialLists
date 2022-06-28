//import  { ripple } from '@ohos/Material_Lists'
/*
 * Copyright (c) 2022 Application Library Engineering Group.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export class Threelinelistitems {
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
export struct Tripleline_list {
  category_scroller: Scroller = new Scroller();
  desc_scroller: Scroller = new Scroller();
  @State private size: number = 10
  @State private x: number = 30
  @State private y: number = 10
  @State private rippleScale: number = 0
  @State private rippleVisible: boolean = false
  @State private isripplerequired: boolean = false
  @State private opacity: number = 0.2
  @State _width: number = 200
  @State _height: number = 80
  @State _radius: number = 0
  @State cnt: number = 0
  @State private showRipple: boolean = false
  @State private clickCoordinates: Position = { x: 0, y: 0 }
  rippleColor: ResourceColor = Color.Gray
  @State private containerSize: SizeOptions = { width: 360, height: 120 }

  @State arri: Threelinelistitems[] = []

  @State arr: boolean[]= [
    false, false, false, false, false, false, false, false, false
  ]
  onClick: (event?: ClickEvent) => void = (event) => {
    console.log('list item was clicked')
  }
  build() {
    Scroll(this.category_scroller) {
      Column({space:10}) {
        Flex() {
          Text('Items in cart').fontSize(45).fontWeight(FontWeight.Bold);
        }.padding(10)
        List() {
          ForEach(this.arri, (item) => {
            if(item.istrailingimage === true) {
              ListItem() {
                Flex() {
                  Flex({ alignItems: ItemAlign.Center }) {
                    Image(item.leadingicon).objectFit(ImageFit.Cover).width(60).height(60);
                  }.width('80vp').height(100).padding({ right: 10 });
                 Column() {
                      Text(item.Maindata).fontSize(35).fontWeight(FontWeight.Bold)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                        .maxLines(1)
                      Text(item.Subdata).fontSize(20)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                        .maxLines(2)
                  }.alignItems(HorizontalAlign.Start).width(190).height(90).padding({ right: 15 });
                  Flex({ alignItems: ItemAlign.Center }) {
                    Image(item.trailingcontent).objectFit(ImageFit.Cover).width(35).height(35);
                  }.padding(5);
               /*   ripple({
                    size: $containerSize,
                    rippleStartPosition: $clickCoordinates,
                    showRipple: $showRipple,
                    color: this.rippleColor,

                  })*/
                }.padding(10).height(120)
              }
              .onClick((event: any) => {
                this.clickCoordinates = {
                  x: event.x,
                  y: event.y
                }
                this.showRipple = this.isripplerequired
                setTimeout(() => {
                  this.onClick(event)
                }, 300)

              })
            }
            else {
              ListItem() {
                Flex() {
                  Flex({ alignItems: ItemAlign.Center }) {
                    Image(item.leadingicon).objectFit(ImageFit.Cover).width(60).height(60);
                  }.width(80).height(100).padding({ right: 10 });
                  Column() {
                      Text(item.Maindata).fontSize(35).fontWeight(FontWeight.Bold)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                        .maxLines(1)
                      Text(item.Subdata).fontSize(20)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                        .maxLines(2)
                  }.alignItems(HorizontalAlign.Start).width(190).height(60).padding({ right: 15 });
                  Flex({ alignItems: ItemAlign.Center }) {
                    Text(item.trailingcontent).fontSize(30);
                  }.padding({ right: 5 });
                 /* ripple({
                    size: $containerSize,


                    rippleStartPosition: $clickCoordinates,
                    showRipple: $showRipple,
                    color: this.rippleColor,

                  })*/
                }.padding(10).height(120)
              }
              .onClick((event: any) => {
                this.clickCoordinates = {
                  x: event.x,
                  y: event.y
                }


                this.showRipple = this.isripplerequired
                setTimeout(() => {
                  this.onClick(event)
                }, 300)

              })
            }
          })
        }.divider({strokeWidth:1.4,color: Color.Black})
      }
    }
  }
}
