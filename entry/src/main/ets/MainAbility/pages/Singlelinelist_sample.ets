import prompt from '@system.prompt';
import { SingleLineListItems, SingleLineListGroup,CommonGroupModel,ListType }  from '@ohos/material-lists'

@Entry
@Component
struct Index {
  model_SingleListGroup: CommonGroupModel.Model = new CommonGroupModel.Model().setGroupListType(ListType.SingleListGroup)
     show : boolean = true
  aboutToAppear(){
    //this.model_SingleListGroup.setListMainDataSize('100vp')
  }
  List_items: SingleLineListItems[] = [
    new SingleLineListItems($r('app.media.dining'), "Dining", $r('app.media.food'), function a() {
      AlertDialog.show({ message: 'You clicked BAT' })
    }),
    new SingleLineListItems($r('app.media.education'), "Education", $r('app.media.book'), function a() {
      AlertDialog.show({ message: 'You clicked Education' })
    }),
    new SingleLineListItems($r('app.media.health'), "Health", $r('app.media.heart'), function a() {
      AlertDialog.show({ message: 'You clicked Health' })
    }),
    new SingleLineListItems($r('app.media.family'), "Family", $r('app.media.icon2'), function a() {
      AlertDialog.show({ message: 'You clicked Family' })
    }),
    new SingleLineListItems($r('app.media.office'), "Office", $r('app.media.imp'), function a() {
      AlertDialog.show({ message: 'You clicked Office' })
    }),
    new SingleLineListItems($r('app.media.crab'), "Continental Food", $r('app.media.fish'), function a() {
      AlertDialog.show({ message: 'You clicked Food' })
    }),
    new SingleLineListItems($r('app.media.radio'), "Radio", $r('app.media.radio_tr'), function a() {
      AlertDialog.show({ message: 'You clicked Radio' })
    }),
    new SingleLineListItems($r('app.media.baverages'), "Beverages", $r('app.media.icecream'), function a() {
      AlertDialog.show({ message: 'You clicked IceCreams' })
    }),
    new SingleLineListItems($r('app.media.sports'), "Sports ", $r('app.media.bat'), function a() {
      AlertDialog.show({ message: 'You clicked Sports' })
    }),
    new SingleLineListItems($r('app.media.travel'), "Travel", $r('app.media.bus'), function a() {
      AlertDialog.show({ message: 'You clicked TRAVEL' })
    }),
    new SingleLineListItems($r('app.media.furniture'), "Furniture", $r('app.media.table'), function a() {
      AlertDialog.show({ message: 'You clicked Furniture' })
    }),
    new SingleLineListItems($r('app.media.promotion'), "Promotion", $r('app.media.job'), function a() {
      AlertDialog.show({ message: 'You clicked Prompt' })
    }),
    new SingleLineListItems($r('app.media.love'), "Attractions", null, function a() {
      AlertDialog.show({ message: 'You clicked Attractive' })
    }),
    new SingleLineListItems($r('app.media.car'), "Cars", $r('app.media.bmw'), function a() {
      AlertDialog.show({ message: 'You clicked CAR' })
    }),
  ]
  build() {
    Column() {
      SingleLineListGroup({
        models: this.model_SingleListGroup,
        options: this.List_items
      })

    }
  }
}


