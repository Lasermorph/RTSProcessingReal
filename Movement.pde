class Movement
{
  Movement()
  {
  }

  void Movement(PVector pos, PVector destination, float s)
  {
    PVector d = new PVector(destination.x-pos.x, destination.y-pos.y);
    d.limit(s);
    pos.x += d.x;
    pos.y += d.y;
    try{
    ((Player)CurrScene.getObjectByName("Player")).Create(pos, destination);
    }
    catch(Exception e){println("Yup the player is not there");}
  }


  void New_target(float x, float y, PVector destination)
  {
    destination.x = x;
    destination.y = y;
  }
  
  void MouseOnAction(PVector destination) 
  {
    if (mousePressed && (mouseButton == RIGHT)) 
    {
      movement.New_target(mouseX, mouseY, destination);
    }
  }
  
}
