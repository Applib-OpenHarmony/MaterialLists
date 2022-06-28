import prompt from '@system.prompt';
import {  TwolinelistGroup, TwolinelistModel, Twolinelistitems_temp,twolinelist_item, ripple}  from '@ohos/Material_Lists'
@Entry
@Component
struct Index {
  private List_items: Twolinelistitems_temp[] = [
    new Twolinelistitems_temp($r('app.media.bat'), "Bat", 'in stock', $r('app.media.ball'),function ab(){console.log('1');}),
    new Twolinelistitems_temp($r('app.media.gloves'), "Gloves", 'in stock', '$10.5', function a(){console.log('2');}),
    new Twolinelistitems_temp($r('app.media.ruler'), "Ruler", 'in stock-5% discount','$4.5',null),
    new Twolinelistitems_temp($r('app.media.clock'), "Clock", 'in stock', '$30.5',null),
    new Twolinelistitems_temp($r('app.media.furniture'), "Eatables", 'price according to item selected', $r('app.media.baverages'),null),
    new Twolinelistitems_temp($r('app.media.toothpaste'), "Colgate", 'in stock', '$15.5',null),
    new Twolinelistitems_temp($r('app.media.brush'), "Brush", 'in stock',null,function ab(){console.log('You selected Brush item');} ),
    new Twolinelistitems_temp($r('app.media.bottle'), "Bottle", 'in stock', '$35',null)
  ]
  private onListGroupCheck( Maindata: number) {
    console.log('mg');
  }
  build() {
    Column() {
      TwolinelistGroup({
        options: this.List_items,
        onCheckChange: this.onListGroupCheck

      })
    }
  }
    }




