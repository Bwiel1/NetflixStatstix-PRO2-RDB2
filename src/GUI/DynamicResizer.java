package GUI;

import javax.swing.*;
import java.awt.*;

public class DynamicResizer extends JPanel{

    private final JLabel label;

    public DynamicResizer(){
        this.label = new JLabel();
        label.setPreferredSize(new Dimension(400, 60));
    }

}
