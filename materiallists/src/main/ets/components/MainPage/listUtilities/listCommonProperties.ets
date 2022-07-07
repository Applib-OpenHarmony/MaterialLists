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

import { ListType } from './listTypes'
import { sizeSpecs } from './sizeSpecs'

const DEFAULT_LIST_TYPE: ListType = ListType.NestedListGroup
const DEFAULT_LEADING_CONTAINER_SIZE: SizeOptions = { width: '80vp', height: '90vp' }
const DEFAULT_LEADING_IMAGE_SIZE: SizeOptions = { width: '60vp', height: '70vp' }
const DEFAULT_LIST_CONTAINER_SIZE: SizeOptions = { width: '100%', height: '108vp' }
const DEFAULT_TRAILING_CONTAINER_SIZE: SizeOptions = { width: '40vp', height: '40vp' }
const DEFAULT_TRAILING_TEXT_SIZE: string = '30vp'
const DEFAULT_MAIN_DATA_SIZE: string = '37vp'
const DEFAULT_DATA_PADDING_SIZE: string = '15vp'
const DEFAULT_DATA_CONTAINER_SIZE: SizeOptions = { width: '190vp', height: '70vp' }
const DEFAULT_LEADING_CONTENT_TEXT_SIZE: string = '15vp'
const DEFAULT_LEADING_BORDER_RADIUS: string = '1vp'
const DEFAULT_TRAILING_BORDER_RADIUS: string = '1vp'
const DEFAULT_ITEM_SPACES_SIZE: string = '0vp'
const DEFAULT_TRAILING_IMAGE_SIZE: SizeOptions = { width: '40vp', height: '40vp' }
const DEFAULT_SUB_DATA_SIZE: string = '22vp'
const DEFAULT_SUB_DATA_FONT_WEIGHT: FontWeight = FontWeight.Regular
const DEFAULT_MAIN_DATA_FONT_WEIGHT: FontWeight = FontWeight.Medium
const DEFAULT_RIPPLE_ANIMATION: boolean = true
const DEFAULT_RIPPLE_COLOR: string = '#808080'
const DEFAULT_DIVIDER_VISIBILITY: boolean = true
const DEFAULT_DIVIDER_STROKE_WIDTH: number = 2.4
const DEFAULT_DIVIDER_COLOR: string = ' #000000'
const DEFAULT_TOP_SPACE: string = '10vp'
const DEFAULT_MAIN_DATA_FONT_COLOR: string = ' #000000'
const DEFAULT_BACKGROUND_COLOR: string = '#FFFFFF'
const DEFAULT_SUB_DATA_FONT_COLOR: string = '#000000'
const DEFAULT_MAIN_DATA_FONT_STYLE: FontStyle = FontStyle.Normal
const DEFAULT_SUB_DATA_FONT_STYLE: FontStyle = FontStyle.Normal
const DEFAULT_SEPARATOR: string = '-'

export class CommonProperties {
  protected listLeadingContainerSize: SizeOptions = DEFAULT_LEADING_CONTAINER_SIZE
  protected listLeadingContentImageSize: SizeOptions= DEFAULT_LEADING_IMAGE_SIZE
  protected listContainerSize: SizeOptions = DEFAULT_LIST_CONTAINER_SIZE
  protected listTrailingContentImageSize: SizeOptions = DEFAULT_TRAILING_IMAGE_SIZE
  protected listTrailingContentTextSize: string = DEFAULT_TRAILING_TEXT_SIZE
  protected listMainDataSize: string = DEFAULT_MAIN_DATA_SIZE
  protected listDataRightSpace: string = DEFAULT_DATA_PADDING_SIZE
  protected listDataContainerSize: SizeOptions = DEFAULT_DATA_CONTAINER_SIZE
  protected listTrailingContainerSize: SizeOptions = DEFAULT_TRAILING_CONTAINER_SIZE
  protected listIsTrailingImage: boolean = false
  protected listIsTrailingText: boolean = false
  protected listLeadingContentTextSize: string= DEFAULT_LEADING_CONTENT_TEXT_SIZE
  protected listLeadingBorderRadius: string = DEFAULT_LEADING_BORDER_RADIUS
  protected listTrailingBorderRadius: string = DEFAULT_TRAILING_BORDER_RADIUS
  protected listItemsSpace: string = DEFAULT_ITEM_SPACES_SIZE
  protected listIsToggleSwitchPresent: boolean= false
  protected isLeadingContentImage: boolean = false
  protected isTrailingContentImage: boolean = false
  protected listSubDataSize: string = DEFAULT_SUB_DATA_SIZE
  protected groupListType: ListType = DEFAULT_LIST_TYPE
  protected listSubDtaFontWeight: FontWeight = DEFAULT_SUB_DATA_FONT_WEIGHT
  protected rippleColor: string= DEFAULT_RIPPLE_COLOR
  protected rippleAnimation: boolean = DEFAULT_RIPPLE_ANIMATION
  protected dividerStrokeWidth: number= DEFAULT_DIVIDER_STROKE_WIDTH
  protected dividerColor: string = DEFAULT_DIVIDER_COLOR
  protected dividerVisible: boolean= DEFAULT_DIVIDER_VISIBILITY
  protected listMainDataFontWeight: FontWeight = DEFAULT_MAIN_DATA_FONT_WEIGHT
  protected topSpace: string = DEFAULT_TOP_SPACE
  protected mainDataFontColor: string = DEFAULT_MAIN_DATA_FONT_COLOR
  protected backGroundColor: string = DEFAULT_BACKGROUND_COLOR
  protected subDataFontColor: string = DEFAULT_SUB_DATA_FONT_COLOR
  protected mainDataFontStyle: FontStyle = DEFAULT_MAIN_DATA_FONT_STYLE
  protected subDataFontStyle: FontStyle  = DEFAULT_SUB_DATA_FONT_STYLE
  protected separatingSymbol: string = DEFAULT_SEPARATOR
  lenToNum(value: Length): number {
    return parseFloat(value.toString())
  }

  getBackGroundColor() {
    return this.backGroundColor
  }

  setBackGroundColor(BackGroundColor: string): CommonProperties{
    this.backGroundColor = (BackGroundColor != null && BackGroundColor != undefined) ? BackGroundColor : DEFAULT_BACKGROUND_COLOR
    return this
  }

  getMainDataFontStyle() {
    return this.mainDataFontStyle
  }

  setMainDataFontStyle(MainDataFontStyle: FontStyle) {
    this.mainDataFontStyle = (MainDataFontStyle != null && MainDataFontStyle != undefined) ? MainDataFontStyle : DEFAULT_MAIN_DATA_FONT_STYLE
    return this
  }

  getSubDataFontStyle() {
    return this.subDataFontStyle
  }

  setSubDataFontStyle(SubDataFontStyle: FontStyle) {
    this.subDataFontStyle = (SubDataFontStyle != null && SubDataFontStyle != undefined) ? SubDataFontStyle : DEFAULT_SUB_DATA_FONT_STYLE
    return this
  }

  getDividerStrokeWidth(): number{
    return this.dividerStrokeWidth
  }

  getDividerColor(): string{
    return this.dividerColor
  }

  getDivider(): boolean{
    return this.dividerVisible
  }

  getListMainDataFontColor(): string{
    return this.mainDataFontColor
  }

  setListSubDataFontColor(SubDataFontColor: string): CommonProperties{
    this.subDataFontColor = (SubDataFontColor != null && SubDataFontColor != undefined) ? SubDataFontColor : DEFAULT_SUB_DATA_FONT_COLOR
    return this
  }

  getListSubDataFontColor(): string{
    return this.subDataFontColor
  }

  setListMainDataFontColor(MainDataFontColor: string): CommonProperties{
    this.mainDataFontColor = (MainDataFontColor != null && MainDataFontColor != undefined) ? MainDataFontColor : DEFAULT_MAIN_DATA_FONT_COLOR
    return this
  }

  setDividerStrokeWidth(StrokeWidth: number): CommonProperties{
    if (StrokeWidth < 0) {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.dividerStrokeWidth = (StrokeWidth != null && StrokeWidth != undefined) ? StrokeWidth : DEFAULT_DIVIDER_STROKE_WIDTH
    return this
  }

  setDividerColor(divColor: string): CommonProperties{
    this.dividerColor = (divColor != null && divColor != undefined) ? divColor : DEFAULT_DIVIDER_COLOR
    return this
  }

  setDivider(divide: boolean): CommonProperties{
    this.dividerVisible = (divide != null && divide != undefined) ? divide : DEFAULT_DIVIDER_VISIBILITY
    return this
  }

  getSpaceOnTop(): string{
    return this.topSpace
  }

  setSpaceOnTop(spc: string): CommonProperties{
    if (spc[0] === '-') {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.topSpace = (spc != null && spc != undefined) ? spc : DEFAULT_TOP_SPACE
    return this
  }

  getLeadingImageBorderRadius(): string{
    return this.listLeadingBorderRadius
  }

  getTrailingImageBorderRadius(): string{
    return this.listTrailingBorderRadius
  }

  setLeadingImageBorderRadius(rad: string): CommonProperties{
    if (rad[0] === '-') {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.listLeadingBorderRadius = (rad != null && rad != undefined) ? rad : DEFAULT_LEADING_BORDER_RADIUS
    return this
  }

  setTrailingImageBorderRadius(rad: string): CommonProperties{
    if (rad[0] === '-') {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.listTrailingBorderRadius = (rad != null && rad != undefined) ? rad : DEFAULT_TRAILING_BORDER_RADIUS
    return this
  }

  getListTrailingContainerSize(): SizeOptions{
    return this.listTrailingContainerSize
  }

  setListTrailingContainerSize(TrailingContainerSize: SizeOptions): CommonProperties{
    if (this.lenToNum(TrailingContainerSize.height) < 0 || this.lenToNum(TrailingContainerSize.width) < 0) {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.listTrailingContainerSize = (TrailingContainerSize != null && TrailingContainerSize != undefined) ? TrailingContainerSize : DEFAULT_TRAILING_CONTAINER_SIZE
    return this
  }

  getListLeadingContentImageSize(): SizeOptions{
    return this.listLeadingContentImageSize
  }

  setListLeadingContentImageSize(LeadContent: SizeOptions): CommonProperties{

    if (this.lenToNum(LeadContent.height) < 0 || this.lenToNum(LeadContent.width) < 0) {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.listLeadingContentImageSize = (LeadContent != null && LeadContent != undefined) ? LeadContent : DEFAULT_LEADING_IMAGE_SIZE
    return this
  }

  getListTrailingContentImageSize(): SizeOptions{
    return this.listTrailingContentImageSize
  }

  setListTrailingContentImageSize(TrailContent: SizeOptions): CommonProperties{
    if (this.lenToNum(TrailContent.height) < 0 || this.lenToNum(TrailContent.width) < 0) {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.listTrailingContentImageSize = (TrailContent != null && TrailContent != undefined) ? TrailContent : DEFAULT_TRAILING_IMAGE_SIZE
    return this
  }

  getListLeadingContentTextSize(): string {
    return this.listLeadingContentTextSize
  }

  setListLeadingContentTextSize(LeadContent: string): CommonProperties{
    if (LeadContent[0] === '-') {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.listLeadingContentTextSize = (LeadContent != null && LeadContent != undefined) ? LeadContent : DEFAULT_LEADING_CONTENT_TEXT_SIZE
    return this
  }

  getListLeadingContainerSize(): SizeOptions{
    return this.listLeadingContainerSize
  }

  setListLeadingContainerSize(LeadingContainerSize: SizeOptions): CommonProperties{
    if (this.lenToNum(LeadingContainerSize.height) < 0 || this.lenToNum(LeadingContainerSize.width) < 0) {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.listLeadingContainerSize = (LeadingContainerSize != null && LeadingContainerSize != undefined) ? LeadingContainerSize : DEFAULT_LEADING_CONTAINER_SIZE
    return this
  }

  getListTrailingContentTextSize(): string{
    return this.listTrailingContentTextSize
  }

  setListTrailingContentTextSize(TrailingContentSize: string): CommonProperties{
    if (TrailingContentSize[0] === '-') {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.listTrailingContentTextSize = (TrailingContentSize != null && TrailingContentSize != undefined) ? TrailingContentSize : DEFAULT_TRAILING_TEXT_SIZE
    return this
  }

  getListContainerSize(): SizeOptions{
    return this.listContainerSize
  }

  setListContainerSize(ContainerSize: SizeOptions): CommonProperties{
    if (this.lenToNum(ContainerSize.height) < 0 || this.lenToNum(ContainerSize.width) < 0) {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.listContainerSize = (ContainerSize != null && ContainerSize != undefined) ? ContainerSize : DEFAULT_LIST_CONTAINER_SIZE
    return this
  }

  getListMainDataSize(): string{
    return this.listMainDataSize
  }

  setListMainDataSize(MainDataSize: string): CommonProperties{
    if (MainDataSize[0] == '-') {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.listMainDataSize = (MainDataSize != null && MainDataSize != undefined) ? MainDataSize : DEFAULT_MAIN_DATA_SIZE
    return this
  }

  getListSubDataSize(): string{
    return this.listSubDataSize
  }

  setListSubDataSize(SubDataSize: string): CommonProperties{
    if (SubDataSize[0] === '-') {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.listSubDataSize = (SubDataSize != null && SubDataSize != undefined) ? SubDataSize : DEFAULT_SUB_DATA_SIZE
    return this
  }

  getListDataContainerSize(): SizeOptions{
    return this.listDataContainerSize
  }

  setListDataContainerSize(DataContainerSize: SizeOptions): CommonProperties{
    if (this.lenToNum(DataContainerSize.height) < 0 || this.lenToNum(DataContainerSize.width) < 0) {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.listDataContainerSize = (DataContainerSize != null && DataContainerSize != undefined) ? DataContainerSize : DEFAULT_DATA_CONTAINER_SIZE
    return this
  }

  getListDataRightSpace(): string{
    return this.listDataRightSpace
  }

  setListDataRightSpace(ListDataSpace: string): CommonProperties{
    if (ListDataSpace[0] === '-') {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.listDataRightSpace = (ListDataSpace != null && ListDataSpace != undefined) ? ListDataSpace : this.listDataRightSpace
    return this
  }

  getListItemsSpace(): string{
    return this.listItemsSpace
  }

  getListSubDataFontWeight(): FontWeight{
    return this.listSubDtaFontWeight
  }

  setListSubDataFontWeight(SubDtaFontWeight: FontWeight): CommonProperties{
    if (SubDtaFontWeight[0] === '-') {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.listSubDtaFontWeight = (SubDtaFontWeight != null && SubDtaFontWeight != undefined) ? SubDtaFontWeight : DEFAULT_SUB_DATA_FONT_WEIGHT
    return this
  }

  getListMainDataFontWeight(): FontWeight{
    return this.listMainDataFontWeight
  }

  setListMainDataFontWeight(MainDtaFontWeight: FontWeight): CommonProperties{
    if (MainDtaFontWeight < 0) {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.listMainDataFontWeight = (MainDtaFontWeight != null && MainDtaFontWeight != undefined) ? MainDtaFontWeight : DEFAULT_MAIN_DATA_FONT_WEIGHT
    return this
  }

  setListItemsSpace(ListItemSpace: string): CommonProperties{
    if (ListItemSpace[0] === '-') {
      throw new Error("Invalid size. Please provide a  valid input")
    }
    this.listItemsSpace = (ListItemSpace != null && ListItemSpace != undefined) ? ListItemSpace : DEFAULT_ITEM_SPACES_SIZE
    return this
  }

  setRippleColor(Color: string): CommonProperties {
    this.rippleColor = (Color != null && Color != undefined) ? Color : DEFAULT_RIPPLE_COLOR
    return this
  }

  getRippleColor(): string{
    return this.rippleColor
  }

  setRippleAnimation(rippleAnimation: boolean): CommonProperties {
    this.rippleAnimation = (rippleAnimation != null && rippleAnimation != undefined) ? rippleAnimation : DEFAULT_RIPPLE_ANIMATION
    return this
  }

  getRippleAnimation(): boolean {
    return this.rippleAnimation
  }

  getSymbol(): string{
    return this.separatingSymbol
  }

  setSymbol(Separator: string) {
    this.separatingSymbol = (Separator != null && Separator != undefined) ? Separator : DEFAULT_SEPARATOR
    return this
  }
}