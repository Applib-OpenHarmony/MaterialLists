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

import { TwoLineListModel } from './listmodels';
import { TwoLineListItems } from './list_classes';
import {ripple} from './Ripple';
@Entry
@Component
export struct TwoLineListGroup {
@State private options: TwoLineListItems [] = [
  new TwoLineListItems($r('app.media.icon'), "Bat", 'in stock', $r('app.media.icon'),function ab(){console.log('1');}),
    new TwoLineListItems($r('app.media.icon'), "Ben", 'in stock there', $r('app.media.icon'),function ab(){console.log('1');})
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
              TwoLineList_Item({
                model: new TwoLineListModel( item.leadingContent,item.mainData,item.subData,item.trailingContent,item.callback),
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
export struct TwoLineList_Item {
  @State private showRipple: boolean = false
  @State model: TwoLineListModel = undefined
  private onCheckChange: ((mainData: number) => void) = null
  @State checked: boolean = false
  @State private clickCoordinates: Position = { x: 0, y: 0 }
  rippleColor: ResourceColor = Color.Gray
  @State private containerSize: SizeOptions = { width: 360, height: 108 }
  aboutToAppear() {
    if (this.model == undefined) return
  }
  onClick: (event?: ClickEvent) => void = (event) => {
    console.log('list item was clicked')
  }

  build() {
    if (this.model != undefined && this.model.buildUI()) {
      Column() {
        Row() {
          if (this.model.getListTrailingImage() === true) {
            Flex() {
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListLeadingContent()).objectFit(ImageFit.Cover).width(60).height(70);
              }.width(80).height(90).padding(10);
              Flex({ alignItems: ItemAlign.Center }) {
                Column() {
                  Text(this.model.getListLabel()).fontSize(37).fontWeight(FontWeight.Bold)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                  Text(this.model.getListSubData()).fontSize(22)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                }.alignItems(HorizontalAlign.Start).padding({ right: 15 })
              }.width(210).height(70);
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListTrailingContent()).objectFit(ImageFit.Cover).width(30).height(30);
              }.padding(5);
              ripple({
                size: $containerSize,
                rippleStartPosition: $clickCoordinates,
                showRipple: $showRipple,
                color: this.rippleColor,
              })
            }.size(this.model.getListContainerSize());
          }
          else {
            Flex() {
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListLeadingContent()).objectFit(ImageFit.Cover).width(60).height(70);
              }.width(80).height(90).padding(10);
              Flex({ alignItems: ItemAlign.Center }) {
                Column() {
                  Text(this.model.getListLabel()).fontSize(37).fontWeight(FontWeight.Bold)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                  Text(this.model.getListSubData()).fontSize(22)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                }.alignItems(HorizontalAlign.Start).padding({ right: 15 })
              }.width(190).height(70);
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListTrailingContent()).fontSize(30);
              }.padding({ right: 5 });
              ripple({
                size: $containerSize,
                rippleStartPosition: $clickCoordinates,
                showRipple: $showRipple,
                color: this.rippleColor,
              })
            }.size(this.model.getListContainerSize());
          }
        }
      }

          .onClick((event) => {

            this.clickCoordinates = {
              x: event.x,
              y: event.y
            }
            this.showRipple = true
            setTimeout(() => {
            }, 300)
          })
        }

      }
    }


export { TwoLineListModel } from './listmodels';
export { TwoLineListItems } from './list_classes';