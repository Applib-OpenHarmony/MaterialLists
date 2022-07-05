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

import { SingleLineListModel } from './listModels/listmodels';
import { SingleLineListItems } from './listUtilities/list_classes';
import { ripple } from './animation/Ripple'
import { CommonGroupModel } from './listModels/common_group_model'
import {CommonProperties} from  './listUtilities/list_common_properties'

@Entry
@Component
export struct SingleLineListGroup {
  @State models: CommonGroupModel.Model = undefined
  @State private options: SingleLineListItems [] = []
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
              SingleLineList_item({
                model2: $models,
                model: new SingleLineListModel(item.leadingContent, item.mainData, item.trailingContent, item.callback),
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
      }.divider({ strokeWidth:  this.models.getDividerStrokeWidth(), color: this.models.getDividerColor() })
      .visibility((this.models.getDivider() == true) ? Visibility.Visible : Visibility.Hidden)
    }
  }
}

@Component
export struct SingleLineList_item {
  @State checked: boolean = false
  @State model: SingleLineListModel = undefined
  @Link model2: CommonGroupModel.Model
  private onCheckChange: ((mainData: number) => void) = null
  @State private clickCoordinates: Position = { x: 0, y: 0 }
  @State  showRipple : boolean = false
  @State  rippleColor: string ='#FF0000'
  @State containerSize:SizeOptions ={height:'90vp',width:'350vp'}
  onClick: (event?: ClickEvent) => void = (event) => {
  }
  build() {
    if (this.model != undefined && this.model.buildUI()) {
      Column() {
        Row() {
          if (this.model.getIsLeadingContentImage() == true && this.model.getIsTrailingContentImage() == true) {
            Flex({ alignItems: ItemAlign.Center }) {
                Flex({ alignItems: ItemAlign.Center }) {
                  Image(this.model.getListLeadingContent())
                    .objectFit(ImageFit.Cover)
                    .size(this.model2.getListLeadingContentImageSize())
                    .borderRadius(this.model2.getLeadingImageBorderRadius())
                  .padding({left:'10vp'});
                }
                .padding(this.model2.getLeadingRightSpace())
                .size(this.model2.getListLeadingContainerSize())
                .padding({ top: this.model2.getSpaceOnTop() });

                Flex({ alignItems: ItemAlign.Center }) {
                  Text(this.model.getListLabel())
                    .fontSize(this.model2.getListMainDataSize())
                    .fontWeight(this.model2.getListMainDataFontWeight())
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .maxLines(1)
                }.size(this.model2.getListDataContainerSize()).padding({ top: this.model2.getSpaceOnTop() });
                Flex({ alignItems: ItemAlign.Center }) {
                  Image(this.model.getListTrailingContent())
                    .objectFit(ImageFit.Cover)
                    .size(this.model2.getListTrailingContentImageSize())
                    .borderRadius(this.model2.getTrailingImageBorderRadius());
                }.size(this.model2.getListTrailingContainerSize()).padding({ top: this.model2.getSpaceOnTop() });

              ripple({
                rippleStartPosition: $clickCoordinates,
                size:$containerSize,
                showRipple: $showRipple,
                animationColor : $rippleColor
              })
            }

          }
          else if (this.model.getIsLeadingContentImage() == true && this.model.getIsTrailingContentImage() == false) {
            Flex({ alignItems: ItemAlign.Center }) {
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListLeadingContent())
                  .objectFit(ImageFit.Cover)
                  .size(this.model2.getListLeadingContentImageSize())
                  .borderRadius(this.model2.getLeadingImageBorderRadius())
                  .padding({left:'10vp'});
              }.padding( this.model2.getLeadingRightSpace() ).size(this.model2.getListLeadingContainerSize()).padding({top:this.model2.getSpaceOnTop()});
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListLabel()).fontSize(this.model2.getListMainDataSize()).fontWeight(this.model2.getListMainDataFontWeight())
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(1)
              }.size(this.model2.getListDataContainerSize()).padding({top:this.model2.getSpaceOnTop()});
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListTrailingContent())
                  .fontSize(this.model2.getListTrailingContentTextSize());
              }.size(this.model2.getListTrailingContainerSize()).padding({top:this.model2.getSpaceOnTop()});
              ripple({
                rippleStartPosition: $clickCoordinates,
                size:$containerSize,
                showRipple: $showRipple,
                animationColor : $rippleColor
              })
            }
          }
          else if (this.model.getIsLeadingContentImage() === false && this.model.getIsTrailingContentImage() === true) {
            Flex({ alignItems: ItemAlign.Center }) {
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListLeadingContent())
                  .fontSize(this.model2.getListLeadingContentTextSize())
                  .padding({left:'10vp'});
              }.padding( this.model2.getLeadingRightSpace() ).size(this.model2.getListLeadingContainerSize()).padding({top:this.model2.getSpaceOnTop()});
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListLabel()).fontSize(this.model2.getListMainDataSize()).fontWeight(this.model2.getListMainDataFontWeight())
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(1)
              }.size(this.model2.getListDataContainerSize()).padding({top:this.model2.getSpaceOnTop()});
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListTrailingContent())
                  .objectFit(ImageFit.Cover)
                  .size(this.model2.getListTrailingContentImageSize())
                 .borderRadius(this.model2.getTrailingImageBorderRadius());
              }.size(this.model2.getListTrailingContainerSize()).padding({top:this.model2.getSpaceOnTop()});
              ripple({
                rippleStartPosition: $clickCoordinates,
                size:$containerSize,
                showRipple: $showRipple,
                animationColor : $rippleColor
              })
            }

          }
          else if (this.model.getIsLeadingContentImage() == false && this.model.getIsTrailingContentImage() == false) {
            Flex({ alignItems: ItemAlign.Center }) {
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListLeadingContent())
                  .fontSize(this.model2.getListLeadingContentTextSize())
                  .padding({left:'10vp'});
              }.padding( this.model2.getLeadingRightSpace() ).size(this.model2.getListLeadingContainerSize()).padding({top:this.model2.getSpaceOnTop()});
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListLabel()).fontSize(this.model2.getListMainDataSize()).fontWeight(this.model2.getListMainDataFontWeight())
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(1)
              }.size(this.model2.getListDataContainerSize()).padding({top:this.model2.getSpaceOnTop()});
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListTrailingContent())
                  .fontSize(this.model2.getListTrailingContentTextSize());
              }.size(this.model2.getListTrailingContainerSize()).padding({top:this.model2.getSpaceOnTop()});
              ripple({
                rippleStartPosition: $clickCoordinates,
                size:$containerSize,
                showRipple: $showRipple,
                animationColor : $rippleColor
              })
            }
          }
        }

      }.size(this.model2.getListContainerSize())
      .onClick((event) => {
        this.clickCoordinates = {
          x: event.x,
          y: event.y
        }
        this.showRipple = this.model2.getRippleAnimation()
        this.containerSize= this.model2.getListContainerSize()
       this.rippleColor=this.model2.getRippleColor()
        setTimeout(() => {
          this.onClick(event)
        }, 300)
        var listItemFunction = this.model.getListFunction()
        if (listItemFunction != null)
        listItemFunction()
      }
      )
    }
  }
}
export { SingleLineListModel } from './listModels/listmodels';
export { SingleLineListItems } from './listUtilities/list_classes';






