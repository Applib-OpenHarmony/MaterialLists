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
import { NestedListGroup, NestedListItems, CommonGroupModel, ListType }  from '@ohos/material-lists'

@Entry
@Component
struct Index {
  aboutToAppear() {

  }

  model_NestedListGroup: CommonGroupModel.Model = new CommonGroupModel.Model().setGroupListType(ListType.NestedListGroup)
  List_items: NestedListItems[] = [
    new NestedListItems($r('app.media.rahul'), "Meeting", 'Lets meet this evening for discussion of project', 'Rahul', '01', function ab() {
      AlertDialog.show({ message: 'You clicked PROJECT' })
    }),
    new NestedListItems($r('app.media.google'), "Search Engine", 'Google', null, null, function ab() {
      AlertDialog.show({ message: 'You clicked GOOGLE' })
    }),
    new NestedListItems($r('app.media.mic'), "Voice Search", 'US', 'English', null, function ab() {
      AlertDialog.show({ message: 'You clicked mic' })
    }),
    new NestedListItems($r('app.media.clock'), " Clock", '10:00 AM', null, '24hrs', function ab() {
      AlertDialog.show({ message: 'You clicked Clock' })
    }),
    new NestedListItems($r('app.media.maps'), " Gmaps", 'Turn left ', null, $r('app.media.direction'), function ab() {
      AlertDialog.show({ message: 'You clicked Google Maps' })
    }),
    new NestedListItems($r('app.media.recorder'), " Recorder", '2min 30secs', null, '00:01', function ab() {
      AlertDialog.show({ message: 'You clicked Recorder' })
    }),
    new NestedListItems($r('app.media.camera'), " Camera", null, null, null, function ab() {
      AlertDialog.show({ message: 'You clicked Camera' })
    }),
    new NestedListItems($r('app.media.battery'), " Battery", '30%', null, $r('app.media.charging'), function ab() {
      AlertDialog.show({ message: 'You clicked Charging' })
    }),
    new NestedListItems(null, "Privacy", null, null, null, function ab() {
      AlertDialog.show({ message: 'You clicked PRIVACY' })
    }),
  ]

  build() {
    Column() {
      NestedListGroup({
        models: this.model_NestedListGroup,
        options: this.List_items,
      })
    }
  }
}