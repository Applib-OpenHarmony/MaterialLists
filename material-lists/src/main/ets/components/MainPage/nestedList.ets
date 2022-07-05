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
import { ThreeLineList_Item } from './tripleLineList';
import { TwoLineListModel } from './listModels/listmodels';
import {TwoLineList_Item}  from './twoLineList'
import { SingleLineListModel } from './listModels/listmodels';
import {SingleLineList_item}  from './singleLineList'
import { CommonGroupModel } from './listModels/common_group_model'
import { NestedListItems } from './listUtilities/list_classes';
import {ripple} from './animation/Ripple'
import {CommonProperties} from  './listUtilities/list_common_properties'
@Entry
@Component
export struct NestedListGroup {
  @State models: CommonGroupModel.Model = undefined
  @State show_ripple : boolean = false
  @State showDivider: boolean = true
  @State private options: NestedListItems [] = [
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
            if (item.secondarySubData === null && item.subData===null){
              SingleLineList_item({
                model2:$models,
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

             else  if (item.secondarySubData === null && item.subData!=null) {
                TwoLineList_Item({
                  model: new TwoLineListModel( item.leadingContent,item.mainData,item.subData,item.trailingContent,item.callback),
                  model2:$models,
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
                  model2:$models,
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
      }.divider({ strokeWidth:  this.models.getDividerStrokeWidth(), color: this.models.getDividerColor() })
      .visibility((this.models.getDivider() == true) ? Visibility.Visible : Visibility.Hidden)
    }
  }
}



export { ThreeLineListModel } from './listModels/listmodels';
export { ThreeLineList_Item } from './tripleLineList';
export {TwoLineList_Item} from './twoLineList'
export { TwoLineListModel } from './listModels/listmodels';
export{ SingleLineListModel } from './listModels/listmodels';
export {SingleLineList_item}  from './singleLineList'
export { ThreeLineListItems,SingleLineListItems,NestedListItems } from './listUtilities/list_classes';
