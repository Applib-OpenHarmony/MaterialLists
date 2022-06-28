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

import { ThreeLineListModel } from './listmodels';
import { ThreeLineList_Item } from './tripleLineList';
import { TwoLineListModel } from './listmodels';
import {TwoLineList_Item}  from './twoLineList'
import { SingleLineListModel } from './listmodels';
import {SingleLineList_item}  from './singleLineList'
import { ThreeLineListItems,SingleLineListItems,NestedListItems } from './list_classes';

import {ripple} from './Ripple';
@Entry
@Component
export struct ThreeLineListGroup {
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
      }.divider({ strokeWidth: 1.4, color: Color.Black })
    }
  }
}



export { ThreeLineListModel } from './listmodels';
export { ThreeLineList_Item } from './tripleLineList';
export {TwoLineList_Item} from './twoLineList'
export { TwoLineListModel } from './listmodels';
export{ SingleLineListModel } from './listmodels';
export {SingleLineList_item}  from './singleLineList'
export { ThreeLineListItems,SingleLineListItems,NestedListItems } from './list_classes';
