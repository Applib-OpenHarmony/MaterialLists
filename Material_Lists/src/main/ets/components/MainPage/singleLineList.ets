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

import { SingleLineListModel } from './listmodels';
import { SingleLineListItems } from './list_classes';
import {ripple} from './Ripple';
@Entry
@Component
export struct SingleLineListGroup {
  @State private options: SingleLineListItems [] = [
    new SingleLineListItems([$r('app.media.icon'), "Bat", $r('app.media.icon'),function ab(){console.log('1');}]),
    new SingleLineListItems([$r('app.media.icon'), "Bat", $r('app.media.icon'),function ab(){console.log('1');}])
  ]
  @State private selectedListLabel: number = -1
  private onCheckChange: ((mainData: number)=>void) = null
  aboutToAppear() {
    if (this.options == undefined) {
      this.options = []
    }
    if (this.selectedListLabel == null) {
      this.selectedListLabel =-1
    }
  }
  build() {
    Column() {
      List() {
        ForEach(
          this.options,
          (item) => {

            ListItem() {

              SingleLineList_item({

                model: new SingleLineListModel( item.leadingContent,item.mainData,item.trailingContent,item.callback),
                checked: item.mainData == this.selectedListLabel,
                onCheckChange: (mainData) => {
                  this.selectedListLabel = mainData
                  if (this.onCheckChange != null) {
                    this.onCheckChange(mainData);
                  }
                }
              })
            }
          },
          item => item.mainData
        )
      }.divider({ strokeWidth: 1.4, color: Color.Black })
    }
  }
}

@Component
export struct SingleLineList_item {
  @State checked: boolean = false
  @State model: SingleLineListModel = undefined
  private onCheckChange: ((mainData: number) => void) = null
  @State rippleSize : number = 10
  @State private clickCoordinates: Position = { x: 0, y: 0 }
  private rippleColor: ResourceColor = Color.Gray
  @State private containerSize: SizeOptions = { width: 360, height: 108 }
  @State private size: SizeOptions = { width: 360, height: 100 }
  @State private showRipple: boolean = false
  onClick: (event?: ClickEvent) => void = (event) => {
    console.log('list item was clicked')
  }

  build() {
    if (this.model != undefined && this.model.buildUI()) {
      Column() {
        Row() {
          if (this.model.getIsLeadingIconPresent() == false && this.model.getIsTrailingIconPresent() == false) {
            Flex() {
              Flex() {
              }.padding({ right: 20 }).height(50).width(70);
              Flex({ alignItems: ItemAlign.Center }) {

                Text(this.model.getListLabel()).fontSize(30)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(1)
              }.width(190).height(50).padding({ right: 15 });
              Flex() {
              }.width(50).height(50);
            }.padding(7);
          }
          else if (this.model.getIsLeadingIconPresent() == true && this.model.getIsTrailingIconPresent() == true) {
            Flex() {
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListLeadingContent()).objectFit(ImageFit.Cover).width(50).height(50).borderRadius(5);
              }.padding({ right: 20 }).height(50).width(70);
              Flex({ alignItems: ItemAlign.Center }) {

                Text(this.model.getListLabel()).fontSize(30)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(1)

              }.width(190).height(50).padding({ right: 15 });
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListTrailingContent()).objectFit(ImageFit.Cover).width(35).height(35);
              }.width(50).height(50);
            }.padding(7);
          }
          else if (this.model.getIsLeadingIconPresent() == true && this.model.getIsTrailingIconPresent() == false) {
            Flex() {
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListLeadingContent()).objectFit(ImageFit.Cover).width(50).height(50).borderRadius(5);
              }.padding({ right: 20 }).height(50).width(70);
              Flex({ alignItems: ItemAlign.Center }) {

                Text(this.model.getListLabel()).fontSize(30)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(1)

              }.width(190).height(50).padding({ right: 15 });
              Flex() {
              }.width(50).height(50);
            }.padding(7);
          }
          else if (this.model.getIsLeadingIconPresent() == false && this.model.getIsTrailingIconPresent() == true) {
            Flex() {
              Flex() {
              }.padding({ right: 20 }).height(50).width(70);
              Flex({ alignItems: ItemAlign.Center }) {

                Text(this.model.getListLabel()).fontSize(30)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(1)

              }.width(190).height(50).padding({ right: 15 });
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListTrailingContent()).objectFit(ImageFit.Cover).width(35).height(35);
              }.width(50).height(50);
            }.padding(7);
          }


        }
        .padding(4);


      }
      .onClick((event)=>{
        this.clickCoordinates = {
          x: event.x,
          y: event.y
        }
        this.showRipple = true
        setTimeout(()=> {
          this.onClick(event)
        }, 300)

        this.model.getListFunction()()

      }
      )
    }
  }
}
export { SingleLineListModel } from './listmodels';
export { SingleLineListItems } from './list_classes';






