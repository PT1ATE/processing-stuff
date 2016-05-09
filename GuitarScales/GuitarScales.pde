import controlP5.*;
import java.util.*;
ControlP5 cp5;

boolean showGUI = false;
Slider[] sliders;

int padding = 10;

String[] notes = {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"};
String[] notesUpdate;
int[] notesAvailDefault = {1, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1};
int[] notesAvailUpdate;
String keyNote = "F";
String mode = "Ionian";
int noteIndex;
int intervalWithModeNote = 0;

void setup(){
  size(960, 240);
  background(0);
  setupGUI();
}

void draw(){
  background(0);
  
  // Notes processing
  updateNotesAndScale();
  updatesIntervalWithModeNote();
  
  // Draw guitar
  drawFretboard();
  drawPoints();
  
  // Draw notes on each string
  drawNotes(retrieveInterval("E"), 180); // E string
  drawNotes(retrieveInterval("A"), 164); // A string
  drawNotes(retrieveInterval("D"), 148); // D string
  drawNotes(retrieveInterval("G"), 132); // G string
  drawNotes(retrieveInterval("B"), 116); // B string
  drawNotes(retrieveInterval("E"), 100); // E string
  
  
  
  drawGUI();
  drawText();
}
int retrieveInterval(String noteToProcess){
  String ntp = noteToProcess;
  int value = 0;
  
  for(int i = 0;i<notesUpdate.length; i++){
    if(notesUpdate[i] == ntp){
      value = i;
    }
  }
  
  return value;
}

void updateNotesAndScale(){
  
  int cursor = 0;
  
  for(int i = 0;i<notes.length; i++){
    if(notes[i] == keyNote){
      cursor = i;
    }
  }
  
  String[] n2 = subset(notes, cursor);
  String[] n1 = subset(notes, 0, cursor);
  
  notesUpdate = concat(n2, n1);
  
}

void updatesIntervalWithModeNote(){
  switch(mode){
    case "Ionian":
      intervalWithModeNote = 0;
      break;
    case "Dorian":
      intervalWithModeNote = 2;
      break;
    case "Phrygian":
      intervalWithModeNote = 4;
      break;
    case "Lydian":
      intervalWithModeNote = 5;
      break;
    case "Mixolydian":
      intervalWithModeNote = 7;
      break;
    case "Eolian (minor)":
      intervalWithModeNote = 9;
      break;
    case "Locrian":
      intervalWithModeNote = 11;
      break;
  }
}

void drawFretboard(){
  
  // Strings
  for(int i = 1; i < 7; i++){
    noFill();
    stroke(255,75);
    line(0, 84+(i*16), width, 84+(i*16));
  }
  
  // Frets
  for(int i = 1; i < 48; i++){
    noFill();
    strokeWeight(1);
    stroke(255,75);
    
    if(i == 12){
      strokeWeight(5);
      stroke(255,125);
    }

    line(i*20, 100, i*20, 180);
  }
}

void drawNotes(int indexStartNote, int yPos){
  
  int isn = indexStartNote;
  int yp = yPos;
  int j = isn;
  int t = 0;
  int alpha = 255;
  
  for(int i = 0; i < 48; i++){
      
    // before or after fretboard ? If outside, apply an alpha
    if(i <= 12 || i > 36){
       alpha = 75;
    }
    else{
        alpha = 255;
    }
    
    // Is the note on the scale. If so, display it.
    if(notesAvailDefault[j] == 1){
      
      // Key note ?
      if(j == 0){
        noStroke(); 
        fill(0, 116, 217, alpha);
        ellipse(i*20-9.5, yp, 10, 10);
      }
      else if(i == 12){
        noFill(); 
        stroke(255, alpha);
        ellipse(i*20-9.5, yp, 10, 10);
      }
      else{
         fill(255, alpha);
         ellipse(i*20-9.5, yp, 8, 8);
      }
      
      // Active interval ? ?
      if(j == intervalWithModeNote){
        noFill();  
        stroke(255, alpha-75);
        ellipse(i*20-10, yp-0.25, 18, 18);
        
        noStroke(); 
        fill(255, alpha);
        
        if(j == 0){
          fill(0, 116, 217, alpha);
        }
        
        ellipse(i*20-9.5, yp, 8, 8);
      } 
      
      
      
    } 
    
    if(j == 11){
      j = 0;
      t++;
    } else {
      j++;
    }
  }
}

void drawPoints(){

    noStroke();
    fill(255 );
    //
    ellipse(290, height-40, 4, 4);
    ellipse(330, height-40, 4, 4);
    ellipse(370, height-40, 4, 4);
    ellipse(410, height-40, 4, 4);
    //
    ellipse(468, height-40, 4, 4);
    ellipse(472, height-40, 4, 4);
    //
    ellipse(530, height-40, 4, 4);
    ellipse(570, height-40, 4, 4);
    ellipse(610, height-40, 4, 4);
    ellipse(650, height-40, 4, 4);
    //
    ellipse(708, height-40, 4, 4);
    ellipse(712, height-40, 4, 4);
    
}

void drawText(){
  fill(255);
  text(notesUpdate[intervalWithModeNote], 448, 32);
}