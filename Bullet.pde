class Bullet
{
    PVector m_pos = new PVector();
    int m_size = 70;
    final float m_s = 0.5;
    boolean m_visible = false;
    PVector m_dir = new PVector();
    float m_d;
    boolean m_shot = false;
    Bullet(float x, float y, float dx, float dy)
    {
        m_pos.x = x;
        m_pos.y = y;
        m_dir.x = dx;
        m_dir.y = dy;
    }
    void Display()
    {
        pushMatrix();
        rectMode(CENTER);
        color c = color(0, 200, 0);
        fill(c);
        rect(m_pos.x, m_pos.y, m_size, m_size);
        popMatrix();
    }
    void Move()
    {
        m_pos.x += m_dir.x;
        m_pos.y += m_dir.y;
    }
        
}