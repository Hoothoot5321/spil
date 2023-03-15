//  TopView by haje-aatg (Hans-ChristianBJensen)
// An assignment template for a 2D array containing objects
// Contains no comments, since the student needs to make these
//
// Link: https://github.com/haje-aatg/2DTemplateTopView

class Player extends WorldObject {
  Player() {
    super();
    worldObjectColor = color(255, 0, 0);
  }
  Player(boolean tempblocked) {
    super(tempblocked);
    worldObjectColor = color(255, 0, 0);
  }
  void moveForward() {
    print(place + " : " + direction);
    if (int(place.y+direction.y)>0 && int(place.x+direction.x)>0) {
      place.add(direction);
      println(" .Now: " + place);
    }
  }
  /*void selfNavigate() {
   println(place + " : " + direction);
   if (int(place.y-direction.x)>0 && int(place.x+direction.y)>0) {
   if (World[int(place.y-direction.x)][int(place.x+direction.y)].passable == true) {
   println("Nothing to left");
   place.x+=direction.y;
   place.y-=direction.x;
   int temp = int(direction.x);
   direction.x=int(direction.y);
   direction.y=-temp;
   }
   } else {
   println("Something to left");
   if (int(place.y+direction.y)>0 && int(place.x+direction.x)>0) {
   if (World[int(place.y+direction.y)][int(place.x+direction.x)].passable == true) {
   println("Something to left. Nothing in front");
   place.add(direction);
   }
   } else {
   println("Something in front");
   if (World[int(place.y+direction.x)][int(place.x-direction.y)].passable == true) {
   println("Something to left & in front. Nothing to right");
   place.x-=direction.y;
   place.y+=direction.x;
   int temp = int(direction.x);
   direction.x=-int(direction.y);
   direction.y=temp;
   } else {
   println("Something to left & in front & to right = deadend");
   place.x-=direction.x;
   place.y-=direction.y;
   direction.x=-int(direction.x);
   direction.y=-int(direction.y);
   }
   }
   }
   }*/
  void action() {
    /*for (int index =50; index<100; index++) {//downCodedKeys.length
     //println(index + " : " + downCodedKeys[index]);
     println(index + " : " + downKeys[index]);
     }*/
    PVector sumDirection = new PVector(0, 0);  //
    if (downCodedKeys[38]) {
      sumDirection.add(new PVector(0, -1));
    }
    if (downCodedKeys[40] ) {
      sumDirection.add(new PVector(0, 1));
    }
    if (downCodedKeys[37]) {
      sumDirection.add(new PVector(-1, 0));
    }
    if (downCodedKeys[39]) {
      sumDirection.add(new PVector(1, 0));
    }
    //Can't move out of map
    if (int(player.place.x+sumDirection.x)<0 || int(player.place.x+sumDirection.x)>worldOne.length-1) {
      sumDirection.x=0;
    }
    if (int(player.place.y+sumDirection.y)<0 || int(player.place.y+sumDirection.y)>worldOne[0].length-1) {
      sumDirection.y=0;
    }
    //
    if (sumDirection.mag()>0) {
      direction=sumDirection;
      if (worldOne[int(player.place.x+direction.x)][int(player.place.y+direction.y)].passable) {
        place.add(direction);
      }
    }
    //
    if (downKeys[97]) {
      if (int(player.place.x+direction.x)<0 || int(player.place.x+direction.x)>worldOne.length-1 || int(player.place.y+direction.y)<0 || int(player.place.y+direction.y)>worldOne[0].length-1) {
      } else {
        print("Attacking! " + direction);
        worldOne[int(place.x+direction.x)][int(place.y+direction.y)].attacked(byte(1));
      }
    }
  }
}
