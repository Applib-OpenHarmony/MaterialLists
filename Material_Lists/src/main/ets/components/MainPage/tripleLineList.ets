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

import { ThreeLineListModel } from './listModels/listmodels';
import { ThreeLineListItems } from './listUtilities/list_classes';
import { TwoLineListModel } from './listModels/listmodels';
import {TwoLineList_Item}  from './twoLineList'
import {ripple} from './animation/Ripple';
import {CommonProperties} from  './listUtilities/list_common_properties'
import { CommonGroupModel } from './listModels/common_group_model'
@Entry
@Component
export struct ThreeLineListGroup {
  @State models: CommonGroupModel.Model = undefined
  @State private options: ThreeLineListItems [] = [
  ]
  @State show_ripple : boolean =false
  @State showDivider: boolean = true
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
              if (item.secondarySubData == null) {
                TwoLineList_Item({
                  model: new TwoLineListModel(item.leadingContent, item.mainData, item.subData, item.trailingContent, item.callback),
                  model2: $models,
                  checked: item.mainData == this.selectedListLabel,
                  onCheckChange: (mainData) => {
                    this.selectedListLabel = mainData
                    if (this.onCheckChange != null) {
                      this.onCheckChange(mainData);
                    }
                  }
                })
              }
              else {
                ThreeLineList_Item({
                  model: new ThreeLineListModel(item.leadingContent, item.mainData, item.subData, item.secondarySubData, item.trailingContent, item.callback),
                  model2: $models,
                  checked: item.mainData == this.selectedListLabel,
                  onCheckChange: (mainData) => {
                    this.selectedListLabel = mainData
                    if (this.onCheckChange != null) {
                      this.onCheckChange(mainData);
                    }
                  }

                })
              }
            }
          },
          item => item.mainData
        )
      }.divider({ strokeWidth: this.models.getDividerStrokeWidth(), color: this.models.getDividerColor() })
      .visibility((this.models.getDivider() == true) ? Visibility.Visible : Visibility.Hidden)
    }
  }
}

@Component
export struct ThreeLineList_Item {
  @Link model2: CommonGroupModel.Model
  private symbol:string ='-'
  @State private showRipple: boolean = false
  @State model: ThreeLineListModel = undefined
  private onCheckChange: ((mainData: number) => void) = null
  @State checked: boolean = false
  @State private clickCoordinates: Position = { x: 0, y: 0 }
  @State private rippleColor:ResourceColor=Color.Gray
  @State private containerSize: SizeOptions = { width: 360, height: 20 }
  onClick: (event?: ClickEvent) => void = (event) => {
    console.log('list item was clicked')
  }

  aboutToAppear() {
    if (this.model == undefined) return
  }

  build() {
    if (this.model != undefined && this.model.buildUI()) {
      Column() {
        Row() {
          if (this.model.getListTrailingImage() === true) {
            Flex() {
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListLeadingContent()).objectFit(ImageFit.Cover).size(this.model2.getListLeadingContentImageSize());
              }.size(this.model2.getListLeadingContainerSize()).padding(this.model2.getLeadingRightSpace ());
              Flex({ alignItems: ItemAlign.Center }) {
                Column() {
                  Text(this.model.getListLabel()).fontSize(this.model2.getListMainDataSize()).fontWeight(this.model2.getListMainDataFontWeight())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)

                  Text(this.model.getListSecondarySubData()+'-'+this.model.getListSubData()).fontSize(this.model2.getListSubDataSize())
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                      .maxLines(2)

                }.alignItems(HorizontalAlign.Start).padding({ right: this.model2.getListDataRightSpace() })
              }.size(this.model2.getListDataContainerSize());
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListTrailingContent()).objectFit(ImageFit.Cover).size(this.model2.getListTrailingContentImageSize());
              }.padding('5vp');
              ripple({
                rippleStartPosition: $clickCoordinates,
                size:$containerSize,
                showRipple: $showRipple,
                rippleColor : $rippleColor
              })
            }.size(this.model2.getListContainerSize());
          }
          else {
            Flex() {
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListLeadingContent()).objectFit(ImageFit.Cover).size(this.model2.getListLeadingContentImageSize());
              }.size(this.model2.getListLeadingContainerSize()).padding(this.model2.getLeadingRightSpace ());
              Flex({ alignItems: ItemAlign.Center }) {
                Column() {
                  Text(this.model.getListLabel()).fontSize(this.model2.getListMainDataSize()).fontWeight(this.model2.getListMainDataFontWeight())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                      Text(this.model.getListSecondarySubData()+'-'+this.model.getListSubData()).fontSize(this.model2.getListSubDataSize())

                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                        .maxLines(2)

                }.alignItems(HorizontalAlign.Start).padding({ right:this.model2.getListDataRightSpace() })
              }.size(this.model2.getListDataContainerSize());
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListTrailingContent()).fontSize(this.model2.getListTrailingContentTextSize());
              }.padding({ right: '5vp' });
              ripple({
                rippleStartPosition: $clickCoordinates,
                size:$containerSize,
                showRipple: $showRipple,
                rippleColor : $rippleColor
              })
            }.size(this.model2.getListContainerSize());
          }
        }

   }
      .onClick((event) => {
        this.clickCoordinates = {
          x: event.x,
          y: event.y
        }
        this.containerSize= this.model2.getListContainerSize()
        this.showRipple =  this.model2.getRippleAnimation()
        this.rippleColor=this.model2.getRippleColor()
        if (this.onClick) {
          setTimeout(() => {
            this.onClick(event)
          }, 300)
        }
        var listItemFunction = this.model.getListFunction()
        if (listItemFunction != null)
        listItemFunction()
      })
    }

  }
}
export { ThreeLineListModel } from'./listModels/listmodels';
export { ThreeLineListItems } from  './listUtilities/list_classes' ;
