//Her er vores array med vores flue, hvis objekt er defineret under "class" 
ArrayList<Flue> flueListe = new ArrayList<Flue>();

//Her angives de nødtvendige proportioner for vores canvas
void setup(){
  size(500,500);
}
//Som det er nu så bliver vores flueer tegnet og ikke fjernet, 
//dette skyldes at der ikke er ikke er blevet angivet clear();

//
void draw(){
  clear();
  for(int i=0; i<flueListe.size(); i++){
    Flue f = flueListe.get(i);
    f.tegnFlue();
    f.flyt();
  }
}

//Her registerer programmeet et klik på en vilkårlig knap som ikke er "ecs" eller funktion knapperne, dette generer en ny flue fra vores array 
void keyPressed(){
  flueListe.add(new Flue());
}

//Her registreres musens koordinator til at angive hvor på vores canvas flueen skal angives 
void mousePressed(){
  flueListe.add(new Flue(mouseX, mouseY));
}

/////////////////////////////////////////////////////////
//Her defineres "Flue" som objekt samt. dens dimensioner og positionerne a & b's værdier 
//Vinkel som er angivet til at være "random" er den der vinkler vores flue tilfældigt for hver gang at vi trykker på musen 
class Flue{
  
  float positionX,positionY;
  float distanceFlyttet;
  float vinkel = 0; 
  
  Flue(){
    positionX  = random(0,height);
    positionY  = random(0,width);
    vinkel     = random(0,2*PI);
  }
  
  Flue(float a, float b){
    positionX = a;
    positionY = b;
    vinkel    = random(0,2*PI);
  }
  
  //Her angives hastigheden af vores flue
  void flyt(){
    distanceFlyttet = distanceFlyttet + 0.5;
  }
  
//Her tegnes fluen
  void tegnFlue(){
    pushMatrix();
      translate(positionX,positionY);
      rotate(vinkel);
      translate(distanceFlyttet,0);
        ellipse(0,0,20,8);
        ellipse(0,0-8,15,10);
        ellipse(0,0+8,15,10);
        ellipse(0+6,0,8,8);
    popMatrix();
  } 
}
