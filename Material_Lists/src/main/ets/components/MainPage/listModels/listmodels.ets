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

import { CommonProperties } from '../listUtilities/list_common_properties'

export class SingleLineListModel extends CommonProperties {
  leadingContent: Resource | string
  mainData: string
  trailingContent: Resource | string
  callback: Function
  subData: string
  constructor(leadingContent: string | Resource, mainData: string, trailingContent: Resource | string, callback: Function) {
    super();
    this.leadingContent = leadingContent;
    this.mainData = mainData;
    this.trailingContent = trailingContent;
    this.callback = callback;
  }

  protected isLeadingIconPresent: boolean= false
  protected isTrailingIconPresent: boolean= false
  protected IsTrailingContentPresent: boolean= false
  protected IsLeadingContentPresent: boolean= false

  buildUI(): boolean {
    return (this.mainData != null && this.mainData != "")
  }

  getListLabel(): string  {
    return this.mainData
  }

  setListLabel(Data: string): SingleLineListModel{
    this.mainData = (Data != null && Data != undefined) ? Data : ''
    return this
  }

  getListTrailingImage(): boolean {
    return (typeof this.trailingContent === 'string' || this.trailingContent instanceof String) ? false : true
  }

  getIsTrailingIconPresent(): boolean{
    return (this.getListTrailingContent() != null) ? true : false
  }

  getIsLeadingIconPresent(): boolean{
    return (this.getListLeadingContent() != null) ? true : false
  }

  getListFunction(): Function{
    return this.callback
  }

  getIsToggleSwitchPresent(): boolean{
    return (this.getListTrailingContent() === 'toggle') ? true : false
  }

  getListIsToggleSwitchPresent(): boolean{
    return (this.trailingContent === 'toggle') ? true : false
  }

  getListType(): boolean{
    return (this.subData === null) ? true : false
  }

  getListTrailingContent(): string | Resource {
    return this.trailingContent
  }

  getListLeadingContent(): string | Resource {
    return this.leadingContent
  }

  getIsTrailingContentPresent(): boolean{
    return (this.getListTrailingContent() != null) ? true : false
  }

  getIsTrailingContentImage(): boolean{
    return (this.getIsTrailingContentPresent() === true && this.getListTrailingContent() instanceof String) ? false : true
  }

  getIsLeadingContentImage(): boolean{
    return (this.getIsLeadingContentPresent() === true && this.getListLeadingContent() instanceof String) ? false : true
  }

  getIsLeadingContentPresent(): boolean{
    return (this.getListLeadingContent() != null) ? true : false
  }
}

export class TwoLineListModel extends SingleLineListModel {
  subData: string
  constructor(leadingContent: string | Resource, mainData: string, subData: string, trailingContent: Resource | string, callback: Function) {
    super(leadingContent, mainData, trailingContent, callback);
    this.subData = subData
  }

  getListSubData(): string{
    return this.subData
  }
}

export class ThreeLineListModel extends TwoLineListModel {
  secondarySubData: string
  constructor(leadingContent: string | Resource, mainData: string, subData: string, secondarySubData: string, trailingContent: Resource | string, callback: Function) {
    super(leadingContent, mainData, subData, trailingContent, callback)
    this.secondarySubData = secondarySubData
  }

  getListSecondarySubData(): string{
    return this.secondarySubData
  }
}
