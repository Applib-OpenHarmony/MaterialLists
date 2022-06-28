import prompt from '@system.prompt';
import { Nestedlistitems, Nested_list }  from '@ohos/Material_Lists'
@Entry
@Component
struct Index {
  List_items: Nestedlistitems[] = [
    new Nestedlistitems($r('app.media.google'), "Search Engine", 'Google',null),
    new Nestedlistitems(null, "Privacy", null,null),
    new Nestedlistitems($r('app.media.mic'), "Voice Search", 'English(US)',null),
    new Nestedlistitems(null, "When Device is Locked", 'Show all Notification Content',$r('app.media.tick')),
    new Nestedlistitems($r('app.media.clock'), " Start Time", '10:00 AM','24hrs'),

  ]
  Advanced_List_items: Nestedlistitems[] = [
    new Nestedlistitems($r('app.media.battery'), "Battery Saver ", 'Charge less than 10%',null),
    new Nestedlistitems($r('app.media.game'), "Gaming Mode", 'When any game is opened',null),
    new Nestedlistitems(null, "Privacy", null,null),
    new Nestedlistitems(null, "Encryption", 'upadte available',null),
    new Nestedlistitems(null, "Passwords are Saved", null,$r('app.media.tick')),
    new Nestedlistitems($r('app.media.bin'), "Clear Cache", null,null),
  ]
  build(){
    Column() {
      Nested_list({
        arri: this.List_items,
        arr : this.Advanced_List_items

      })
    }
}
  }
