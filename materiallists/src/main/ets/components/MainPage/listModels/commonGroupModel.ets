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

import { ListType } from '../listUtilities/listTypes'
import { sizeSpecs } from '../listUtilities/sizeSpecs'
import { CommonProperties } from '../listUtilities/listCommonProperties'

namespace CommonGroupModel {
  const DEFAULT_LIST_TYPE: ListType = ListType.NestedListGroup

  export class Model extends CommonProperties {
    private listGroupType: ListType = DEFAULT_LIST_TYPE
    constructor() {
      super()
      this.listGroupType = DEFAULT_LIST_TYPE
      this.setListSpecs(this.listGroupType)
    }

    private setListSpecs(listGroupType: ListType): void {
      this.setTrailingImageBorderRadius(sizeSpecs[listGroupType].trailingContentBorderRadius)
      this.setLeadingImageBorderRadius(sizeSpecs[listGroupType].leadingContentBorderRadius)
      this.setListLeadingContentImageSize(sizeSpecs[listGroupType].leadingContentImageSize)
      this.setListLeadingContentTextSize(sizeSpecs[listGroupType].leadingContentTextSize)
      this.setListLeadingContainerSize(sizeSpecs[listGroupType].leadingContainerSize)
      this.setListTrailingContainerSize(sizeSpecs[listGroupType].trailingContainerSize)
      this.setListTrailingContentTextSize(sizeSpecs[listGroupType].trailingContentTextSize)
      this.setListTrailingContentImageSize(sizeSpecs[listGroupType].trailingContentImageSize)
      this.setListContainerSize(sizeSpecs[listGroupType].containerSize)
      this.setListMainDataSize(sizeSpecs[listGroupType].mainDataSize)
      this.setListDataContainerSize(sizeSpecs[listGroupType].dataContainerSize)
      this.setListDataRightSpace(sizeSpecs[listGroupType].dataRightSpace)
      this.setListSubDataSize('22fp')
      this.setListSubDataFontWeight(FontWeight.Regular)
      this.setListMainDataFontWeight(sizeSpecs[listGroupType].listMainDataWeight)
      this.setSpaceOnLeft(sizeSpecs[listGroupType].listLeftSpace)
      this.setSpaceOnRight(sizeSpecs[listGroupType].listRightSpace)
      this.setListMainDataFontColor('#000000')
      this.setSymbol('-')
    }

    setGroupListType(listGroupType: ListType): Model {
      if (listGroupType != ListType.SingleListGroup && listGroupType != ListType.DoubleListGroup && listGroupType != ListType.TripleListGroup && listGroupType != ListType.NestedListGroup) {
        this.listGroupType = DEFAULT_LIST_TYPE
      }
      else {
        this.listGroupType = listGroupType
      }
      this.setListSpecs(listGroupType)
      return this
    }

    getGroupListType(): ListType {
      return this.listGroupType
    }
  }
}

export { CommonGroupModel }