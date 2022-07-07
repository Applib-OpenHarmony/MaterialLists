# Material_UI_Lists
## Dependencies
For using material-lists in your app, add the below dependency in entry/package.json
```
"dependencies": {
    "@ohos/material-lists": "file:../materiallists" 
  }
 ``` 	
## Usage Instructions
Import all components at once
```
import {SingleLineListItems, SingleLineListGroup, TwoLineListGroup,TwoLineListItems,ThreeLineListItems, ThreeLineListGroup,NestedListGroup,NestedListItems,CommonGroupModel,ListType} from '@ohos/material-lists'
```
## Screenshots
 ![single-Line-List-Demo](https://user-images.githubusercontent.com/105175305/177296416-e8e33c0c-20a1-421f-81c9-2539b67ae1c1.gif)
 ![double-line-list-demo](https://user-images.githubusercontent.com/105175305/177506365-3ed43f01-f541-46c4-8db4-25690c6a5b4f.gif)<br/>
![three-Line-List-Demo](https://user-images.githubusercontent.com/105175305/177296676-e88fc9e7-58f7-41c0-90c8-34ab3d30c66f.gif)
![nested-line-list-demo-](https://user-images.githubusercontent.com/105175305/177508297-9d608f3f-c73e-4324-86c4-79e9d7fa3f59.gif)

## Common Properties Like Sizes, Color and weights
## Methods
Common group model extends this class and used to get access to all these methods.
| Name     | Return Type       | Description   
| ------------- | ------------- | --------    |
| `getRippleAnimation()`        | `boolean`          | returns if we want ripple effect   |
| `setRippleAnimation(rippleAnimation: boolean)`        | `CommonProperties`          | sets if we want ripple effect    |
| `getRippleColor`        | `string`          |  return the color of the animation effect  |
| `setRippleColor(Color: string)`        | `CommonProperties`          |  sets the color of the animation effect  |
| `getListItemsSpace()`        | `string`          |  returns the space between list items   |
| `setListItemsSpace(ListItemSpace: string)`        | `CommonProperties`          |sets the space between list items   |
| `getListMainDataFontWeight()`        | `FontWeight`          |  returns fontWeight of Main Data  |
| `setListMainDataFontWeight(MainDtaFontWeight:FontWeight)`        | `CommonProperties`          | sets fontWeight of Main Data    |
| `getListSubDataFontWeight()`        | `FontWeight`          |  returns fontWeight of Sub Data   |
| `setListSubDataFontWeight(SubDtaFontWeight:FontWeight)`        | `CommonProperties`          |  sets fontWeight of Sub Data   |
| ` getSymbol()`        | `string`          |   returns symbol that seperates secondary sub data and sub data  |
| `setSymbol(Separator: string)`        | `CommonProperties`          |   sets symbol that seperates secondary sub data and sub data  |
| ` getListDataRightSpace()`        | `string`          |    returns padding to the right of Data content Container |
| `setListDataRightSpace(ListDataSpace: string)`        | `CommonProperties`          |   sets padding to the right of Data content Container  |
| ` getListDataContainerSize()`        | `SizeOptions`          | returns List Data Container Size   |
| ` setListDataContainerSize(DataContainerSize: SizeOptions)`        | `CommonProperties`          | sets List Data Container Size   |
| `getListSubDataSize()`        | `string`          |  returns List Sub Data  Size  |
| `setListSubDataSize(SubDataSize: string)`        | `CommonProperties`          |   sets List Sub Data  Size  |
| ` getListMainDataSize()`        | `string`          |  returns List Main Data  Size   |
| `setListMainDataSize(MainDataSize: string)`        | `CommonProperties`          |    sets List Main Data  Size |
| `getListContainerSize()`        | `SizeOptions`          |  returns List Container  Size   |
| `setListContainerSize(ContainerSize: SizeOptions)`        | `CommonProperties`          |  sets List Container  Size  |
| ` getListTrailingContentTextSize()`        | `string`          |   returns Trailing Content Text  Size |
| ` setListTrailingContentTextSize(TrailContent: string)`        | `CommonProperties`          |    sets Trailing Content Text  Size |
| `getListLeadingContainerSize()`        | `SizeOptions`          |  return Leading Container Size  |
| `setListLeadingContainerSize(LeadingContainerSize: SizeOptions)`        | `CommonProperties`          |  sets Leading Container Size   |
| ` getListLeadingContentTextSize()`        | `string`          |   returns Leading Content Text  Size  |
| `setListLeadingContentTextSize(LeadContent: string)`        | `CommonProperties`          |  sets Leading Content Text  Size   |
| ` getListLeadingContentImageSize()`        | `string`          |   returns Leading Content Image  Size  |
| ` setListLeadingContentImageSize(LeadContent: SizeOptions)`        | `string`          |   sets Leading Content Image  Size  |
| `  getListTrailingContentImageSize()`        | `SizeOptions`          |  returns Trailing Content Image  Size   |
| `setListTrailingContentImageSize(TrailContent: SizeOptions)`        | `CommonProperties`          |   sets Trailing Content Image  Size  |
| ` getListTrailingContainerSize()`        | `SizeOptions`          | return Trailing Container Size   |
| `setListTrailingContainerSize(TrailingContainerSize: SizeOptions)`        | `CommonProperties`          |  sets Trailing Container Size  |
| `  getLeadingImageBorderRadius()`        | `string`          |  returns border radius of leading image  |
| ` setLeadingImageBorderRadius(rad: string)`        | `CommonProperties`          |  sets border radius of leading image  |
| `   getTrailingImageBorderRadius()`        | `string`          | returns border radius of trailing image   |
| `   setTrailingImageBorderRadius(rad: string)`        | `CommonProperties`          |  sets border radius of trailing image  |
| `  getDivider()`        | `boolean`          |   returns if we want divider between list items |
| `  setDivider(divide:boolean)`        | `CommonProperties`          |  sets if we want divider between list items  |
| `  getDividerColor()`        | `string`          | returns  divider Color  between list items   |
| `  setDividerColor(divColor:  string)`        | `CommonProperties`          | sets  divider Color  between list items   |
| `  getDividerStrokeWidth()`        | `number`          |  returns  divider Stroke Width of divider  between list items  |
| `setDividerStrokeWidth(StrokeWidth:number) `        | `CommonProperties`          |  sets  divider Stroke Width of divider  between list items  |
| `  getListMainDataFontColor()`        | `string`          |  returns font Color of Main Data  |
| `  setListMainDataFontColor(MainDataFontColor:  string)`        | `CommonProperties`          |  sets font Color of Main Data  |
| `  getBackGroundColor()`        | `string`          |  returns background color of list  |
| `  setBackGroundColor(BackGroundColor:  string)`        | `CommonProperties`          |  sets  background color of list  |
| `  getListSubDataFontColor()`        | `string`          |  returns font Color of Sub Data  |
| `  setListSubDataFontColor(SubDataFontColor:  string)`        | `CommonProperties`          |  sets font Color of Sub Data  |
| `  getMainDataFontStyle()`        | `FontStyle`          |  returns font Style of Main Data  |
| `  setMainDataFontColor(MainDataFontStyle:  FontStyle)`        | `CommonProperties`          |  sets font Style of Main Data  |
| `  getSubDataFontStyle()`        | `FontStyle`          |  returns font Style of Sub Data  |
| `  setSubDataFontStyle(SubDataFontStyle:  FontStyle)`        | `CommonProperties`          |  sets font Style of Sub Data  |

## ListType enum
| Name     |  Description   
| ------------- |  --------    |
|       SingleListGroup         |  If the list type is singular            |
|       DoubleListGroup         |   If the list type is Double             |
|       TripleListGroup         |    If the list type is Triple          |
|       NestedListGroup         |   If the list type is Nested (mixed of all)             |
## List-Models
 1)CommonGroupModel
1)SingleLineListModel ,
2) TwoLine ListModel
3)ThreeLineListModel
## Class CommonGroupModel.Model
| Name     | Return Type       | Description   
| ------------- | ------------- | --------    |
| `setListType(listType : ListType)`        | `CommonGroupModel.Model`          | sets list type  Defaults to ListType.NestedListGoup  |
| `getFabType()`        | `FabType`          | return current fab type.  |		
		
## Class SingleLineListModel
| Name     | Return Type       | Description   
| ------------- | ------------- | --------    |
| `getListLabel()`        | `string`          | returns the Main Data of the ListItem   |
| `getListFunction()`        | `function`          | returns the Main Data of the ListItem   |
| `getListType()`        | `listType`          | returns the Main Data of the ListItem   |
| `getListTrailingContent()`        | `string | Resource`          |  returns the Trailing Content of the ListItem  |
| `getListLeadingContent()`        | `string | Resource`          | |returns the Leading Content of the ListItem   |
| `getIsTrailingContentImage()`        | `boolean`          |returns if Trailing Content  image    |
| `getIsLeadingContentImage()`        | `boolean`          | returns the Leading Content image   |
## Class TwoLineListModel
Have access to all functions of SingleLineListModel,
| Name     | Return Type       | Description   
| ------------- | ------------- | --------    |
| `getListSubData()`        | `string`          | returns the Sub Data of the ListItem   |
## Class ThreeLineListModel
Have access to all functions of TwoLineListModel,
| Name     | Return Type       | Description   
| ------------- | ------------- | --------    |
| `getListSecondarySubData()`        | `string`          | returns the Secondary Sub Data of the ListItem   |
## Examples:
### SingleLineList:
![Screenshot (747)](https://user-images.githubusercontent.com/105175305/177317547-9603f218-c97c-4179-b4f2-508115240bef.png)
Code:
 ```
import prompt from '@system.prompt';
import { SingleLineListItems, SingleLineListGroup,CommonGroupModel,ListType }  from '@ohos/material-lists'

@Entry
@Component
struct Index {
  model_SingleListGroup: CommonGroupModel.Model = new CommonGroupModel.Model().setGroupListType(ListType.SingleListGroup)
     show : boolean = true
  aboutToAppear(){
    this.model_SingleListGroup.setBackGroundColor('#000000')
    this.model_SingleListGroup.setListMainDataFontColor('#FFFFFF')
  }
  List_items: SingleLineListItems[] = [
    new SingleLineListItems($r('app.media.education'), "Education", $r('app.media.book'), function a() {
      AlertDialog.show({ message: 'You clicked Education' })
    }),
    new SingleLineListItems($r('app.media.health'), "Health", $r('app.media.heart'), function a() {
      AlertDialog.show({ message: 'You clicked Health' })
    }),
    new SingleLineListItems($r('app.media.family'), "Family", $r('app.media.icon'), function a() {
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
 ```
### TwoLineList:
![Screenshot (749)](https://user-images.githubusercontent.com/105175305/177320056-d322ac54-521d-457c-b68c-a7ec64011c66.png)
Code:
 ```
import prompt from '@system.prompt';
import {  TwoLineListGroup, TwoLineListModel, TwoLineListItems, CommonGroupModel,ListType}  from '@ohos/material-lists'
@Entry
@Component
struct Index {
  aboutToAppear(){
    this. model_TwoListGroup.setListMainDataFontColor('#0000FF')
    this. model_TwoListGroup.setListSubDataFontColor('#808080')

  }
  model_TwoListGroup: CommonGroupModel.Model = new CommonGroupModel.Model().setGroupListType(ListType.DoubleListGroup)
  private List_items: TwoLineListItems[] = [
    new TwoLineListItems($r('app.media.bat'), "Bat", 'in stock', '$20.5',function ab(){ AlertDialog.show({ message: 'You clicked BAT' })}),
    new TwoLineListItems($r('app.media.gloves'), "Gloves", 'in stock', '$10.5', function ab(){ AlertDialog.show({ message: 'You clicked GLOVES' })}),
    new TwoLineListItems($r('app.media.ruler'), "Ruler", 'in stock-5% discount','$4.5',function ab(){ AlertDialog.show({ message: 'You clicked RULER' })}),
    new TwoLineListItems($r('app.media.clock'), "Clock", 'in stock', '$30.5',function ab(){ AlertDialog.show({ message: 'You clicked CLOCK' })}),
    new TwoLineListItems($r('app.media.furniture'), "Eatables", 'price according to item selected', '$30.5',function ab(){ AlertDialog.show({ message: 'You clicked EATABLES' })}),
    new TwoLineListItems($r('app.media.toothpaste'), "Colgate", 'in stock', '$15.5',function ab(){ AlertDialog.show({ message: 'You clicked COLGATE' })}),
    new TwoLineListItems($r('app.media.brush'), "Brush", 'in stock','$25.5',function ab(){ AlertDialog.show({ message: 'You clicked BRUSH' })} ),
    new TwoLineListItems($r('app.media.bottle'), "Bottle", 'in stock', '$35',function ab(){ AlertDialog.show({ message: 'You clicked BOTTLE' })})
  ]
  build() {
    Column() {
      TwoLineListGroup({
        models: this.model_TwoListGroup,
        options: this.List_items,
      })
    }
  }
}

  ```
### ThreeLineList:

![Screenshot (751)](https://user-images.githubusercontent.com/105175305/177322395-c3b2963d-c013-4dc8-8d5d-c02f85b77649.png)
Code:
 ```
import prompt from '@system.prompt';
import { ThreeLineListItems, ThreeLineListGroup, CommonGroupModel,ListType,}  from '@ohos/material-lists'
@Entry
@Component
struct Index {
  aboutToAppear(){
    this.model_ThreeListGroup.setDividerColor('#0000FF')
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
 
  ```
### NestedList:
![nested-line-list-demo](https://user-images.githubusercontent.com/105175305/177507497-c2fd455d-870c-4112-bc95-23432466d8e6.gif)

 Code:
```

import prompt from '@system.prompt';
import { NestedListGroup,NestedListItems,CommonGroupModel,ListType }  from '@ohos/material-lists'
@Entry
@Component
struct Index {
  aboutToAppear(){
    this.model_NestedListGroup.setRippleColor('#FFC0CB')
    this.model_NestedListGroup.setListMainDataSize('32vp')
    this.model_NestedListGroup.setMainDataFontStyle(FontStyle.Italic)
  }
  model_NestedListGroup: CommonGroupModel.Model = new CommonGroupModel.Model().setGroupListType(ListType.NestedListGroup)
  List_items: NestedListItems[] = [
    new NestedListItems(  $r('app.media.rahul'),"Meeting",'Lets meet this evening for discussion of project' ,'Rahul', '01',function ab(){ AlertDialog.show({ message: 'You clicked PROJECT' })}),
    new NestedListItems($r('app.media.google'), "Search Engine",'Google',null,null,function ab(){ AlertDialog.show({ message: 'You clicked GOOGLE' })}),
    new NestedListItems($r('app.media.mic'), "Voice Search", 'US','English',null,function ab(){ AlertDialog.show({ message: 'You clicked mic' })}),
    new NestedListItems($r('app.media.clock'), " Clock", '10:00 AM',null,'24hrs',function ab(){ AlertDialog.show({ message: 'You clicked Clock' })}),
    new NestedListItems($r('app.media.maps'), " Gmaps", '20m','Turn left after',$r('app.media.direction'),function ab(){ AlertDialog.show({ message: 'You clicked Google Maps' })}),
    new NestedListItems($r('app.media.recorder'), " Recorder", '2min 30secs',null,'00:01',function ab(){ AlertDialog.show({ message: 'You clicked Recorder' })}),
    new NestedListItems($r('app.media.camera'), " Camera", null,null,null,function ab(){ AlertDialog.show({ message: 'You clicked Camera' })}),
    new NestedListItems($r('app.media.battery'), " Battery", '30%',null,$r('app.media.charging'),function ab(){ AlertDialog.show({ message: 'You clicked Charging' })}),
    new NestedListItems(null, "Privacy",null, null,null,function ab(){ AlertDialog.show({ message: 'You clicked PRIVACY' })}),
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

```
## Compatibility
Supports OpenHarmony API version 8 and above
## Code Contribution
If you find any problems during usage, you can submit an [Issue](https://github.com/Applib-OpenHarmony/MaterialLists/issues) to us. Of course, we also welcome you to send us [PR](https://github.com/Applib-OpenHarmony/MaterialLists/pulls).
## Open source License
This project is based on [Apache License 2.0](https://github.com/Dasari-Jay-Prakash12/Material_UI_Lists/blob/main/LICENSE), please enjoy and participate in open source freely.




