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
  @State show_ripple: boolean = true
  @State showDivider: boolean = true
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
  @State show_ripple: boolean = false
  @State checked: boolean = false
  @State model: SingleLineListModel = undefined
  @Link model2: CommonGroupModel.Model
  private onCheckChange: ((mainData: number) => void) = null
  @State private clickCoordinates: Position = { x: 0, y: 0 }
  @State private show_Ripple : boolean = false
  @State private showRipple : boolean = false
  @State private rippleColor:ResourceColor=Color.Gray
  @State containerSize:SizeOptions ={height:'90vp',width:'350vp'}
  onClick: (event?: ClickEvent) => void = (event) => {
    console.log('list item was clicked')
  }
  build() {
    if (this.model != undefined && this.model.buildUI()) {
      Column() {
        Row() {
          if (this.model.getIsLeadingIconPresent() == false && this.model.getIsTrailingIconPresent() == false) {
            Flex({ alignItems: ItemAlign.Center }) {
              Flex({ alignItems: ItemAlign.Center }) {
              }.padding( this.model2.getLeadingRightSpace() ).size(this.model2.getListLeadingContainerSize()).padding({top:this.model2.getSpaceOnTop()});
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListLabel()).fontSize(this.model2.getListMainDataSize()).fontWeight(this.model2.getListMainDataFontWeight())
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(1)
              }.size(this.model2.getListDataContainerSize()).padding({right: this.model2.getListDataRightSpace()} ).padding({top:this.model2.getSpaceOnTop()});
              Flex({ alignItems: ItemAlign.Center }) {
              }.size(this.model2.getListTrailingContainerSize());
              ripple({
                rippleStartPosition: $clickCoordinates,
                size:$containerSize,
                showRipple: $showRipple,
                rippleColor : $rippleColor
              })
            }

          }
          else if (this.model.getIsLeadingIconPresent() == true && this.model.getIsTrailingIconPresent() == true) {
            Flex({ alignItems: ItemAlign.Center }) {
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListLeadingContent())
                  .objectFit(ImageFit.Cover)
                  .size(this.model2.getListLeadingContentImageSize())
                  .borderRadius(this.model2.getLeadingImageBorderRadius());
              }.padding( this.model2.getLeadingRightSpace() ).size(this.model2.getListLeadingContainerSize()).padding({top:this.model2.getSpaceOnTop()});
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListLabel()).fontSize(this.model2.getListMainDataSize()).fontWeight(this.model2.getListMainDataFontWeight())
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(1)
              }.size(this.model2.getListDataContainerSize()).padding({top:this.model2.getSpaceOnTop()}).padding({ right: this.model2.getListDataRightSpace() });
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListTrailingContent())
                  .objectFit(ImageFit.Cover)
                  .size(this.model2.getListTrailingContentImageSize());
              }.size(this.model2.getListTrailingContainerSize()).padding({top:this.model2.getSpaceOnTop()});
              ripple({
                rippleStartPosition: $clickCoordinates,
                size:$containerSize,
                showRipple: $showRipple,
                rippleColor : $rippleColor
              })
            }

          }
          else if (this.model.getIsLeadingIconPresent() == true && this.model.getIsTrailingIconPresent() == false) {
            Flex() {
              Flex() {
                Image(this.model.getListLeadingContent())
                  .objectFit(ImageFit.Cover)
                  .size(this.model2.getListLeadingContentImageSize())
                  .borderRadius(this.model2.getLeadingImageBorderRadius());
              }.padding( this.model2.getLeadingRightSpace() ).size(this.model2.getListLeadingContainerSize()).padding({top:this.model2.getSpaceOnTop()});
              Flex({ alignItems: ItemAlign.Center }) {
                Text(this.model.getListLabel()).fontSize(this.model2.getListMainDataSize()).fontWeight(this.model2.getListMainDataFontWeight())
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(1)
              }.size(this.model2.getListDataContainerSize()).padding({ right: this.model2.getListDataRightSpace() });
              Flex({ alignItems: ItemAlign.Center }) {
              }.size(this.model2.getListTrailingContainerSize());
              ripple({
                rippleStartPosition: $clickCoordinates,
                size:$containerSize,
                showRipple: $showRipple,
                rippleColor : $rippleColor
              })
            }


          }
          else if (this.model.getIsLeadingIconPresent() == false && this.model.getIsTrailingIconPresent() == true) {
            Flex() {
              Flex() {
              }.padding(this.model2.getLeadingRightSpace() ).size(this.model2.getListLeadingContainerSize());
              Flex({ alignItems: ItemAlign.Center }) {

                Text(this.model.getListLabel()).fontSize(this.model2.getListMainDataSize()).fontWeight(this.model2.getListMainDataFontWeight())
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .maxLines(1)
              }.size(this.model2.getListDataContainerSize()).padding({ right: this.model2.getListDataRightSpace() });
              Flex({ alignItems: ItemAlign.Center }) {
                Image(this.model.getListTrailingContent())
                  .objectFit(ImageFit.Cover)
                  .size(this.model2.getListTrailingContentImageSize());
              }.size(this.model2.getListTrailingContainerSize()).padding({top:this.model2.getSpaceOnTop()});
              ripple({
                rippleStartPosition: $clickCoordinates,
                size:$containerSize,
                showRipple: $showRipple,
                rippleColor : $rippleColor
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






