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
import { ThreeLineListItems, ThreeLineListGroup, CommonGroupModel, ListType, }  from '@ohos/material-lists'

@Entry
@Component
struct Index {
  aboutToAppear() {
    this.model_ThreeListGroup.setDividerColor('#0000FF')
  }

  model_ThreeListGroup: CommonGroupModel.Model = new CommonGroupModel.Model().setGroupListType(ListType.TripleListGroup)
  List_items: ThreeLineListItems[] = [
    new ThreeLineListItems($r('app.media.rahul'), "Meeting", 'Lets meet this evening for discussion of project', 'Rahul', '01', function project() {
      AlertDialog.show({ message: 'You clicked PROJECT' })
    }),
    new ThreeLineListItems($r('app.media.rohith'), 'Weekend', 'Any plans this weekend ! ', "Rohit", '02', function weekend() {
      AlertDialog.show({ message: 'You clicked Weekend' })
    }),
    new ThreeLineListItems($r('app.media.chaitanya'), "Foodie", 'How about BBQ today night', 'Chaitanya', '03', function foodie() {
      AlertDialog.show({ message: 'You clicked FOODIE' })
    }),
    new ThreeLineListItems($r('app.media.hitman'), "Cricket Lovers", 'Lets watch IND vs SA match in BLA restaurant', 'Rohith Sharma', '04', function cricket() {
      AlertDialog.show({ message: 'You clicked CRICKET LOVERS' })
    }),
    new ThreeLineListItems($r('app.media.wrestling'), "Wrestlers", 'How about going to Wrestling finals? ', 'Reigns', '05', function wrestlers() {
      AlertDialog.show({ message: 'You clicked WRESTLERS' })
    }),
    new ThreeLineListItems($r('app.media.khaby'), "Memes", 'Memer - Hey !Check out this new meme', 'Jp', '06', function meme() {
      AlertDialog.show({ message: 'You clicked MEMER' })
    }),
    new ThreeLineListItems($r('app.media.ronaldo'), "FootBall", 'FootBall is LUB', 'Messi', '07', function football() {
      AlertDialog.show({ message: 'You clicked FOOTBALL' })
    }),
    new ThreeLineListItems($r('app.media.cake'), "Messi B'day", 'Ronaldo-Happy Birthday messi', 'Williams', '08', function messi() {
      AlertDialog.show({ message: 'You clicked MESSI' })
    }),
    new ThreeLineListItems($r('app.media.studyy'), "Exams", 'Only one week left for exams', 'Class Teacher', '09', function exams() {
      AlertDialog.show({ message: 'You clicked EXAMS' })
    }),
    new ThreeLineListItems($r('app.media.sathwik'), "Work", 'If you are free lets finish the homework', 'James', '10', function work() {
      AlertDialog.show({ message: 'You clicked WORK' })
    }),
  ]

  build() {
    Column() {
      ThreeLineListGroup({
        models: this.model_ThreeListGroup,
        options: this.List_items,
      })
    }
  }
}