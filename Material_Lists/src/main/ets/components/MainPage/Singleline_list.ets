/*
 * Copyright (c) 2022 Application Library Engineering Group.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export class Singlelinelistitems {
  isleadingiconpresent :boolean
  leadingicon:  Resource
  data: string
  trailingicon:Resource
  istrailingiconpresent:boolean
  constructor(data: string, leadingicon: Resource,trailingicon:Resource ) {
    this.data=data;
    this.leadingicon=leadingicon;
    this.trailingicon=trailingicon;
    this.isleadingiconpresent= (leadingicon == null) ? false : true;
    this.istrailingiconpresent=(trailingicon == null) ? false : true;
  }
}
@Component
export struct Singleline_list {
  category_scroller: Scroller = new Scroller();
 desc_scroller: Scroller = new Scroller();
  @State arri: Singlelinelistitems[] = []
  build() {
    Scroll(this.category_scroller) {
      Column() {
      List(){
         ForEach(this.arri, (item) => {
         ListItem() {
             if (item.isleadingiconpresent == false && item.istrailingiconpresent == false) {
               Flex() {
                 Flex(){
                 }.padding({ right: 20 }).height(50).width(70);
                 Flex({alignItems: ItemAlign.Center}) {
                   // Scroll(this.desc_scroller) {
                   Text(item.data).fontSize(30)
                     .textOverflow({ overflow: TextOverflow.Ellipsis })
                     .maxLines(1)
                   //  }.scrollable(ScrollDirection.Horizontal)
                 }.width(190).height(50).padding({ right: 15 });
                 Flex() {
                 }.width(50).height(50);
               }.padding(7);
             }
             else if (item.isleadingiconpresent == true && item.istrailingiconpresent == true) {
               Flex() {
                Flex({alignItems: ItemAlign.Center}){
                   Image(item.leadingicon).objectFit(ImageFit.Cover).width(50).height(50).borderRadius(5);
                 }.padding({ right: 20 }).height(50).width(70);
                 Flex({alignItems: ItemAlign.Center}) {
                  // Scroll(this.desc_scroller) {
                     Text(item.data).fontSize(30)
                       .textOverflow({ overflow: TextOverflow.Ellipsis })
                       .maxLines(1)
                 //  }.scrollable(ScrollDirection.Horizontal)
                 }.width(190).height(50).padding({ right: 15 });
                 Flex({alignItems: ItemAlign.Center}) {
                   Image(item.trailingicon).objectFit(ImageFit.Cover).width(35).height(35);
                 }.width(50).height(50);
               }.padding(7);
             }
             else if (item.isleadingiconpresent == true && item.istrailingiconpresent == false) {
               Flex() {
                 Flex({alignItems: ItemAlign.Center}){
                   Image(item.leadingicon).objectFit(ImageFit.Cover).width(50).height(50).borderRadius(5);
                 }.padding({ right: 20 }).height(50).width(70);
                 Flex({alignItems: ItemAlign.Center}) {

                   Text(item.data).fontSize(30)
                     .textOverflow({ overflow: TextOverflow.Ellipsis })
                     .maxLines(1)

                 }.width(190).height(50).padding({ right: 15 });
                 Flex() {
                 }.width(50).height(50);
               }.padding(7);
             }
             else if (item.isleadingiconpresent == false && item.istrailingiconpresent == true) {
               Flex() {
                 Flex(){
                 }.padding({ right: 20 }).height(50).width(70);
                 Flex({alignItems: ItemAlign.Center}) {
                   // Scroll(this.desc_scroller) {
                   Text(item.data).fontSize(30)
                     .textOverflow({ overflow: TextOverflow.Ellipsis })
                     .maxLines(1)
                   //  }.scrollable(ScrollDirection.Horizontal)
                 }.width(190).height(50).padding({ right: 15 });
                 Flex({alignItems: ItemAlign.Center}) {
                   Image(item.trailingicon).objectFit(ImageFit.Cover).width(35).height(35);
                 }.width(50).height(50);
               }.padding(7);
             }
           }.sticky(Sticky.Normal);
         })
          } //.onItemDragLeave(event: (event: ItemDragInfo, itemIndex: number) )
      }.padding(4);
    }
  }

}









