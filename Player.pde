class Player extends GameObjBase
{
    PVector playerPos = new PVector(500,500);
    PVector playerSize = new PVector(0,0);
    PVector destination = new PVector(500,500);
    PVector nextPos = new PVector(0,0);
    final float s = 5;
    boolean armor = false;
    
    public Player()
    {
        super("Player");
    }

    @Override
    void Update()
    {
        CreateMovement();
    }

    void CreateMovement()
    {
        movement.Movement(playerPos, destination, s);
    }

    @Override
    void Draw()
    {
        pushMatrix();
        fill(255);
        translate(nextPos.x, nextPos.y);
        ellipse(0, 0, 30, 30);
        //imageMode(CENTER);
        //image(playerF, 0, 0);
        popMatrix();
    }

    void Create(PVector pos, PVector destination)
    {
        movement.MouseOnAction(destination);
        this.nextPos = new PVector(pos.x,pos.y);
    }



    

    /*void Reder()
    {
        pushMatrix();
        translate(playerPos.x, playerPos.y);
        //ellipse(0, 0, 30, 30);
        imageMode(CENTER);
        image(playerF, playerSize.x, playerSize.y);
        popMatrix();
    }*/

    
}