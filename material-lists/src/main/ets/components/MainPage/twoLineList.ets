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

import { TwoLineListModel } from './listModels/listmodels';
import { TwoLineListItems } from './listUtilities/list_classes';
import { ripple } from './animation/Ripple';
import { CommonGroupModel } from './listModels/common_group_model'
import { CommonProperties } from './listUtilities/list_common_properties'

@Entry
@Component
export struct TwoLineListGroup {
  @State models: CommonGroupModel.Model = undefined
  @State showDivider: boolean = true
  @State show_ripple: boolean = true;
  @State private options: TwoLineListItems [] = []
  @State private selectedListLabel: number = -1
  private onCheckChange: ((mainData: number) => void) = null

  aboutToAppear() {
    if (this.options == undefined) {
      this.options = []
    }
    if (this.selectedListLabel == null) {
      this.selectedListLabel = -1
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
          },
        )
      }
      .divider({ strokeWidth: this.models.getDividerStrokeWidth(), color: this.models.getDividerColor() })
      .visibility((this.models.getDivider() == true) ? Visibility.Visible : Visibility.Hidden)
    }
  }
}

@Component
export struct TwoLineList_Item {
  @State  showRipple: boolean = false
  @State model: TwoLineListModel = undefined
  @Link model2: CommonGroupModel.Model
  @State checked: boolean = false
  @State private clickCoordinates: Position = { x: 0, y: 0 }
  @State private rippleColor: string= '#808080'
  private onCheckChange: ((mainData: number) => void) = null
  @State containerSize: SizeOptions = { height: '110vp', width: '350vp' }

  aboutToAppear() {
    if (this.model == undefined) return
  }
  onClick: (event?: ClickEvent) => void

  build() {
    if (this.model != undefined && this.model.buildUI()) {
      Column() {
        Row() {
          if (this.model.getIsLeadingContentImage() === true && this.model.getIsTrailingContentImage() == true) {
            Flex() {
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListLeadingContent())
                  .objectFit(ImageFit.Cover)
                  .size(this.model2.getListLeadingContentImageSize());
              }.size(this.model2.getListLeadingContainerSize()).padding(this.model2.getLeadingRightSpace());
              Flex({ alignItems: ItemAlign.Center }) {
                Column() {
                  Text(this.model.getListLabel())
                    .fontSize(this.model2.getListMainDataSize())
                    .fontWeight(this.model2.getListMainDataFontWeight())
                    .fontColor(this.model2.getListMainDataFontColor())
                    .fontStyle(this.model2.getMainDataFontStyle())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                  Text(this.model.getListSubData())
                    .fontSize(this.model2.getListSubDataSize())
                    .fontWeight(this.model2.getListSubDataFontWeight())
                    .fontColor(this.model2.getListSubDataFontColor())
                    .fontStyle(this.model2.getSubDataFontStyle())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                }.alignItems(HorizontalAlign.Start).padding({ right: this.model2.getListDataRightSpace() })
              }.size(this.model2.getListDataContainerSize());
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListTrailingContent())
                  .objectFit(ImageFit.Cover)
                  .size(this.model2.getListTrailingContentImageSize());
              }.padding('5vp');
              ripple({
                rippleStartPosition: $clickCoordinates,
                size: $containerSize,
                showRipple: $showRipple,
                animationColor: $rippleColor
              })
            }.size(this.model2.getListContainerSize());
          }
          else if (this.model.getIsLeadingContentImage() === true && this.model.getIsTrailingContentImage() == false) {
            Flex() {
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListLeadingContent())
                  .objectFit(ImageFit.Cover)
                  .size(this.model2.getListLeadingContentImageSize());
              }.size(this.model2.getListLeadingContainerSize()).padding(this.model2.getLeadingRightSpace());
              Flex({ alignItems: ItemAlign.Center }) {
                Column() {
                  Text(this.model.getListLabel())
                    .fontSize(this.model2.getListMainDataSize())
                    .fontWeight(this.model2.getListMainDataFontWeight())
                    .fontColor(this.model2.getListMainDataFontColor())
                    .fontStyle(this.model2.getMainDataFontStyle())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                  Text(this.model.getListSubData())
                    .fontSize(this.model2.getListSubDataSize())
                    .fontWeight(this.model2.getListSubDataFontWeight())
                    .fontStyle(this.model2.getSubDataFontStyle())
                    .fontColor(this.model2.getListMainDataFontColor())
                    .fontColor(this.model2.getListSubDataFontColor())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                }.alignItems(HorizontalAlign.Start).padding({ right: this.model2.getListDataRightSpace() })
              }.size(this.model2.getListDataContainerSize());
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListTrailingContent()).fontSize(this.model2.getListTrailingContentTextSize());
              }.padding({ right: '5vp' });
              ripple({
                rippleStartPosition: $clickCoordinates,
                size: $containerSize,
                showRipple: $showRipple,
                animationColor: $rippleColor
              })
            }.size(this.model2.getListContainerSize());
          }
          else if (this.model.getIsLeadingContentImage() === false && this.model.getIsTrailingContentImage() == true) {
            Flex() {
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListLeadingContent()).fontSize(this.model2.getListLeadingContentTextSize());
              }.size(this.model2.getListLeadingContainerSize()).padding(this.model2.getLeadingRightSpace());
              Flex({ alignItems: ItemAlign.Center }) {
                Column() {
                  Text(this.model.getListLabel())
                    .fontSize(this.model2.getListMainDataSize())
                    .fontWeight(this.model2.getListMainDataFontWeight())
                    .fontColor(this.model2.getListMainDataFontColor())
                    .fontStyle(this.model2.getMainDataFontStyle())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)

                  Text(this.model.getListSubData())
                    .fontSize(this.model2.getListSubDataSize())
                    .fontWeight(this.model2.getListSubDataFontWeight())
                    .fontColor(this.model2.getListSubDataFontColor())
                    .fontStyle(this.model2.getSubDataFontStyle())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                }.alignItems(HorizontalAlign.Start).padding({ right: this.model2.getListDataRightSpace() })
              }.size(this.model2.getListDataContainerSize());
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListTrailingContent())
                  .objectFit(ImageFit.Cover)
                  .size(this.model2.getListTrailingContentImageSize());
              }.padding('5vp');
              ripple({
                rippleStartPosition: $clickCoordinates,
                size: $containerSize,
                showRipple: $showRipple,
                animationColor: $rippleColor
              })
            }.size(this.model2.getListContainerSize());
          }
          else {
            Flex() {
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListLeadingContent()).fontSize(this.model2.getListLeadingContentTextSize());
              }.size(this.model2.getListLeadingContainerSize()).padding(this.model2.getLeadingRightSpace());
              Flex({ alignItems: ItemAlign.Center }) {
                Column() {
                  Text(this.model.getListLabel())
                    .fontSize(this.model2.getListMainDataSize())
                    .fontWeight(this.model2.getListMainDataFontWeight())
                    .fontColor(this.model2.getListMainDataFontColor())
                    .fontStyle(this.model2.getMainDataFontStyle())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                  Text(this.model.getListSubData())
                    .fontSize(this.model2.getListSubDataSize())
                    .fontWeight(this.model2.getListSubDataFontWeight())
                    .fontColor(this.model2.getListSubDataFontColor())
                    .fontStyle(this.model2.getSubDataFontStyle())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                }.alignItems(HorizontalAlign.Start).padding({ right: this.model2.getListDataRightSpace() })
              }.size(this.model2.getListDataContainerSize());
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListTrailingContent()).fontSize(this.model2.getListTrailingContentTextSize());
              }.padding('5vp');
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
        this.containerSize = this.model2.getListContainerSize();
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

export { TwoLineListModel } from './listModels/listmodels';

export { TwoLineListItems } from './listUtilities/list_classes' ;