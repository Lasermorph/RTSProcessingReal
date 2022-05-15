class GameObjBase
{
    protected String m_name;
    protected float m_x, m_y, m_width, m_height = 0;
    public boolean isVisible = true;
    public GameObjBase()
    {
        this.m_name = "default";
    }
    public GameObjBase(String name)
    {
        this.m_name = name;
    }
    public GameObjBase(String name, float x, float y, float w, float h)
    {
        this.m_name = name;
        this.m_x = x;
        this.m_y = y;
        this.m_width = w;
        this.m_height = h;
    }
    public void Update()
    {
        
    }

    public void Draw()
    {

    }
    public String getName()
    {
        return this.m_name;
    }
}
 
class CallBackBase
{
    public CallBackBase()
    {
    }
    public void Fire()
    {
        
    }
}

public enum ButtonAction
{
    Hover,
    Click
}

class ButtonCallback extends CallBackBase
{
    private ButtonAction m_listenAction;
    ButtonCallback(ButtonAction action)
    {
        m_listenAction = action;
    }
    public ButtonAction GetAction()
    {
        return m_listenAction;
    }
}

class Button extends GameObjBase
{
    private boolean m_fill = false;
    private color m_fillColor = color(255,255,255);
    private color m_borderColor = color(0,0,0);
    private color m_textColor = color(0);
    private int m_fontSize = 10;
    private ArrayList<ButtonCallback> m_listeners = new ArrayList<ButtonCallback>();
    public Button()
    {
        super("Button");
    }
    public Button(String n, float x, float y, float w, float h)
    {
        super(n, x, y, w, h);
    }
    public void SetFontSize(int nfs)
    {
      m_fontSize = nfs;
      
    }
    public int GetFontSize()
    {
      return m_fontSize;
    }
    public void SetTextColor(color ntxtclr)
    {
      m_textColor = ntxtclr;
    }
    public color GetFillColor()
    {
        return m_fillColor;
    }
    public void SetFillColor(color newFill)
    {
        m_fillColor = newFill;
    }
    public color GetBorderColor()
    {
        return m_borderColor;
    }
    public void SetBorderColor(color newC)
    {
        m_borderColor = newC;
    }
    public boolean UseFill(boolean fill)
    {
        m_fill = fill;
        return m_fill;
    }
    @Override
    public void Update()
    {
        
        if (mouseX > this.m_x && mouseX < this.m_x+this.m_width && mouseY > this.m_y && mouseY < this.m_y+this.m_height) 
        {
            for (int i = 0; i < m_listeners.size(); ++i) 
            {
                if (m_listeners.get(i).GetAction() == ButtonAction.Hover) 
                {
                    m_listeners.get(i).Fire();
                }    
            }
            if (mousePressed && (mouseButton == LEFT)) 
            {
                for (int i = 0; i < m_listeners.size(); ++i) 
                {
                    if (m_listeners.get(i).GetAction() == ButtonAction.Click) 
                    {
                        m_listeners.get(i).Fire();
                    }    
                }
            }
        }
    }
    @Override
    public void Draw()
    {
        pushMatrix();
        if (m_fill) 
        {
            fill(m_fillColor);
        }
        stroke(m_borderColor);
        rect(this.m_x,this.m_y,this.m_width,this.m_height);
        fill(m_textColor);
        textSize(m_fontSize);
        textAlign(CENTER,CENTER);
        text(m_name,this.m_x+this.m_width/2,this.m_y+this.m_height/2);
        popMatrix();       
    }
    public void AddListener(ButtonCallback bcb)
    {
        m_listeners.add(bcb);
    }
}
