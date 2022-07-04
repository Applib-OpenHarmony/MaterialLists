import prompt from '@system.prompt';
import { ThreeLineListItems, ThreeLineListGroup, CommonGroupModel,ListType,}  from '@ohos/material_lists'
@Entry
@Component
struct Index {
  aboutToAppear(){
    //this.model_ThreeListGroup.setListContainerSize({width:'350vp',height:'200vp'})
  }
  model_ThreeListGroup: CommonGroupModel.Model = new CommonGroupModel.Model().setGroupListType(ListType.TripleListGroup)
  List_items: ThreeLineListItems[] = [
    new ThreeLineListItems( $r('app.media.rahul'),"Meeting",'Lets meet this evening for discussion of project' ,'Rahul', '01',function ab(){ AlertDialog.show({ message: 'You clicked PROJECT' })}),
    new ThreeLineListItems( $r('app.media.rohith'),'Weekend','Any plans this weekend ! ' ,"Rohith",  '02',function ab(){ AlertDialog.show({ message: 'You clicked Weekend' })}),
    new ThreeLineListItems( $r('app.media.chaitanya'),"Foodie",'How about BBQ today night' , 'Chaitu', '03',function ab(){ AlertDialog.show({ message: 'You clicked FOODIE' })}),
    new ThreeLineListItems( $r('app.media.hitman'),"Cricket Lovers",'Lets watch IND vs SA match in BLA restaurant' ,'Rohith Sharma', '04',function ab(){ AlertDialog.show({ message: 'You clicked CRICKET LOVERS' })}),
    new ThreeLineListItems( $r('app.media.wrestling'),"Wrestlers",'How about going to Wrestling finals? ','Reigns' , '05',function ab(){ AlertDialog.show({ message: 'You clicked WRESTLERS' })}),
    new ThreeLineListItems( $r('app.media.khaby'),"Memes",'Memer - Hey !Check out this new meme' ,'Jp', '06',function ab(){ AlertDialog.show({ message: 'You clicked MEMER' })}),
    new ThreeLineListItems($r('app.media.ronaldo'), "FootBall", 'FootBall is LUB','Messi', $r('app.media.messi'),function ab(){ AlertDialog.show({ message: 'You clicked FOOTBALL' })}),
    new ThreeLineListItems($r('app.media.cake'), "Messi B'day", 'Ronaldo-Happy Birthday messi','Neymer', '08',function ab(){ AlertDialog.show({ message: 'You clicked MESSI' })}),
    new ThreeLineListItems($r('app.media.studyy'), "Exams", 'Only one week left for exams','Class Teacher', $r('app.media.imp'),function ab(){ AlertDialog.show({ message: 'You clicked EXAMS' })}),
    new ThreeLineListItems($r('app.media.sathwik'), "Work", 'If you are free lets finish the homework','Sathwik',$r('app.media.exams'),function ab(){ AlertDialog.show({ message: 'You clicked WORK' })}),
  ]
  build(){
    Column() {
      ThreeLineListGroup({
        models: this.model_ThreeListGroup,
        options: this.List_items,
      })
    }
  }
}