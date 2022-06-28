import prompt from '@system.prompt';
import { Twoline_list, Twolinelistitems }  from '@ohos/Material_Lists'
@Entry
@Component
struct Index {
  List_items: Twolinelistitems[] = [

    new Twolinelistitems($r('app.media.pencil'), "Pencil", 'only three are  left in the stock','$4.5' ),
    new Twolinelistitems($r('app.media.bat'), "Bat", 'in stock', $r('app.media.ball')),
    new Twolinelistitems($r('app.media.gloves'), "Gloves", 'in stock', '$10.5'),
    new Twolinelistitems($r('app.media.ruler'), "Ruler", 'in stock-5% discount','$4.5'),
    new Twolinelistitems($r('app.media.clock'), "Clock", 'in stock', '$30.5'),
    new Twolinelistitems($r('app.media.furniture'), "Eatables", 'price according to item selected', $r('app.media.baverages')),
    new Twolinelistitems($r('app.media.toothpaste'), "Colgate", 'in stock', '$15.5'),
    new Twolinelistitems($r('app.media.brush'), "Brush", 'in stock',null ),
    new Twolinelistitems($r('app.media.bottle'), "Bottle", 'in stock', '$35')

  ]
  build(){
    Column() {
      Twoline_list({
        arri: this.List_items
      })
    }
}
  }
