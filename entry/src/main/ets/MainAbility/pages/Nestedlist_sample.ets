import prompt from '@system.prompt';
import { NestedListGroup,NestedListItems,CommonGroupModel,ListType }  from '@ohos/material_lists'
@Entry
@Component
struct Index {
  model_NestedListGroup: CommonGroupModel.Model = new CommonGroupModel.Model().setGroupListType(ListType.NestedListGroup)
  List_items: NestedListItems[] = [
    new NestedListItems(  $r('app.media.rahul'),"Meeting",'Lets meet this evening for discussion of project' ,'Rahul', '01',function ab(){ AlertDialog.show({ message: 'You clicked PROJECT' })}),
    new NestedListItems($r('app.media.google'), "Search Engine",'Google',null,null,function ab(){ AlertDialog.show({ message: 'You clicked GOOGLE' })}),
    new NestedListItems(null, "Privacy",null, null,null,function ab(){ AlertDialog.show({ message: 'You clicked PRIVACY' })}),
    new NestedListItems($r('app.media.mic'), "Voice Search", 'US','English',null,function ab(){ AlertDialog.show({ message: 'You clicked mic' })}),
    new NestedListItems(null, "When Device is Locked", 'Show all Notification Content',null,'tick',function ab(){ AlertDialog.show({ message: 'You clicked Device' })}),
    new NestedListItems($r('app.media.clock'), " Start Time", '10:00 AM',null,'24hrs',function ab(){ AlertDialog.show({ message: 'You clicked Clock' })}),
  ]
  build(){
    Column() {
      NestedListGroup({
         models:this.model_NestedListGroup,
        options: this.List_items,
      })
    }
  }
}