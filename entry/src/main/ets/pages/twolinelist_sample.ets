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
import prompt from '@system.prompt';
import { TwoLineListGroup, TwoLineListItems, CommonGroupModel, ListType }  from '@ohos/material-lists'

@Entry
@Component
struct Index {
  aboutToAppear() {
  }
  model_TwoListGroup: CommonGroupModel.Model = new CommonGroupModel.Model().setGroupListType(ListType.DoubleListGroup)
  private List_items: TwoLineListItems[] = [
    new TwoLineListItems($r('app.media.bat'), "Bat", 'in stock', '$20.5', function bat() {
      AlertDialog.show({ message: 'You clicked BAT' })
    }),
    new TwoLineListItems($r('app.media.gloves'), "Gloves", 'in stock', '$10.5', function gloves() {
      AlertDialog.show({ message: 'You clicked GLOVES' })
    }),
    new TwoLineListItems($r('app.media.ruler'), "Ruler", 'in stock-5% discount', '$4.5', function ruler() {
      AlertDialog.show({ message: 'You clicked RULER' })
    }),
    new TwoLineListItems($r('app.media.clock'), "Clock", 'in stock', '$30.5', function clock() {
      AlertDialog.show({ message: 'You clicked CLOCK' })
    }),
    new TwoLineListItems($r('app.media.furniture'), "Eatables", 'price according to item selected', '$30.5', function eatables() {
      AlertDialog.show({ message: 'You clicked EATABLES' })
    }),
    new TwoLineListItems($r('app.media.toothpaste'), "Colgate", 'in stock', '$15.5', function colgate() {
      AlertDialog.show({ message: 'You clicked COLGATE' })
    }),
    new TwoLineListItems($r('app.media.brush'), "Brush", 'in stock', '$25.5', function brush() {
      AlertDialog.show({ message: 'You clicked BRUSH' })
    }),
    new TwoLineListItems($r('app.media.bottle'), "Bottle", 'in stock', '$35', function bottle() {
      AlertDialog.show({ message: 'You clicked BOTTLE' })
    })
  ]

  build() {
    Column() {
      TwoLineListGroup({
        models: this.model_TwoListGroup,
        options: this.List_items,
      })
    }
  }
}