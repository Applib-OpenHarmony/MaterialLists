import prompt from '@system.prompt';
import { New_Nestedlistitems, New_Nested_list }  from '@ohos/Material_Lists'
@Entry
@Component
struct Index {
  List_items: New_Nestedlistitems[] = [
    new New_Nestedlistitems($r('app.media.google'), "Search Engine", 'Google',null),
    new New_Nestedlistitems(null, "Privacy", null,null),
    new New_Nestedlistitems($r('app.media.mic'), "Voice Search", 'English(US)',null),
    new New_Nestedlistitems(null, "When Device is Locked", 'Show all Notification Content','toggle'),
    new New_Nestedlistitems($r('app.media.clock'), " Start Time", '10:00 AM','24hrs'),

  ]
  Advanced_List_items: New_Nestedlistitems[] = [
    new New_Nestedlistitems($r('app.media.battery'), "Battery Saver ", 'Charge less than 10%','toggle'),
    new New_Nestedlistitems($r('app.media.game'), "Gaming Mode On", 'When any game is opened','toggle'),
    new New_Nestedlistitems(null, "Privacy", null,null),
    new New_Nestedlistitems(null, "Encryption", 'upadte available',null),
    new New_Nestedlistitems(null, "Passwords Visible", null,$r('app.media.tick')),
    new New_Nestedlistitems($r('app.media.bin'), "Clear Cache", null,null),
  ]
  build(){
    Column() {
      New_Nested_list({
        arri: this.List_items,
        arr : this.Advanced_List_items

      })
    }
}
  }
