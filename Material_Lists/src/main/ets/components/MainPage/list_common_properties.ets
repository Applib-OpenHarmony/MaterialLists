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





import {SingleLineListOptions} from './list-interfaces'
import {ListType} from './list_types'

const SINGLE_LIST_LEADING_CONTENT_SIZE : SizeOptions = { width: '50vp', height: '50vp' }
const SINGLE_LIST_LEADING_SIZE : SizeOptions = { width: '70vp', height: '50vp' }
  const SINGLE_LIST_CONTAINER_SIZE : SizeOptions =  { width: '350vp', height: '50vp' }
  const SINGLE_LIST_TRAILING_SIZE : SizeOptions = undefined
  const SINGLE_LIST_MAIN_DATA_SIZE : string =  '30vp'
  const SINGLE_LIST_SUB_DATA_SIZE : string = undefined
  const SINGLE_LIST_DATA_CONTAINER_SIZE : SizeOptions = { width: '35vp', height: '35vp' }
 const BORDER_RADIUS : string ='5vp'
  const DOUBLE_LIST_LEADING_CONTENT_SIZE : SizeOptions = { width: '60vp', height: '70vp' }
const DOUBLE_LIST_LEADING_SIZE : SizeOptions = { width: '80vp', height: '90vp' }
  const DOUBLE_LIST_CONTAINER_SIZE : SizeOptions ={ width: '350vp', height: '108vp' }
  const DOUBLE_LIST_TRAILING_SIZE : SizeOptions = { width: '30vp', height: '30vp' }
  const DOUBLE_LIST_MAIN_DATA_SIZE : string = '37vp'
  const DOUBLE_LIST_SUB_DATA_SIZE : string =   '22vp'
const DOUBLE_LIST_DATA_CONTAINER_SIZE : SizeOptions = { width: '190vp', height: '70vp' }
export class  CommonProperties implements SingleLineListOptions  {
  leadingContent:  Resource | string
  mainData: string
  trailingContent: Resource | string
  callback:Function
  subData : string
  protected singleListLeadingContainerSize : SizeOptions = SINGLE_LIST_LEADING_SIZE
  protected singleListLeadingContentSize : SizeOptions=SINGLE_LIST_LEADING_CONTENT_SIZE
  protected singleListContainerSize : SizeOptions = SINGLE_LIST_CONTAINER_SIZE
  protected singleListTrailingContentSize : SizeOptions = SINGLE_LIST_TRAILING_SIZE
  protected singleListMainDataSize : string = SINGLE_LIST_MAIN_DATA_SIZE
  protected singleListSubDataSize : string = SINGLE_LIST_SUB_DATA_SIZE
  protected singleListDataContainerSize : SizeOptions = SINGLE_LIST_DATA_CONTAINER_SIZE
  protected doubleListLeadingContainerSize : SizeOptions = DOUBLE_LIST_LEADING_SIZE
  protected doubleListLeadingContentSize : SizeOptions = DOUBLE_LIST_LEADING_CONTENT_SIZE
  protected doubleListContainerSize : SizeOptions = DOUBLE_LIST_CONTAINER_SIZE
  protected doubleListTrailingContentSize : SizeOptions = DOUBLE_LIST_TRAILING_SIZE
  protected doubleListMainDataSize : string = DOUBLE_LIST_MAIN_DATA_SIZE
  protected doubleListSubDataSize : string = DOUBLE_LIST_SUB_DATA_SIZE
  protected doubleListDataContainerSize : SizeOptions = DOUBLE_LIST_DATA_CONTAINER_SIZE
  protected listIsTrailingImage:boolean = undefined
  protected listIsTrailingText:boolean = undefined
  protected borderRadiusImage : string = BORDER_RADIUS
  protected listIsToggleSwitchPresent:boolean=undefined

  constructor(leadingContent:  string | Resource,mainData: string,trailingContent: Resource | string,callback:Function) {
    this.leadingContent=leadingContent;
    this.mainData=mainData;
    this.trailingContent =trailingContent;
    this.callback = callback;
  }
  protected isLeadingIconPresent:boolean
  protected isTrailingIconPresent:boolean
  buildUI(): boolean {
   return  (this.mainData != null && this.mainData != "")
  }
  getListTrailingImage(): boolean {
    return (typeof this.trailingContent === 'string' || this.trailingContent instanceof String )?false:true
  }


  getListLabel(): string  {
    return this.mainData
  }
  setListLabel(Data:string) :CommonProperties{
   this.mainData =  (Data!=null && Data!=undefined)?Data : ''
    return this
  }
  getListTrailingContent(): string| Resource {
    return this.trailingContent
  }
  getListLeadingContent(): string |Resource {
    return this.leadingContent
  }
  getIsTrailingIconPresent():boolean{
    return (this.getListTrailingContent()!=null)?true:false
  }
  getImageBorderRadius():string{
    return this.borderRadiusImage
  }
  setImageBorderRadius(rad:string):CommonProperties{
    if(this.getListType()===true) {
      this.borderRadiusImage = (rad!=null && rad!=undefined)?rad:BORDER_RADIUS
      return this
    }
  }
  getIsLeadingIconPresent():boolean{
    return ( this. getListLeadingContent()!=null)?true:false
  }
  getListFunction(): Function{
    return this.callback
  }
 getListLeadingContentSize():SizeOptions{
   if(this.getListType()===true){
     return  this.singleListLeadingContentSize
   }
   else
   return this.doubleListLeadingContentSize
 }
  setListLeadingContentSize(LeadContent:SizeOptions):CommonProperties{
    if(this.getListType()===true) {
       this.singleListLeadingContentSize=(LeadContent!=null )?LeadContent:SINGLE_LIST_LEADING_CONTENT_SIZE
    }
   else{
      this.doubleListLeadingContentSize=(LeadContent!=null)?LeadContent:DOUBLE_LIST_LEADING_CONTENT_SIZE
   }
    return this
  }
  getListIsToggleSwitchPresent():boolean{
    return (this.trailingContent === 'toggle')?true:false
  }
  getListType():boolean{
    return (this.subData===null)?true:false
  }
  getListLeadingContainerSize():SizeOptions{
    if(this.getListType()===true){
      return  this.singleListLeadingContainerSize
    }
    else
    return this.doubleListLeadingContainerSize

  }
  setListLeadingContainerSize(LeadingContainerSize :SizeOptions):CommonProperties{
    if(this.getListType()===true){
        this.singleListLeadingContainerSize = (LeadingContainerSize != null && LeadingContainerSize != undefined) ? LeadingContainerSize : SINGLE_LIST_LEADING_SIZE
    }
    else
     this.doubleListLeadingContainerSize=((LeadingContainerSize != null && LeadingContainerSize != undefined) ? LeadingContainerSize : DOUBLE_LIST_LEADING_SIZE)
    return this

  }
  getListTrailingContentSize():SizeOptions{
    if(this.getListType()===true){
      return  this.singleListTrailingContentSize
    }
    else
    return this.doubleListTrailingContentSize

  }
  setListTrailingContentSize(TrailingContentSize :SizeOptions):CommonProperties{
    if(this.getListType()===true){
      this.singleListTrailingContentSize = (TrailingContentSize != null && TrailingContentSize != undefined) ? TrailingContentSize : SINGLE_LIST_TRAILING_SIZE
    }
    else
    this.doubleListTrailingContentSize=((TrailingContentSize != null && TrailingContentSize != undefined) ? TrailingContentSize :DOUBLE_LIST_TRAILING_SIZE )
    return this
  }

  getListContainerSize():SizeOptions{
    if(this.getListType()===true){
      return  this.singleListContainerSize
    }
    else
    return this.doubleListContainerSize

  }

  setListContainerSize(ContainerSize :SizeOptions):CommonProperties{
    if(this.getListType()===true){
      this.singleListContainerSize = (ContainerSize != null && ContainerSize != undefined) ? ContainerSize : SINGLE_LIST_CONTAINER_SIZE
    }
    else
    this.doubleListContainerSize=((ContainerSize != null && ContainerSize != undefined) ? ContainerSize :DOUBLE_LIST_CONTAINER_SIZE )
    return this

  }

  getListMainDataSize():string{
    if(this.getListType()===true){
      return  this.singleListMainDataSize
    }
    else
    return this.doubleListMainDataSize
  }

  setListMainDataSize(MainDataSize :string):CommonProperties{
    if(this.getListType()===true){
      this.singleListMainDataSize = (MainDataSize != null && MainDataSize != undefined) ? MainDataSize : SINGLE_LIST_MAIN_DATA_SIZE
    }
    else
    this.doubleListMainDataSize=((MainDataSize != null && MainDataSize != undefined) ? MainDataSize :DOUBLE_LIST_MAIN_DATA_SIZE )
    return this

  }

  getListSubDataSize():string{
    if(this.getListType()===true){
      return  this.singleListSubDataSize
    }
    else
    return this.doubleListSubDataSize

  }

  setListSubDataSize(SubDataSize :string):CommonProperties{
    if(this.getListType()===true){
      this.singleListSubDataSize = (SubDataSize != null && SubDataSize != undefined) ? SubDataSize : SINGLE_LIST_SUB_DATA_SIZE
    }
    else
    this.doubleListSubDataSize=((SubDataSize != null && SubDataSize != undefined) ? SubDataSize : DOUBLE_LIST_SUB_DATA_SIZE)
    return this

  }

  getListDataContainerSize():SizeOptions{
    if(this.getListType()===true){
      return  this.singleListDataContainerSize
    }
    else
    return this.doubleListDataContainerSize

  }

  setListDataContainerSize(DataContainerSize :SizeOptions):CommonProperties{
    if(this.getListType()===true){
      this.singleListDataContainerSize = (DataContainerSize != null && DataContainerSize != undefined) ? DataContainerSize : SINGLE_LIST_DATA_CONTAINER_SIZE
    }
    else
    this.doubleListDataContainerSize=((DataContainerSize != null && DataContainerSize != undefined) ? DataContainerSize : DOUBLE_LIST_DATA_CONTAINER_SIZE)
    return this

  }




}
