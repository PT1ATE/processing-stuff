// M_1_5_02_TOOL.pde
// Agent.pde, GUI.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

void setupGUI(){
  
  cp5 = new ControlP5(this);
  
  CColor c = new CColor();
  c.setBackground(color(35,35,35));
  
  List notesList = Arrays.asList("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B");
  List modesList = Arrays.asList("Ionian", "Dorian", "Phrygian", "Lydian", "Mixolydian", "Eolian (minor)", "Locrian");
  /* add a ScrollableList, by default it behaves like a DropdownList */
  cp5.addScrollableList("Notes")
     .setPosition(16, 16)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(notesList)
     .setColor(c)
     .setType(ScrollableList.DROPDOWN) // currently supported DROPDOWN and LIST
     .setCaptionLabel("C") // Default value, is replaced when dropdown is clicked
     .close()
     ;
  cp5.addScrollableList("Modes")
     .setPosition(232, 16)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(modesList)
     .setColor(c)
     .setType(ScrollableList.DROPDOWN) // currently supported DROPDOWN and LIST
     .setCaptionLabel("Ionian") // Default value, is replaced when dropdown is clicked
     .close()
     ;
}

void drawGUI(){
  cp5.show();
  cp5.draw();
  
  Controller cn = cp5.getController("Notes");
  int valueNotesDropdown = floor(cn.getValue());
  keyNote = cp5.get(ScrollableList.class, "Notes").getItem(valueNotesDropdown).get("text").toString();
  
  Controller cm = cp5.getController("Modes");
  int valueModesDropdown = floor(cm.getValue());
  mode = cp5.get(ScrollableList.class, "Modes").getItem(valueModesDropdown).get("name").toString();
  
}