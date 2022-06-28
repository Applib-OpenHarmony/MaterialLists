import prompt from '@system.prompt';
import { Singlelinelistitems, Singleline_list }  from '@ohos/Material_Lists'
@Entry
@Component
struct Index {
  List_items: Singlelinelistitems[] = [

    new Singlelinelistitems( "Dining", $r('app.media.dining'), null),
    new Singlelinelistitems( "Education", $r('app.media.education'), null),
    new Singlelinelistitems("Health",  $r('app.media.health'), null),
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
    new Singlelinelistitems( "Cars", $r('app.media.car'),null),

  ]
  build(){
    Column() {


      Singleline_list({
        arri: this.List_items
      })
    }
}
  }
