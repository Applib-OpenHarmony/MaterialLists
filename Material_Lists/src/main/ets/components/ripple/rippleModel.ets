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

namespace RippleModel {
  const DEFAULT_RIPPLE_DURATION : number = 300
  const DEFAULT_IS_BOUNDED : boolean = true
  const DEFAULT_RIPPLE_COLOR : ResourceColor = Color.White
  const DEFAULT_CIRCLE_SIZE : number = 10
  const DEFAULT_OPACITY : number = 0.4
  const DEFAULT_RIPPLE_SCALE : number = 0
  const DEFAULT_RIPPLE_START_POSITION : Position = { x: 0, y: 0 }
  const DEFAULT_RIPPLE_CONTAINER_SIZE : SizeOptions = {width: '360vp', height: '100vp'  }
  const DEFAULT_BORDER : BorderOptions = {}
  const DEFAULT_Z_INDEX : number = 2

  export class Model {
    private rippleDuration: number = DEFAULT_RIPPLE_DURATION
    private isBounded: boolean = DEFAULT_IS_BOUNDED
    private rippleColor: ResourceColor = DEFAULT_RIPPLE_COLOR
    private circleSize: number = DEFAULT_CIRCLE_SIZE
    private opacity: number = DEFAULT_OPACITY
    private rippleScale: number = DEFAULT_RIPPLE_SCALE
    private rippleStartPosition: Position = DEFAULT_RIPPLE_START_POSITION
    private rippleContainerSize: SizeOptions = DEFAULT_RIPPLE_CONTAINER_SIZE
    private border: BorderOptions = DEFAULT_BORDER
    private zIndex: number = DEFAULT_Z_INDEX

    getRippleDuration(): number {
      return this.rippleDuration
    }

    setRippleDuration(rippleDuration : number) : Model {
      this.rippleDuration = (rippleDuration != null && rippleDuration != undefined) ? rippleDuration :  DEFAULT_RIPPLE_DURATION
      return this
    }

    getIsBounded(): boolean {
      return this.isBounded
    }

    setIsBounded(isBounded : boolean) : Model {
      this.isBounded = (isBounded != null && isBounded != undefined)? isBounded : DEFAULT_IS_BOUNDED
      return this
    }

    getRippleColor(): ResourceColor {
      return this.rippleColor
    }

    setRippleColor(rippleColor : ResourceColor) : Model {
      this.rippleColor = (rippleColor != null && rippleColor != undefined)? rippleColor : DEFAULT_RIPPLE_COLOR
      return this
    }

    getCircleSize(): number{
      return this.circleSize
    }

    setCircleSize(circleSize : number) : Model {
      this.circleSize = (circleSize != null && circleSize != undefined)? circleSize : DEFAULT_CIRCLE_SIZE
      return this
    }

    getOpacity(): number {
      return this.opacity
    }

    setOpacity(opacity : number) : Model {
      this.opacity = (opacity != null && opacity != undefined)? opacity : DEFAULT_OPACITY
      return this
    }

    getRippleScale(): number{
      return this.rippleScale
    }

    setRippleScale(rippleScale: number): Model {
      this.rippleScale = (rippleScale != null && rippleScale != undefined)? rippleScale : DEFAULT_RIPPLE_SCALE
      return this
    }


    getRippleStartPosition() : Position {
      return this.rippleStartPosition
    }

    setRippleStartPosition(rippleStartPosition: Position): Model{
      this.rippleStartPosition = (rippleStartPosition != null && rippleStartPosition != undefined)? rippleStartPosition : DEFAULT_RIPPLE_START_POSITION
      return this
    }

    getRippleContainerSize(): SizeOptions {
      return this.rippleContainerSize
    }

    setRippleContainerSize(rippleContainerSize: SizeOptions): Model {
      this.rippleContainerSize = (rippleContainerSize != null && rippleContainerSize != undefined)? rippleContainerSize : DEFAULT_RIPPLE_CONTAINER_SIZE
      return this
    }

    getBorder(): BorderOptions {
      return this.border
    }

    setBorder(border: BorderOptions): Model {
      this.border = (border != null && border != undefined)? border : DEFAULT_BORDER
      return this
    }

    getZIndex(): number {
      return this.zIndex
    }

    setZIndex(zIndex : number) : Model {
      this.zIndex = (zIndex != null && zIndex != undefined)? zIndex : DEFAULT_Z_INDEX
      return this
    }

    getCirclePosX(): number {
      return Model.len2num(this.rippleStartPosition.x) - this.circleSize / 2
    }

    getCirclePosY(): number {
      return Model.len2num(this.rippleStartPosition.y) - this.circleSize / 2
    }

    reset() : Model {
      this.rippleDuration = DEFAULT_RIPPLE_DURATION
      this.isBounded = DEFAULT_IS_BOUNDED
      this.rippleColor = DEFAULT_RIPPLE_COLOR
      this.circleSize = DEFAULT_CIRCLE_SIZE
      this.opacity = DEFAULT_OPACITY
      this.rippleScale = DEFAULT_RIPPLE_SCALE
      this.rippleStartPosition = DEFAULT_RIPPLE_START_POSITION
      this.rippleContainerSize = DEFAULT_RIPPLE_CONTAINER_SIZE
      this.border = DEFAULT_BORDER
      this.zIndex = DEFAULT_Z_INDEX

      return this
    }

    /*
    * converts the Length type into number type and returns the value
    */
    static len2num(value : Length) : number {
      return parseFloat(value.toString())
    }

  }
}

export { RippleModel }