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

export var sizeSpecs: {
  containerSize: SizeOptions,
  leadingContainerSize: SizeOptions,
  leadingContentImageSize: SizeOptions,
  leadingContentBorderRadius: string,
  leadingContentTextSize: string,
  dataContainerSize: SizeOptions,
  mainDataSize: string,
  dataRightSpace: string,
  trailingContentImageSize: SizeOptions,
  trailingContentTextSize: string,
  trailingContainerSize: SizeOptions,
  trailingContentBorderRadius: string,
  listMainDataWeight: FontWeight,
  listLeftSpace: string,
  listRightSpace: string,
}[] = [
  {
    containerSize: { width: '360vp', height: '85vp' },
    leadingContainerSize: { width: '70vp', height: '70vp' },
    leadingContentImageSize: { width: '60vp', height: '50vp' },
    leadingContentBorderRadius: '1vp',
    leadingContentTextSize: '22fp',
    dataContainerSize: { width: '220vp', height: '50vp' },
    mainDataSize: '27fp',
    dataRightSpace: '15vp',
    trailingContentImageSize: { width: '45vp', height: '45vp' },
    trailingContentTextSize: '25fp',
    trailingContainerSize: { width: '60vp', height: '60vp' },
    trailingContentBorderRadius: '1vp',
    listMainDataWeight: FontWeight.Medium,
    listLeftSpace: '10vp',
    listRightSpace: '5vp',
  },
  {
    containerSize: { width: '360vp', height: '100vp' },
    leadingContainerSize: { width: '80vp', height: '88vp' },
    leadingContentImageSize: { width: '70vp', height: '70vp' },
    leadingContentBorderRadius: '1vp',
    leadingContentTextSize: '22fp',
    dataContainerSize: { width: '200vp', height: '70vp' },
    mainDataSize: '27fp',
    dataRightSpace: '15vp',
    trailingContentImageSize: { width: '49vp', height: '49vp' },
    trailingContentTextSize: '22fp',
    trailingContainerSize: { width: '70vp', height: '90vp' },
    trailingContentBorderRadius: '1vp',
    listMainDataWeight: FontWeight.Medium,
    listLeftSpace: '10vp',
    listRightSpace: '5vp',
  },
  {
    containerSize: { width: '360vp', height: '108vp' },
    leadingContainerSize: { width: '80vp', height: '90vp' },
    leadingContentImageSize: { width: '70vp', height: '70vp' },
    leadingContentBorderRadius: '1vp',
    leadingContentTextSize: '35fp',
    dataContainerSize: { width: '210vp', height: '70vp' },
    mainDataSize: '27fp',
    dataRightSpace: '15vp',
    trailingContentImageSize: { width: '49vp', height: '49vp' },
    trailingContentTextSize: '24fp',
    trailingContainerSize: { width: '70vp', height: '60vp' },
    trailingContentBorderRadius: '1vp',
    listMainDataWeight: FontWeight.Medium,
    listLeftSpace: '10vp',
    listRightSpace: '5vp',
  },
  {
    containerSize: { width: '360vp', height: '100vp' },
    leadingContainerSize: { width: '85vp', height: '90vp' },
    leadingContentImageSize: { width: '70vp', height: '70vp' },
    leadingContentBorderRadius: '1vp',
    leadingContentTextSize: '35fp',
    dataContainerSize: { width: '200vp', height: '70vp' },
    mainDataSize: '27fp',
    dataRightSpace: '10vp',
    trailingContentImageSize: { width: '50vp', height: '50vp' },
    trailingContentTextSize: '24fp',
    trailingContainerSize: { width: '80vp', height: '60vp' },
    trailingContentBorderRadius: '1vp',
    listMainDataWeight: FontWeight.Medium,
    listLeftSpace: '10vp',
    listRightSpace: '5vp',
  },
]