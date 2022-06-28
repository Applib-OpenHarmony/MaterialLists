import prompt from '@system.prompt';
import { Singlelinelistitems2, Singleline_list2 }  from '@ohos/Material_Lists'
@Entry
@Component
struct Index {
  private aa(){
    console.log('1');
  }
  List_items: Singlelinelistitems2[] = [

    new Singlelinelistitems2( "Dining", $r('app.media.dining'), null, function a(){console.log('1');}),
    new Singlelinelistitems2( "Education", $r('app.media.education'), null,this.aa),
   /* new Singlelinelistitems("Health",  $r('app.media.health'), null),
    new Singlelinelistitems( "Family", $r('app.media.icon2'), null),
    new Singlelinelistitems( "Office",$r('app.media.office'), null ),
    new Singlelinelistitems( "Continental Food", null, null),
    new Singlelinelistitems( "Radio", $r('app.media.radio'), $r('app.media.radio_tr')),
    new Singlelinelistitems( "Beverages",$r('app.media.baverages') , null),
    new Singlelinelistitems( "Sports ", $r('app.media.sports'), null),
    new Singlelinelistitems( "Travel", $r('app.media.travel'), $r('app.media.bus')),
    new Singlelinelistitems( "Furniture", $r('app.media.furniture'),null),
    new Singlelinelistitems( "Promotion", null, $r('app.media.promotion')),
    new Singlelinelistitems("Attractions", null, null),
    new Singlelinelistitems( "Cars", $r('app.media.car'),null),*/

  ]
  build(){
    Column() {


      Singleline_list2({
        arri: this.List_items
      })
    }
}
  }
