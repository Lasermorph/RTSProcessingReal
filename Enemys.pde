class EnemyL
{
    final float BULLET_SPEED = 0.8;

    final float ANGLE_INCREMENT = PI/10; 
    PVector m_pos = new PVector(800, 500);
    PVector size = new PVector(20,20);
    final float eLS = 5;
    int health = 3;
    boolean armor = false;
    float m_a;
    Bullet[] m_bullets;

    EnemyL()
    {
        
        //m_pos = new PVector(x,y);

        m_bullets = new Bullet[0];
    }

    void Display()
    {
        color c = color(255, 0, 0);
        fill(c);
        ellipse(m_pos.x, m_pos.y, size.x, size.y);
        for (int i = 0; i < m_bullets.length; i++)
            m_bullets[i].Display();
    }

    void Shoot()
    {
        //m_a = PVector.angleBetween(player.playerPos, m_pos);
        Player p = (Player)CurrScene.getObjectByName("Player");
        m_a = PVector.angleBetween(p.playerPos, m_pos);
        Bullet m_newBullet = new Bullet(
        m_pos.x, m_pos.y, 
        cos(m_bullets.length*m_a)*BULLET_SPEED, sin(m_bullets.length*m_a)*BULLET_SPEED);
        // append it
        //m_bullets = (Bullet[]) append(m_bullets, m_newBullet);
        //Bullet m_newBullet = new Bullet(m_pos.x, m_pos.y, );
        m_bullets = (Bullet[]) append(m_bullets, m_newBullet);
    }

    void MoveBullets()
    {
        
        for (int i = 0; i < m_bullets.length; i++)
            m_bullets[i].Move();
    }

}

class EnemyT
{
    PVector m_pos = new PVector(0,0);
    final float eTS = 5;
    int health = 5;
    boolean armor = true;
}