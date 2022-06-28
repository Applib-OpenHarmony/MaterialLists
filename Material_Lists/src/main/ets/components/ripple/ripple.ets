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

import { RippleModel } from './rippleModel'

@Component
export struct Ripple {
  @State model: RippleModel.Model = undefined
  @Link private show_ripple : boolean

  private show_animation() {
    animateTo({
      duration: this.model.getRippleDuration(),
      curve: Curve.Sharp,
      onFinish: () => {
        this.model.setRippleScale(0)
        this.show_ripple = false
      }
    },
      () => {
        //max allowed size of the circle according to the container size
        var height = RippleModel.Model.len2num(this.model.getRippleContainerSize().height)
        var width = RippleModel.Model.len2num(this.model.getRippleContainerSize().width)
        this.model.setRippleScale(Math.ceil(Math.sqrt(Math.pow(height, 2) + Math.pow(width, 2)) * 2 / this.model.getCircleSize()))
      })
  }

  build() {
    if (this.show_ripple && this.model != undefined) {
      Flex() {
        Circle()
          .fill(this.model.getRippleColor())
          .width(this.model.getCircleSize())
          .height(this.model.getCircleSize())
          .opacity(this.model.getOpacity())
          .position({ x: this.model.getCirclePosX(), y: this.model.getCirclePosY() })
          .scale({
            x: this.model.getRippleScale(),
            y: this.model.getRippleScale(),
            centerX: this.model.getCircleSize() / 2,
            centerY: this.model.getCircleSize() / 2
          })
      }
      .clip(this.model.getIsBounded())
      .size(this.model.getRippleContainerSize())
      .position({ x: 0, y: 0 })
      .zIndex(this.model.getZIndex())
      .border(this.model.getBorder())
      .onAppear(() => {
        this.show_animation()
      })
    }
  }
}