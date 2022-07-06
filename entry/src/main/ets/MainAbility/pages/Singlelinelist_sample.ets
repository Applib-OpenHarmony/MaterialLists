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
import { SingleLineListItems, SingleLineListGroup, CommonGroupModel, ListType }  from '@ohos/material-lists'

@Entry
@Component
struct Index {
  model_SingleListGroup: CommonGroupModel.Model = new CommonGroupModel.Model().setGroupListType(ListType.SingleListGroup)
  aboutToAppear() {
  }
  List_items: SingleLineListItems[] = [
    new SingleLineListItems($r('app.media.education'), "Education", $r('app.media.book'), function education() {
      AlertDialog.show({ message: 'You clicked Education' })
    }),
    new SingleLineListItems($r('app.media.health'), "Health", $r('app.media.heart'), function health() {
      AlertDialog.show({ message: 'You clicked Health' })
    }),
    new SingleLineListItems($r('app.media.family'), "Family", $r('app.media.icon'), function family() {
      AlertDialog.show({ message: 'You clicked Family' })
    }),
    new SingleLineListItems($r('app.media.office'), "Office", $r('app.media.imp'), function office() {
      AlertDialog.show({ message: 'You clicked Office' })
    }),
    new SingleLineListItems($r('app.media.crab'), "Continental Food", $r('app.media.fish'), function crab() {
      AlertDialog.show({ message: 'You clicked Food' })
    }),
    new SingleLineListItems($r('app.media.radio'), "Radio", $r('app.media.radio_tr'), function radio() {
      AlertDialog.show({ message: 'You clicked Radio' })
    }),
    new SingleLineListItems($r('app.media.baverages'), "Beverages", $r('app.media.icecream'), function beverages() {
      AlertDialog.show({ message: 'You clicked Beverages' })
    }),
    new SingleLineListItems($r('app.media.sports'), "Sports ", $r('app.media.bat'), function sports() {
      AlertDialog.show({ message: 'You clicked Sports' })
    }),
    new SingleLineListItems($r('app.media.travel'), "Travel", $r('app.media.bus'), function travel() {
      AlertDialog.show({ message: 'You clicked TRAVEL' })
    }),
    new SingleLineListItems($r('app.media.furniture'), "Furniture", $r('app.media.table'), function furniture() {
      AlertDialog.show({ message: 'You clicked Furniture' })
    }),
    new SingleLineListItems($r('app.media.promotion'), "Promotion", $r('app.media.job'), function promotion() {
      AlertDialog.show({ message: 'You clicked Prompt' })
    }),
    new SingleLineListItems($r('app.media.love'), "Attractions", null, function attractions() {
      AlertDialog.show({ message: 'You clicked Attractive' })
    }),
    new SingleLineListItems($r('app.media.car'), "Cars", $r('app.media.bmw'), function car() {
      AlertDialog.show({ message: 'You clicked CAR' })
    }),
  ]

  build() {
    Column() {
      SingleLineListGroup({
        models: this.model_SingleListGroup,
        options: this.List_items
      })

    }
  }
}


