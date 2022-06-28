import {CommonProperties} from './list_common_properties'
import {SingleLineListOptions,TwoLineListOptions,ThreeLineListOptions } from './list-interfaces'
export class  SingleLineListModel extends CommonProperties {

  constructor(leadingContent:  string | Resource,mainData: string,trailingContent: Resource | string,callback:Function) {
    super(leadingContent,mainData,trailingContent,callback);
  }
}

export class TwoLineListModel extends SingleLineListModel{
  subData:string
   constructor(leadingContent:  string | Resource,mainData: string,subData:string,trailingContent: Resource | string,callback:Function) {
    super(leadingContent,mainData,trailingContent,callback);
    this.subData = subData
  }
getListSubData():string{
  return this.subData
}
}

export class ThreeLineListModel extends TwoLineListModel{
  secondarySubData: string
  constructor(leadingContent:  string | Resource,mainData: string,subData:string,secondarySubData:string,trailingContent: Resource | string,callback:Function) {
    super(leadingContent,mainData,subData,trailingContent,callback)
    this.secondarySubData = secondarySubData
  }

  getListSecondarySubData():string{
    return this.secondarySubData
  }




}
