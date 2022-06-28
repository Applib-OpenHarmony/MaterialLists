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

import {SingleLineListOptions ,TwoLineListOptions, ThreeLineListOptions} from './list-interfaces'
export class SingleLineListItems  implements SingleLineListOptions {
  leadingContent:  string | Resource
  mainData: string
  trailingContent: Resource | string
  callback:Function
  constructor(options:SingleLineListOptions) {
    this.leadingContent=options.leadingContent;
    this.mainData=options.mainData;
    this.trailingContent =options.trailingContent;
    this.callback = options.callback;
  }
}

export class TwoLineListItems  extends SingleLineListItems{
  subData:string
  constructor(options:TwoLineListOptions) {
    super(options);
    this.subData = options.subData
  }
}
/*
export class ThreeLineListItems extends TwoLineListItems{
  secondarySubData: string
  constructor(leadingContent:  string | Resource,mainData: string,subData:string,secondarySubData:string,trailingContent: Resource | string,callback:Function) {
    super(leadingContent,mainData,subData,trailingContent,callback)
    this.secondarySubData = secondarySubData
  }
}

export class  NestedListItems  extends ThreeLineListItems{
  constructor(leadingContent:  string | Resource,mainData: string,subData:string,secondarySubData:string,trailingContent: Resource | string,callback:Function) {
    super(leadingContent,mainData,subData,secondarySubData,trailingContent,callback)
  }

}
*/




