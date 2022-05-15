

class Scene 
{
  ArrayList<GameObjBase> m_SceneObjects = new ArrayList<GameObjBase>();
  String m_name = "";
  Scene(String name)
  {
    m_name = name;
  }
  Scene(Scene Sc)
  {
   m_name = Sc.m_name;
   m_SceneObjects = new ArrayList<GameObjBase>(Sc.m_SceneObjects);
  }
  Scene(String name, ArrayList<GameObjBase> List)
  {
     m_SceneObjects = new ArrayList<GameObjBase>(List);
     m_name = name;
  }
  
  void addObject(GameObjBase GO)
  {
   m_SceneObjects.add(GO);
   
  }
  GameObjBase getObjectByName(String n)
  {
    for(int i = 0; i < m_SceneObjects.size(); i++)
    {
      if(m_SceneObjects.get(i).getName() == n)
      {
        return m_SceneObjects.get(i);
      }
    }
    println("Object not found: " + n);
    throw new RuntimeException("Object not found: " + n);
  }
  void removeObject(int i)
  {
   m_SceneObjects.remove(i);  
  }
  void SceneUpdate()
  {
     for (int i = 0; i < this.m_SceneObjects.size(); ++i) 
    {
      if (this.m_SceneObjects.get(i).isVisible) 
      {
        this.m_SceneObjects.get(i).Draw();
        this.m_SceneObjects.get(i).Update();
      }  
    } 
  }
}
