//FUCK MEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
//TIMES 2
//IN SECOND

//magnus branch 

  //----------GameStatesVariables--------------//
  
  String gameState;
  Movement movement = new Movement();
EnemyL enemyL = new EnemyL();
EnemyT enemyT = new EnemyT();
//EnemyBalls eb = new EnemyBalls(x, y);
PImage playerF;
boolean me = true;
  
  //--------GameStatesVariablesEnd------------//
  
  
 // --------------------------------------------------------------------------------------------------------------
  
  
  //-----------ButtonVariables---------------//
  
  /*int rectX, rectY;
  int rectX2, rectY2;
  int rectX3, rectY3;
  int circleX, circleY;
  int rectSizeY = 80; //Diameter of rect x
  int rectSizeX = 180; //Diameter of rect y
  

  int circleSize = 93; //Diameter of circle
  
  
  color rectColor, circleColor, baseColor;
  color rectColor2, circleColor2, baseColor2;
  color rectColor3, circleColor3, baseColor3; 
  color rectHighlight, circleHighlight;
  color rectHighlight2, circleHighlight2; 
  color rectHighlight3, circleHighlight3;  
  color currentColor;
  
  boolean rectOver = false;
  boolean circleOver = false;
  
  boolean rectOver2 = false;
  boolean circleOver2 = false;
  
  boolean rectOver3 = false;
  boolean circleOver3 = false;
  */

//----------ButtonVariablesEnd-------------//


// ----------------------------------------------------------------------------------------------------------------
Scene CurrScene = new Scene("Primitive");
ArrayList<Scene> SceneList = new ArrayList<Scene>();

void settings()
{
  size(1920,1080);

}

void LoadScene(String SceneName)
{
  frameRate(120);
  //eBalls = new ArrayList<Enemy_ball>();
  //enemyL = new EnemyL(extends GameObjBaseneList.size();i++)
  println(SceneList.size());
  for(int i = 0; i < SceneList.size(); i++)
  {
    if(SceneList.get(i).m_name == SceneName)
    {
      CurrScene = SceneList.get(i);
      return;
    }
  }
  println("Scene: "+ SceneName + " could not be found");
  CurrScene = new Scene("primitive");
}

void MakeGameScene()
{
  Scene TmpGameScene = new Scene("GameScene");
  //TO DO add scene objects here
  Player player = new Player();
  TmpGameScene.addObject(player);
  SceneList.add(TmpGameScene);
}

void MakeMainMenu()
{
  Scene TmpScene = new Scene("MainMenu");
    ButtonCallback bc = new ButtonCallback(ButtonAction.Click)
  {
    @Override
    public void Fire()
    {
      println("U did the CLICK!!!");
      LoadScene("GameScene");
    }
  };
  Button test = new Button("test",width/2-50,height/2-30,100,60);
  test.AddListener(bc);
  test.SetFillColor(color(255));
  test.UseFill(true);
  TmpScene.addObject(test);
  SceneList.add(TmpScene);
}

void setup()
{
  background(100);
  MakeMainMenu();
  MakeGameScene();
  //TO DO Make more scenes here && remember to add to scene list
  LoadScene("MainMenu");
  

}


void draw()
{
  //int s = millis();
  //background(100);
  CurrScene.SceneUpdate();



  
  //int e = millis();
  //deltaT = (float)(e - s+1)/1000;
  //println(deltaT);
  if(CurrScene.m_name == "GameScene")
  {
    if (frameCount%30 == 0) 
    {
      enemyL.Shoot();
      print(frameCount);
      println(" shot");
    }
    enemyL.MoveBullets();
    enemyL.Display();
  }
  

  /*for (Enemy_ball eb : eballs)
  {
    eb.Display();
  }*/
}
