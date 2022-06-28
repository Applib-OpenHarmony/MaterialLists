import prompt from '@system.prompt';
import { Threelinelistitems, Tripleline_list }  from '@ohos/Material_Lists'
@Entry
@Component
struct Index {
  List_items: Threelinelistitems[] = [

    new Threelinelistitems( $r('app.media.rahul'),"Rahul",'Lets meet this evening for discussion of project' , '01'),
    new Threelinelistitems( $r('app.media.rohith'),"Rohith",'Any plans this weekend ! ' ,  '02'),
    new Threelinelistitems( $r('app.media.chaitanya'),"Eraser",'How about BBQ today night' , '03'),
    new Threelinelistitems( $r('app.media.hitman'),"Cricket Lovers",'Rohith Sharma-Lets watch IND vs SA match in BLA restaurant' , '04'),
    new Threelinelistitems( $r('app.media.wrestling'),"Roman Reigns",'How about going to Wrestling finals? ' , null),
    new Threelinelistitems( $r('app.media.khaby'),"Memes",'Memer - Hey !Check out this new meme' , null),
    new Threelinelistitems($r('app.media.ronaldo'), "FootBall", 'FootBall is LUB', $r('app.media.messi')),
    new Threelinelistitems($r('app.media.cake'), "Messi B'day", 'Ronaldo-Happy Birthday messi', null),
    new Threelinelistitems($r('app.media.studyy'), "Exams", 'Only one week left for exams', $r('app.media.imp')),
    new Threelinelistitems($r('app.media.sathwik'), "Sathwik", 'If you are free lets finish the homework',$r('app.media.exams')),
  ]
  build(){
    Column() {
      Tripleline_list({
        arri: this.List_items,
      })
    }
}
  }
