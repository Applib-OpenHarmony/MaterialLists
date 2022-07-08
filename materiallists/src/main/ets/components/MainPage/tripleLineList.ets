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
import { ThreeLineListItems } from './listUtilities/listClasses';
import { TwoLineListModel } from './listModels/listmodels';
import { TwoLineList_Item }  from './twoLineList'
import { ripple } from './animation/Ripple';
import { CommonGroupModel } from './listModels/commonGroupModel'

@Entry
@Component
export struct ThreeLineListGroup {
  @State models: CommonGroupModel.Model = undefined
  @State private options: ThreeLineListItems [] = []
  @State showDivider: boolean = true

  aboutToAppear() {
    if (this.options == undefined) {
      this.options = []
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
                })
              }
              else {
                ThreeLineList_Item({
                  model: new ThreeLineListModel(item.leadingContent, item.mainData, item.subData, item.secondarySubData, item.trailingContent, item.callback),
                  model2: $models,
                })
              }
            }
          },
        )
      }
      .divider({
        strokeWidth: (this.models.getDivider() == true) ? this.models.getDividerStrokeWidth() : 0,
        color: (this.models.getDivider() == true) ? this.models.getDividerColor() : this.models.getBackGroundColor()
      })
    }
  }
}

@Component
export struct ThreeLineList_Item {
  @Link model2: CommonGroupModel.Model
  private symbol: string = '-'
  @State private showRipple: boolean = false
  @State model: ThreeLineListModel = undefined
  @State private clickCoordinates: Position = { x: 0, y: 0 }
  @State private rippleColor: string= '#808080'
  @State private containerSize: SizeOptions = { width: 360, height: 20 }
  onClick: (event?: ClickEvent) => void

  aboutToAppear() {
    if (this.model == undefined) return
  }

  build() {
    if (this.model != undefined && this.model.buildUI()) {
      Column() {
        Row() {
          if (this.model.getIsLeadingContentImage() === true && this.model.getIsTrailingContentImage() == true) {
            Flex({ alignItems: ItemAlign.Center }) {
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListLeadingContent())
                  .objectFit(ImageFit.Cover)
                  .size(this.model2.getListLeadingContentImageSize())
                  .borderRadius(this.model2.getLeadingImageBorderRadius())
                  .padding({ left: this.model2.getSpaceOnLeft() });
              }
              .size(this.model2.getListLeadingContainerSize());
              Flex({ alignItems: ItemAlign.Center }) {
                Column() {
                  Text(this.model.getListLabel())
                    .fontSize(this.model2.getListMainDataSize())
                    .fontWeight(this.model2.getListMainDataFontWeight())
                    .fontColor(this.model2.getListMainDataFontColor())
                    .fontStyle(this.model2.getMainDataFontStyle())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                  Text(this.model.getListSecondarySubData() + this.model2.getSymbol() + this.model.getListSubData())
                    .fontSize(this.model2.getListSubDataSize())
                    .fontWeight(this.model2.getListSubDataFontWeight())
                    .fontColor(this.model2.getListSubDataFontColor())
                    .fontStyle(this.model2.getSubDataFontStyle())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(2)
                }.alignItems(HorizontalAlign.Start).padding({ right: this.model2.getListDataRightSpace() })
              }.size(this.model2.getListDataContainerSize());
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListTrailingContent())
                  .objectFit(ImageFit.Cover)
                  .borderRadius(this.model2.getTrailingImageBorderRadius())
                  .size(this.model2.getListTrailingContentImageSize())
                  .padding({ right: '5vp' });
              }.size(this.model2.getListTrailingContainerSize());
              ripple({
                rippleStartPosition: $clickCoordinates,
                size: $containerSize,
                showRipple: $showRipple,
                animationColor: $rippleColor
              })
            }.size(this.model2.getListContainerSize());
          }
          else if (this.model.getIsLeadingContentImage() === true && this.model.getIsTrailingContentImage() == false) {
            Flex({ alignItems: ItemAlign.Center }) {
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListLeadingContent())
                  .objectFit(ImageFit.Cover)
                  .size(this.model2.getListLeadingContentImageSize())
                  .borderRadius(this.model2.getLeadingImageBorderRadius())
                  .padding({ left: this.model2.getSpaceOnLeft() });
              }
              .size(this.model2.getListLeadingContainerSize());
              Flex({ alignItems: ItemAlign.Center }) {
                Column() {
                  Text(this.model.getListLabel())
                    .fontSize(this.model2.getListMainDataSize())
                    .fontWeight(this.model2.getListMainDataFontWeight())
                    .fontColor(this.model2.getListMainDataFontColor())
                    .fontStyle(this.model2.getMainDataFontStyle())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                  Text(this.model.getListSecondarySubData() + this.model2.getSymbol() + this.model.getListSubData())
                    .fontSize(this.model2.getListSubDataSize())
                    .fontColor(this.model2.getListSubDataFontColor())
                    .fontStyle(this.model2.getSubDataFontStyle())
                    .fontWeight(this.model2.getListSubDataFontWeight())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(2)
                }.alignItems(HorizontalAlign.Start).padding({ right: this.model2.getListDataRightSpace() })
              }.size(this.model2.getListDataContainerSize());
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListTrailingContent())
                  .fontSize(this.model2.getListTrailingContentTextSize())
                  .fontWeight(this.model2.getListSubDataFontWeight())
                  .padding({ right: '5vp' });
              }.size(this.model2.getListTrailingContainerSize());
              ripple({
                rippleStartPosition: $clickCoordinates,
                size: $containerSize,
                showRipple: $showRipple,
                animationColor: $rippleColor
              })
            }.size(this.model2.getListContainerSize());
          }
          else if (this.model.getIsLeadingContentImage() === false && this.model.getIsTrailingContentImage() == true) {
            Flex({ alignItems: ItemAlign.Center }) {
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListLeadingContent())
                  .fontSize(this.model2.getListLeadingContentTextSize())
                  .padding({ left: this.model2.getSpaceOnLeft() });
              }
              .size(this.model2.getListLeadingContainerSize());
              Flex({ alignItems: ItemAlign.Center }) {
                Column() {
                  Text(this.model.getListLabel())
                    .fontSize(this.model2.getListMainDataSize())
                    .fontWeight(this.model2.getListMainDataFontWeight())
                    .fontColor(this.model2.getListMainDataFontColor())
                    .fontStyle(this.model2.getMainDataFontStyle())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                  Text(this.model.getListSecondarySubData() + this.model2.getSymbol() + this.model.getListSubData())
                    .fontSize(this.model2.getListSubDataSize())
                    .fontWeight(this.model2.getListSubDataFontWeight())
                    .fontColor(this.model2.getListSubDataFontColor())
                    .fontStyle(this.model2.getSubDataFontStyle())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(2)
                }.alignItems(HorizontalAlign.Start).padding({ right: this.model2.getListDataRightSpace() })
              }.size(this.model2.getListDataContainerSize());
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListTrailingContent())
                  .objectFit(ImageFit.Cover)
                  .borderRadius(this.model2.getTrailingImageBorderRadius())
                  .size(this.model2.getListTrailingContentImageSize())
                  .padding({ right: '5vp' });
              }.size(this.model2.getListTrailingContainerSize());
              ripple({
                rippleStartPosition: $clickCoordinates,
                size: $containerSize,
                showRipple: $showRipple,
                animationColor: $rippleColor
              })
            }.size(this.model2.getListContainerSize());
          }
          else {
            Flex({ alignItems: ItemAlign.Center }) {
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListLeadingContent())
                  .fontSize(this.model2.getListLeadingContentTextSize())
                  .padding({ left: this.model2.getSpaceOnLeft() });
              }
              .size(this.model2.getListLeadingContainerSize());
              Flex({ alignItems: ItemAlign.Center }) {
                Column() {
                  Text(this.model.getListLabel())
                    .fontSize(this.model2.getListMainDataSize())
                    .fontWeight(this.model2.getListMainDataFontWeight())
                    .fontColor(this.model2.getListMainDataFontColor())
                    .fontStyle(this.model2.getMainDataFontStyle())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                  Text(this.model.getListSecondarySubData() + this.model2.getSymbol() + this.model.getListSubData())
                    .fontSize(this.model2.getListSubDataSize())
                    .fontWeight(this.model2.getListSubDataFontWeight())
                    .fontColor(this.model2.getListSubDataFontColor())
                    .fontStyle(this.model2.getSubDataFontStyle())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(2)
                }.alignItems(HorizontalAlign.Start).padding({ right: this.model2.getListDataRightSpace() })
              }.size(this.model2.getListDataContainerSize());
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListTrailingContent()).fontSize(this.model2.getListTrailingContentTextSize())
                  .padding({ right: '5vp' });
              }.size(this.model2.getListTrailingContainerSize());
              ripple({
                rippleStartPosition: $clickCoordinates,
                size: $containerSize,
                showRipple: $showRipple,
                animationColor: $rippleColor
              })
            }.size(this.model2.getListContainerSize());
          }
        }
      }.backgroundColor(this.model2.getBackGroundColor())
      .onClick((event) => {
        this.clickCoordinates = {
          x: event.x,
          y: event.y
        }
        this.containerSize = this.model2.getListContainerSize()
        this.showRipple = this.model2.getRippleAnimation()
        this.rippleColor = this.model2.getRippleColor()
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

export { ThreeLineListModel } from './listModels/listmodels';
export { ThreeLineListItems } from './listUtilities/listClasses' ;